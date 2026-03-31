#!/usr/bin/env bash
#
# validate-templates.sh — Validates all output template files
#
# Checks frontmatter fields, audience matching, skill references,
# and prohibited phrases.
#
# Usage:
#   ./scripts/validate-templates.sh [--help] [--verbose]
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
TEMPLATES_DIR="$PROJECT_ROOT/output-templates"
SKILLS_DIR="$PROJECT_ROOT/skills"

REQUIRED_FIELDS=(name description audience applicable_skills format author)
VALID_AUDIENCES=(investor board team self client)
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

Validates all output template .md files under .claude/.claude/output-templates/*/.

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

collect_skill_names() {
    find "$SKILLS_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
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
# Collect valid skill names
# ---------------------------------------------------------------------------
VALID_SKILLS=()
while IFS= read -r s; do
    VALID_SKILLS+=("$s")
done < <(collect_skill_names)

# ---------------------------------------------------------------------------
# Main validation loop
# ---------------------------------------------------------------------------
printf "${BOLD}Validating output templates...${NC}\n"

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

        # --- audience is valid ---
        aud_val=$(get_field "$fm" "audience")
        if [[ -n "$aud_val" ]]; then
            valid_aud=0
            for va in "${VALID_AUDIENCES[@]}"; do
                if [[ "$aud_val" == "$va" ]]; then
                    valid_aud=1
                    break
                fi
            done
            if [[ $valid_aud -eq 0 ]]; then
                errors+=("audience '$aud_val' is not one of: ${VALID_AUDIENCES[*]}")
            fi
        fi

        # --- audience matches parent directory ---
        dir_name=$(basename "$(dirname "$file")")
        if [[ -n "$aud_val" && "$aud_val" != "$dir_name" ]]; then
            errors+=("audience '$aud_val' does not match directory '$dir_name'")
        fi

        # --- applicable_skills reference existing files ---
        if field_exists "$fm" "applicable_skills"; then
            while IFS= read -r sk; do
                sk=$(echo "$sk" | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/")
                [[ -z "$sk" ]] && continue
                found=0
                for vs in "${VALID_SKILLS[@]}"; do
                    if [[ "$sk" == "$vs" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("applicable_skills references non-existent skill: $sk")
                fi
            done < <(echo "$fm" | awk '/^applicable_skills:/{found=1; next} found && /^[[:space:]]*-/{print; next} found{exit}')
        fi
    fi

    # --- Prohibited phrases ---
    body=$(awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$file")
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

done < <(find "$TEMPLATES_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*" | sort)

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
printf "${BOLD}Output templates validation summary:${NC}\n"
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
