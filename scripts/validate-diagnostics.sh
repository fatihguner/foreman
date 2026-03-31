#!/usr/bin/env bash
#
# validate-diagnostics.sh — Validates all diagnostic files
#
# Checks frontmatter fields, list contents, cross-references to skills
# and templates, required body sections, and prohibited phrases.
#
# Usage:
#   ./scripts/validate-diagnostics.sh [--help] [--verbose]
#
# Exit codes:
#   0  All files pass validation
#   1  One or more files failed validation
#
# Author: Foreman Contributors

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
DIAGNOSTICS_DIR="$PROJECT_ROOT/diagnostics"
SKILLS_DIR="$PROJECT_ROOT/skills"
TEMPLATES_DIR="$PROJECT_ROOT/output-templates"

REQUIRED_FIELDS=(name description entry_symptoms possible_diagnoses routes_to_skills author)
REQUIRED_SECTIONS=("Entry Symptoms" "Triage Questions" "Diagnosis Map" "Routing" "Red Flags")
PROHIBITED_PHRASES=(
    "In today's fast-paced"
    "Let's dive in"
    "Let's explore"
    "Without further ado"
    "It's important to note"
    "At the end of the day"
)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

VERBOSE=0
TOTAL=0
PASSED=0
FAILED=0

# ---------------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------------
usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Validates all diagnostic .md files under .claude/.claude/diagnostics/.

Options:
  --help       Show this help message and exit
  --verbose    Print passing checks as well as failures

Exit codes:
  0  All files pass
  1  One or more failures
EOF
    exit 0
}

log_fail() {
    printf "  ${RED}FAIL${NC} %s\n" "$1"
}

log_pass() {
    if [[ $VERBOSE -eq 1 ]]; then
        printf "  ${GREEN}PASS${NC} %s\n" "$1"
    fi
}

extract_frontmatter() {
    local file="$1"
    sed -n '1{/^---$/!q}; 1,/^---$/{/^---$/!p}' "$file" | sed '1{/^---$/d}'
}

get_field() {
    local fm="$1" key="$2"
    echo "$fm" | grep -E "^${key}:" | head -1 | sed "s/^${key}:[[:space:]]*//" | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/"
}

field_exists() {
    local fm="$1" key="$2"
    echo "$fm" | grep -qE "^${key}:"
}

has_frontmatter() {
    local file="$1"
    head -1 "$file" | grep -q "^---$"
}

# Get list items under a YAML key
get_list_items() {
    local fm="$1" key="$2"
    echo "$fm" | awk -v k="^${key}:" '$0 ~ k {found=1; next} found && /^[[:space:]]*-/{print; next} found{exit}' \
        | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/"
}

collect_skill_names() {
    find "$SKILLS_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
}

collect_template_names() {
    find "$TEMPLATES_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
}

# ---------------------------------------------------------------------------
# Parse arguments
# ---------------------------------------------------------------------------
for arg in "$@"; do
    case "$arg" in
        --help) usage ;;
        --verbose) VERBOSE=1 ;;
        *) echo "Unknown option: $arg"; usage ;;
    esac
done

# ---------------------------------------------------------------------------
# Collect valid names
# ---------------------------------------------------------------------------
VALID_SKILLS=()
while IFS= read -r s; do
    VALID_SKILLS+=("$s")
done < <(collect_skill_names)

VALID_TEMPLATES=()
while IFS= read -r t; do
    VALID_TEMPLATES+=("$t")
done < <(collect_template_names)

# ---------------------------------------------------------------------------
# Main validation loop
# ---------------------------------------------------------------------------
printf "${BOLD}Validating diagnostics...${NC}\n"

while IFS= read -r file; do
    TOTAL=$((TOTAL + 1))
    rel_path="${file#"$PROJECT_ROOT/"}"
    errors=()

    if ! has_frontmatter "$file"; then
        errors+=("Missing YAML frontmatter (file must start with ---)")
    else
        fm=$(extract_frontmatter "$file")

        # --- Required fields ---
        for field in "${REQUIRED_FIELDS[@]}"; do
            if ! field_exists "$fm" "$field"; then
                errors+=("Missing required field: $field")
            fi
        done

        # --- entry_symptoms is non-empty list ---
        if field_exists "$fm" "entry_symptoms"; then
            symptom_count=$(get_list_items "$fm" "entry_symptoms" | grep -c . || true)
            if [[ $symptom_count -eq 0 ]]; then
                errors+=("entry_symptoms is empty (must be a non-empty list)")
            fi
        fi

        # --- routes_to_skills reference existing skill files ---
        if field_exists "$fm" "routes_to_skills"; then
            while IFS= read -r sk; do
                [[ -z "$sk" ]] && continue
                found=0
                for vs in "${VALID_SKILLS[@]}"; do
                    if [[ "$sk" == "$vs" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("routes_to_skills references non-existent skill: $sk")
                fi
            done < <(get_list_items "$fm" "routes_to_skills")
        fi

        # --- routes_to_templates reference existing template files (if present) ---
        if field_exists "$fm" "routes_to_templates"; then
            while IFS= read -r tmpl; do
                [[ -z "$tmpl" ]] && continue
                found=0
                for vt in "${VALID_TEMPLATES[@]}"; do
                    if [[ "$tmpl" == "$vt" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("routes_to_templates references non-existent template: $tmpl")
                fi
            done < <(get_list_items "$fm" "routes_to_templates")
        fi
    fi

    # --- Required body sections ---
    body=$(awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$file")
    for section in "${REQUIRED_SECTIONS[@]}"; do
        if ! echo "$body" | grep -q "^## ${section}"; then
            errors+=("Missing required body section: ## $section")
        fi
    done

    # --- Prohibited phrases ---
    for phrase in "${PROHIBITED_PHRASES[@]}"; do
        if echo "$body" | grep -qi "$phrase"; then
            errors+=("Contains prohibited phrase: \"$phrase\"")
        fi
    done

    # --- Report ---
    if [[ ${#errors[@]} -eq 0 ]]; then
        printf "${GREEN}PASS${NC} %s\n" "$rel_path"
        PASSED=$((PASSED + 1))
    else
        printf "${RED}FAIL${NC} %s\n" "$rel_path"
        FAILED=$((FAILED + 1))
        for err in "${errors[@]}"; do
            log_fail "$err"
        done
    fi

done < <(find "$DIAGNOSTICS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*" | sort)

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
printf "${BOLD}Diagnostics validation summary:${NC}\n"
printf "  Total:  %d\n" "$TOTAL"
printf "  ${GREEN}Passed: %d${NC}\n" "$PASSED"
if [[ $FAILED -gt 0 ]]; then
    printf "  ${RED}Failed: %d${NC}\n" "$FAILED"
else
    printf "  Failed: %d\n" "$FAILED"
fi

if [[ $FAILED -gt 0 ]]; then
    exit 1
fi
exit 0
