#!/usr/bin/env bash
#
# broken-refs.sh — Scans all files across all layers for broken references
#
# Checks markdown links, frontmatter arrays referencing skills, templates,
# diagnostics, and playbooks. Reports every broken reference with its
# source file and expected path.
#
# Usage:
#   ./scripts/broken-refs.sh [--help] [--verbose]
#
# Exit codes:
#   0  No broken references found
#   1  One or more broken references found
#
# Author: Foreman Contributors

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILLS_DIR="$PROJECT_ROOT/skills"
TEMPLATES_DIR="$PROJECT_ROOT/output-templates"
DIAGNOSTICS_DIR="$PROJECT_ROOT/diagnostics"
PLAYBOOKS_DIR="$PROJECT_ROOT/playbooks"
HOOKS_DIR="$PROJECT_ROOT/hooks"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

VERBOSE=0
TOTAL_REFS=0
BROKEN_REFS=0
BROKEN_DETAILS=()

# ---------------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------------
usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Scans all Foreman .md files for broken internal references.

Checks:
  - Markdown links: [Name](path.md)
  - Frontmatter arrays: related_skills, applicable_skills, routes_to_skills,
    routes_to_templates, trigger_diagnostics, final_outputs, routes_to

Options:
  --help       Show this help message and exit
  --verbose    Print every reference checked (not just broken ones)

Exit codes:
  0  No broken references
  1  Broken references found
EOF
    exit 0
}

log_broken() {
    local file="$1" ref_type="$2" ref_val="$3" expected="$4"
    printf "  ${RED}BROKEN${NC} [%s] %s -> %s\n" "$ref_type" "$ref_val" "$expected"
    BROKEN_DETAILS+=("$file|$ref_type|$ref_val|$expected")
}

log_ok() {
    if [[ $VERBOSE -eq 1 ]]; then
        local ref_type="$1" ref_val="$2"
        printf "  ${GREEN}OK${NC}     [%s] %s\n" "$ref_type" "$ref_val"
    fi
}

extract_frontmatter() {
    local file="$1"
    sed -n '1{/^---$/!q}; 1,/^---$/{/^---$/!p}' "$file" | sed '1{/^---$/d}'
}

field_exists() {
    local fm="$1" key="$2"
    echo "$fm" | grep -qE "^${key}:"
}

get_list_items() {
    local fm="$1" key="$2"
    echo "$fm" | awk -v k="^${key}:" '$0 ~ k {found=1; next} found && /^[[:space:]]*-/{print; next} found{exit}' \
        | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/"
}

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

# Build lookup sets (associative arrays)
declare -A SKILL_SET
declare -A TEMPLATE_SET
declare -A DIAGNOSTIC_SET
declare -A PLAYBOOK_SET

build_lookups() {
    while IFS= read -r f; do
        local base
        base=$(basename "$f" .md)
        SKILL_SET["$base"]=1
    done < <(find "$SKILLS_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*")

    while IFS= read -r f; do
        local base
        base=$(basename "$f" .md)
        TEMPLATE_SET["$base"]=1
    done < <(find "$TEMPLATES_DIR" -mindepth 2 -name "*.md" -not -path "*/_schema/*")

    while IFS= read -r f; do
        local base
        base=$(basename "$f" .md)
        DIAGNOSTIC_SET["$base"]=1
    done < <(find "$DIAGNOSTICS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*")

    while IFS= read -r f; do
        local base
        base=$(basename "$f" .md)
        PLAYBOOK_SET["$base"]=1
    done < <(find "$PLAYBOOKS_DIR" -maxdepth 1 -name "*.md" -not -path "*/_schema/*")
}

# Check if a skill name exists
skill_exists() {
    [[ -n "${SKILL_SET[$1]+_}" ]]
}

template_exists() {
    [[ -n "${TEMPLATE_SET[$1]+_}" ]]
}

diagnostic_exists() {
    [[ -n "${DIAGNOSTIC_SET[$1]+_}" ]]
}

playbook_exists() {
    [[ -n "${PLAYBOOK_SET[$1]+_}" ]]
}

# Check a reference against a lookup, resolving with/without .md
check_ref() {
    local file="$1" ref_type="$2" ref_val="$3" lookup_fn="$4" expected_dir="$5"
    TOTAL_REFS=$((TOTAL_REFS + 1))
    local base="${ref_val%.md}"
    if $lookup_fn "$base"; then
        log_ok "$ref_type" "$ref_val"
    else
        BROKEN_REFS=$((BROKEN_REFS + 1))
        log_broken "$file" "$ref_type" "$ref_val" "$expected_dir/$base.md"
    fi
}

# Check frontmatter list items against a lookup
check_fm_list() {
    local file="$1" fm="$2" key="$3" ref_type="$4" lookup_fn="$5" expected_dir="$6"
    if field_exists "$fm" "$key"; then
        while IFS= read -r item; do
            [[ -z "$item" ]] && continue
            check_ref "$file" "$ref_type" "$item" "$lookup_fn" "$expected_dir"
        done < <(get_list_items "$fm" "$key")
    fi
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
# Build lookups
# ---------------------------------------------------------------------------
build_lookups

# ---------------------------------------------------------------------------
# Scan all .md files
# ---------------------------------------------------------------------------
printf "${BOLD}Scanning for broken references...${NC}\n\n"

ALL_MD_FILES=()
for dir in "$SKILLS_DIR" "$TEMPLATES_DIR" "$DIAGNOSTICS_DIR" "$PLAYBOOKS_DIR" "$HOOKS_DIR"; do
    while IFS= read -r f; do
        ALL_MD_FILES+=("$f")
    done < <(find "$dir" -name "*.md" -not -path "*/_schema/*" | sort)
done

for file in "${ALL_MD_FILES[@]}"; do
    rel_path="${file#"$PROJECT_ROOT/"}"
    file_has_broken=0

    # Skip non-content files
    head -1 "$file" | grep -q "^---$" || continue

    fm=$(extract_frontmatter "$file")
    printed_header=0

    print_header() {
        if [[ $printed_header -eq 0 ]]; then
            printf "${BOLD}%s${NC}\n" "$rel_path"
            printed_header=1
        fi
    }

    # -----------------------------------------------------------------------
    # 1. Markdown links: [Name](path.md) — resolve relative to file
    # -----------------------------------------------------------------------
    body=$(awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$file")
    while IFS= read -r link_match; do
        [[ -z "$link_match" ]] && continue
        # Extract the path from the markdown link
        link_path=$(echo "$link_match" | sed 's/.*](\([^)]*\)).*/\1/')
        # Skip external URLs, anchors, and empty links
        [[ "$link_path" == http* ]] && continue
        [[ "$link_path" == \#* ]] && continue
        [[ -z "$link_path" ]] && continue
        # Strip any anchor
        link_path="${link_path%%#*}"
        [[ -z "$link_path" ]] && continue
        # Resolve relative path
        file_dir=$(dirname "$file")
        resolved="$file_dir/$link_path"
        TOTAL_REFS=$((TOTAL_REFS + 1))
        if [[ -f "$resolved" ]]; then
            log_ok "markdown-link" "$link_path"
        else
            print_header
            BROKEN_REFS=$((BROKEN_REFS + 1))
            log_broken "$file" "markdown-link" "$link_path" "$resolved"
        fi
    done < <(echo "$body" | grep -oE '\[[^]]*\]\([^)]+\)' || true)

    # -----------------------------------------------------------------------
    # 2. Frontmatter arrays — skill references
    # -----------------------------------------------------------------------
    for key in related_skills applicable_skills routes_to_skills; do
        if field_exists "$fm" "$key"; then
            print_header_done=0
            while IFS= read -r item; do
                [[ -z "$item" ]] && continue
                TOTAL_REFS=$((TOTAL_REFS + 1))
                local_base="${item%.md}"
                if skill_exists "$local_base"; then
                    log_ok "$key" "$item"
                else
                    print_header
                    BROKEN_REFS=$((BROKEN_REFS + 1))
                    log_broken "$file" "$key" "$item" ".claude/.claude/skills/*/$local_base.md"
                fi
            done < <(get_list_items "$fm" "$key")
        fi
    done

    # -----------------------------------------------------------------------
    # 3. Frontmatter arrays — template references
    # -----------------------------------------------------------------------
    for key in routes_to_templates final_outputs; do
        if field_exists "$fm" "$key"; then
            while IFS= read -r item; do
                [[ -z "$item" ]] && continue
                TOTAL_REFS=$((TOTAL_REFS + 1))
                local_base="${item%.md}"
                if template_exists "$local_base"; then
                    log_ok "$key" "$item"
                else
                    print_header
                    BROKEN_REFS=$((BROKEN_REFS + 1))
                    log_broken "$file" "$key" "$item" ".claude/.claude/output-templates/*/$local_base.md"
                fi
            done < <(get_list_items "$fm" "$key")
        fi
    done

    # -----------------------------------------------------------------------
    # 4. Frontmatter arrays — diagnostic references
    # -----------------------------------------------------------------------
    if field_exists "$fm" "trigger_diagnostics"; then
        while IFS= read -r item; do
            [[ -z "$item" ]] && continue
            TOTAL_REFS=$((TOTAL_REFS + 1))
            local_base="${item%.md}"
            if diagnostic_exists "$local_base"; then
                log_ok "trigger_diagnostics" "$item"
            else
                print_header
                BROKEN_REFS=$((BROKEN_REFS + 1))
                log_broken "$file" "trigger_diagnostics" "$item" ".claude/.claude/diagnostics/$local_base.md"
            fi
        done < <(get_list_items "$fm" "trigger_diagnostics")
    fi

    # -----------------------------------------------------------------------
    # 5. Nested routes_to (hooks) — diagnostics, skills, playbooks
    # -----------------------------------------------------------------------
    if field_exists "$fm" "routes_to"; then
        # diagnostics
        while IFS= read -r item; do
            [[ -z "$item" ]] && continue
            TOTAL_REFS=$((TOTAL_REFS + 1))
            local_base="${item%.md}"
            if diagnostic_exists "$local_base"; then
                log_ok "routes_to.diagnostics" "$item"
            else
                print_header
                BROKEN_REFS=$((BROKEN_REFS + 1))
                log_broken "$file" "routes_to.diagnostics" "$item" ".claude/.claude/diagnostics/$local_base.md"
            fi
        done < <(get_nested_list_items "$fm" "routes_to" "diagnostics")

        # skills
        while IFS= read -r item; do
            [[ -z "$item" ]] && continue
            TOTAL_REFS=$((TOTAL_REFS + 1))
            local_base="${item%.md}"
            if skill_exists "$local_base"; then
                log_ok "routes_to.skills" "$item"
            else
                print_header
                BROKEN_REFS=$((BROKEN_REFS + 1))
                log_broken "$file" "routes_to.skills" "$item" ".claude/.claude/skills/*/$local_base.md"
            fi
        done < <(get_nested_list_items "$fm" "routes_to" "skills")

        # playbooks
        while IFS= read -r item; do
            [[ -z "$item" ]] && continue
            TOTAL_REFS=$((TOTAL_REFS + 1))
            local_base="${item%.md}"
            if playbook_exists "$local_base"; then
                log_ok "routes_to.playbooks" "$item"
            else
                print_header
                BROKEN_REFS=$((BROKEN_REFS + 1))
                log_broken "$file" "routes_to.playbooks" "$item" ".claude/.claude/playbooks/$local_base.md"
            fi
        done < <(get_nested_list_items "$fm" "routes_to" "playbooks")
    fi

    # -----------------------------------------------------------------------
    # 6. Playbook steps — skill references
    # -----------------------------------------------------------------------
    if field_exists "$fm" "steps"; then
        while IFS= read -r skill_line; do
            skill_ref=$(echo "$skill_line" | sed 's/^[[:space:]]*skill:[[:space:]]*//' | sed 's/^"\(.*\)"$/\1/' | sed "s/^'\(.*\)'$/\1/")
            [[ -z "$skill_ref" ]] && continue
            TOTAL_REFS=$((TOTAL_REFS + 1))
            if skill_exists "$skill_ref"; then
                log_ok "steps.skill" "$skill_ref"
            else
                print_header
                BROKEN_REFS=$((BROKEN_REFS + 1))
                log_broken "$file" "steps.skill" "$skill_ref" ".claude/.claude/skills/*/$skill_ref.md"
            fi
        done < <(echo "$fm" | grep -E '^[[:space:]]+skill:' | sed 's/^[[:space:]]*//')
    fi

done

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
echo ""
printf "${BOLD}===========================================================${NC}\n"
printf "${BOLD}  Broken References Summary${NC}\n"
printf "${BOLD}===========================================================${NC}\n"
printf "  Total references checked: %d\n" "$TOTAL_REFS"
if [[ $BROKEN_REFS -gt 0 ]]; then
    printf "  ${RED}Broken references:       %d${NC}\n" "$BROKEN_REFS"
else
    printf "  ${GREEN}Broken references:       %d${NC}\n" "$BROKEN_REFS"
fi
printf "${BOLD}===========================================================${NC}\n"

if [[ $BROKEN_REFS -gt 0 ]]; then
    exit 1
fi
exit 0
