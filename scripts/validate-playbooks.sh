#!/usr/bin/env bash
#
# validate-playbooks.sh — Validates all playbook files
#
# Checks frontmatter fields, cross-references to .claude/.claude/diagnostics/.claude/skills/templates,
# required body sections, and prohibited phrases.
#
# Usage:
#   ./scripts/validate-playbooks.sh [--help] [--verbose]
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
PLAYBOOKS_DIR="$PROJECT_ROOT/playbooks"
SKILLS_DIR="$PROJECT_ROOT/skills"
DIAGNOSTICS_DIR="$PROJECT_ROOT/diagnostics"
TEMPLATES_DIR="$PROJECT_ROOT/output-templates"

REQUIRED_FIELDS=(name description trigger_diagnostics steps final_outputs estimated_duration complexity stage author)
REQUIRED_SECTIONS=("When to Use" "Prerequisites" "The Sequence" "Decision Point" "Final Deliverable" "Common Pitfalls")
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

Validates all playbook .md files under .claude/.claude/playbooks/.

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

get_list_items() {
    local fm="$1" key="$2"
    echo "$fm" | awk -v k="^${key}:" '$0 ~ k {found=1; next} found && /^[[:space:]]*-/{print; next} found{exit}' \
        | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/"
}

collect_skill_names() {
    find "$SKILLS_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
}

collect_diagnostic_names() {
    find "$DIAGNOSTICS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
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

VALID_DIAGNOSTICS=()
while IFS= read -r d; do
    VALID_DIAGNOSTICS+=("$d")
done < <(collect_diagnostic_names)

VALID_TEMPLATES=()
while IFS= read -r t; do
    VALID_TEMPLATES+=("$t")
done < <(collect_template_names)

# ---------------------------------------------------------------------------
# Main validation loop
# ---------------------------------------------------------------------------
printf "${BOLD}Validating playbooks...${NC}\n"

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

        # --- trigger_diagnostics reference existing diagnostic files ---
        if field_exists "$fm" "trigger_diagnostics"; then
            while IFS= read -r diag; do
                [[ -z "$diag" ]] && continue
                found=0
                for vd in "${VALID_DIAGNOSTICS[@]}"; do
                    # Match with or without .md suffix
                    vd_base="${vd%.md}"
                    if [[ "$diag" == "$vd_base" || "$diag" == "$vd" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("trigger_diagnostics references non-existent diagnostic: $diag")
                fi
            done < <(get_list_items "$fm" "trigger_diagnostics")
        fi

        # --- Each step's skill references an existing skill file ---
        # Steps are structured as:
        #   steps:
        #     - skill: "skill-name"
        #       purpose: "..."
        #       output: "..."
        if field_exists "$fm" "steps"; then
            while IFS= read -r skill_ref; do
                skill_ref=$(echo "$skill_ref" | sed 's/^[[:space:]]*skill:[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/")
                [[ -z "$skill_ref" ]] && continue
                found=0
                for vs in "${VALID_SKILLS[@]}"; do
                    if [[ "$skill_ref" == "$vs" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("steps references non-existent skill: $skill_ref")
                fi
            done < <(echo "$fm" | grep -E '^[[:space:]]+skill:' | sed 's/^[[:space:]]*//')
        fi

        # --- final_outputs reference existing template files ---
        if field_exists "$fm" "final_outputs"; then
            while IFS= read -r out; do
                [[ -z "$out" ]] && continue
                found=0
                for vt in "${VALID_TEMPLATES[@]}"; do
                    vt_base="${vt%.md}"
                    if [[ "$out" == "$vt_base" || "$out" == "$vt" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("final_outputs references non-existent template: $out")
                fi
            done < <(get_list_items "$fm" "final_outputs")
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

done < <(find "$PLAYBOOKS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*" | sort)

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
printf "${BOLD}Playbooks validation summary:${NC}\n"
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
