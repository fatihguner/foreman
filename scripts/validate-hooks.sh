#!/usr/bin/env bash
#
# validate-hooks.sh — Validates all hook files
#
# Checks frontmatter fields, trigger pattern counts, priority values,
# cross-references, required body sections, and prohibited phrases.
#
# Usage:
#   ./scripts/validate-hooks.sh [--help] [--verbose]
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
HOOKS_DIR="$PROJECT_ROOT/hooks"
SKILLS_DIR="$PROJECT_ROOT/skills"
DIAGNOSTICS_DIR="$PROJECT_ROOT/diagnostics"
PLAYBOOKS_DIR="$PROJECT_ROOT/playbooks"

REQUIRED_FIELDS=(name description trigger_patterns priority author)
VALID_PRIORITIES=(high medium low)
REQUIRED_SECTIONS=("Trigger Patterns" "Intent Classification" "Routing Logic" "Disambiguation" "Example Conversations")
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

Validates all hook .md files under .claude/hooks/.

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

# Get list items under a nested YAML key (e.g., routes_to > diagnostics)
get_nested_list_items() {
    local fm="$1" parent="$2" child="$3"
    echo "$fm" | awk -v p="^${parent}:" -v c="^[[:space:]]+${child}:" '
        $0 ~ p {in_parent=1; next}
        in_parent && $0 ~ c {in_child=1; next}
        in_child && /^[[:space:]]{4,}-/{print; next}
        in_child && /^[[:space:]]*-/{print; next}
        in_child && !/^[[:space:]]/{exit}
        in_parent && !/^[[:space:]]/{exit}
    ' | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/"
}

collect_skill_names() {
    find "$SKILLS_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
}

collect_diagnostic_names() {
    find "$DIAGNOSTICS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
}

collect_playbook_names() {
    find "$PLAYBOOKS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*" -exec basename {} .md \;
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

VALID_PLAYBOOKS=()
while IFS= read -r p; do
    VALID_PLAYBOOKS+=("$p")
done < <(collect_playbook_names)

# ---------------------------------------------------------------------------
# Main validation loop
# ---------------------------------------------------------------------------
printf "${BOLD}Validating hooks...${NC}\n"

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

        # --- trigger_patterns: non-empty list with at least 5 ---
        if field_exists "$fm" "trigger_patterns"; then
            pattern_count=$(get_list_items "$fm" "trigger_patterns" | grep -c . || true)
            if [[ $pattern_count -lt 5 ]]; then
                errors+=("trigger_patterns has $pattern_count items (minimum 5 required)")
            fi
        fi

        # --- priority is valid ---
        pri_val=$(get_field "$fm" "priority")
        if [[ -n "$pri_val" ]]; then
            valid_pri=0
            for vp in "${VALID_PRIORITIES[@]}"; do
                if [[ "$pri_val" == "$vp" ]]; then
                    valid_pri=1
                    break
                fi
            done
            if [[ $valid_pri -eq 0 ]]; then
                errors+=("priority '$pri_val' is not one of: ${VALID_PRIORITIES[*]}")
            fi
        fi

        # --- routes_to > diagnostics reference existing files ---
        if field_exists "$fm" "routes_to"; then
            while IFS= read -r diag; do
                [[ -z "$diag" ]] && continue
                found=0
                for vd in "${VALID_DIAGNOSTICS[@]}"; do
                    vd_base="${vd%.md}"
                    if [[ "$diag" == "$vd_base" || "$diag" == "$vd" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("routes_to.diagnostics references non-existent diagnostic: $diag")
                fi
            done < <(get_nested_list_items "$fm" "routes_to" "diagnostics")

            # --- routes_to > skills reference existing files ---
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
                    errors+=("routes_to.skills references non-existent skill: $sk")
                fi
            done < <(get_nested_list_items "$fm" "routes_to" "skills")

            # --- routes_to > playbooks reference existing files ---
            while IFS= read -r pb; do
                [[ -z "$pb" ]] && continue
                found=0
                for vp in "${VALID_PLAYBOOKS[@]}"; do
                    vp_base="${vp%.md}"
                    if [[ "$pb" == "$vp_base" || "$pb" == "$vp" ]]; then
                        found=1
                        break
                    fi
                done
                if [[ $found -eq 0 ]]; then
                    errors+=("routes_to.playbooks references non-existent playbook: $pb")
                fi
            done < <(get_nested_list_items "$fm" "routes_to" "playbooks")
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

done < <(find "$HOOKS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*" | sort)

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
printf "${BOLD}Hooks validation summary:${NC}\n"
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
