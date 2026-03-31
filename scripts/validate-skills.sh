#!/usr/bin/env bash
#
# validate-skills.sh — Validates all skill files across all categories
#
# Checks frontmatter fields, naming conventions, body structure,
# prohibited phrases, and cross-references.
#
# Usage:
#   ./scripts/validate-skills.sh [--help] [--verbose]
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
SKILLS_DIR="$PROJECT_ROOT/skills"

REQUIRED_FIELDS=(name description version category complexity stage tags related_skills author)
VALID_COMPLEXITIES=(basic intermediate advanced)
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

Validates all skill .md files under .claude/.claude/skills/*/.

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

log_warn() {
    printf "  ${YELLOW}WARN${NC} %s\n" "$1"
}

log_pass() {
    if [[ $VERBOSE -eq 1 ]]; then
        printf "  ${GREEN}PASS${NC} %s\n" "$1"
    fi
}

# Extract YAML frontmatter (between first --- and second ---)
# Outputs the frontmatter lines (without the --- delimiters).
extract_frontmatter() {
    local file="$1"
    sed -n '1{/^---$/!q}; 1,/^---$/{/^---$/!p}' "$file" | sed '1{/^---$/d}'
}

# Get a scalar frontmatter value by key.
# Handles quoted and unquoted values.
get_field() {
    local fm="$1" key="$2"
    echo "$fm" | grep -E "^${key}:" | head -1 | sed "s/^${key}:[[:space:]]*//" | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/"
}

# Check if a frontmatter key exists (scalar or list).
field_exists() {
    local fm="$1" key="$2"
    echo "$fm" | grep -qE "^${key}:"
}

# Check if file starts with ---
has_frontmatter() {
    local file="$1"
    head -1 "$file" | grep -q "^---$"
}

# Count ## headings in the body (after frontmatter)
count_sections() {
    local file="$1"
    # Skip frontmatter, then count lines starting with ##
    awk 'BEGIN{fm=0; count=0} /^---$/{fm++; next} fm>=2 && /^## /{count++} END{print count}' "$file"
}

# Collect all valid skill names from all category directories
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
# Collect valid skill names for cross-reference checks
# ---------------------------------------------------------------------------
VALID_SKILLS=()
while IFS= read -r s; do
    VALID_SKILLS+=("$s")
done < <(collect_skill_names)

# ---------------------------------------------------------------------------
# Main validation loop
# ---------------------------------------------------------------------------
printf "${BOLD}Validating skills...${NC}\n"

while IFS= read -r file; do
    TOTAL=$((TOTAL + 1))
    rel_path="${file#"$PROJECT_ROOT/"}"
    errors=()

    # --- Frontmatter existence ---
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

        # --- name: kebab-case ---
        name_val=$(get_field "$fm" "name")
        if [[ -n "$name_val" ]]; then
            if ! echo "$name_val" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$'; then
                errors+=("name '$name_val' is not valid kebab-case (lowercase, numbers, hyphens only)")
            fi
        fi

        # --- description: non-empty and under 1024 chars ---
        desc_val=$(get_field "$fm" "description")
        if [[ -z "$desc_val" ]]; then
            errors+=("description is empty")
        elif [[ ${#desc_val} -gt 1024 ]]; then
            errors+=("description exceeds 1024 characters (${#desc_val})")
        fi

        # --- category matches directory ---
        cat_val=$(get_field "$fm" "category")
        dir_name=$(basename "$(dirname "$file")")
        if [[ -n "$cat_val" && "$cat_val" != "$dir_name" ]]; then
            errors+=("category '$cat_val' does not match directory '$dir_name'")
        fi

        # --- complexity is valid ---
        comp_val=$(get_field "$fm" "complexity")
        if [[ -n "$comp_val" ]]; then
            valid_comp=0
            for vc in "${VALID_COMPLEXITIES[@]}"; do
                if [[ "$comp_val" == "$vc" ]]; then
                    valid_comp=1
                    break
                fi
            done
            if [[ $valid_comp -eq 0 ]]; then
                errors+=("complexity '$comp_val' is not one of: ${VALID_COMPLEXITIES[*]}")
            fi
        fi

        # --- related_skills reference existing files ---
        if field_exists "$fm" "related_skills"; then
            while IFS= read -r rs; do
                rs=$(echo "$rs" | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/")
                [[ -z "$rs" ]] && continue
                found=0
                for vs in "${VALID_SKILLS[@]}"; do
                    if [[ "$rs" == "$vs" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("related_skills references non-existent skill: $rs")
                fi
            done < <(echo "$fm" | awk '/^related_skills:/{found=1; next} found && /^[[:space:]]*-/{print; next} found{exit}')
        fi
    fi

    # --- Body: at least 7 ## sections ---
    section_count=$(count_sections "$file")
    if [[ $section_count -lt 7 ]]; then
        errors+=("Body has $section_count ## sections (minimum 7 required)")
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

done < <(find "$SKILLS_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*" | sort)

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
printf "${BOLD}Skills validation summary:${NC}\n"
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
