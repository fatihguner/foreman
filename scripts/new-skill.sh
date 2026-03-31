#!/usr/bin/env bash
#
# new-skill.sh — Create a new skill file from the schema template.
#
# Usage:
#   ./scripts/new-skill.sh                                               (interactive)
#   ./scripts/new-skill.sh --name "my-skill" --category frameworks       (non-interactive)
#   ./scripts/new-skill.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE="$PROJECT_ROOT/.claude/skills/_schema/skill-template.md"

# ── Defaults ──────────────────────────────────────────────────────────
NAME=""
CATEGORY=""
COMPLEXITY=""
STAGES=()
AUTHOR="Fatih Guner"

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
new-skill.sh — Create a new skill file from the schema template.

USAGE
  ./scripts/new-skill.sh                          Interactive mode
  ./scripts/new-skill.sh [OPTIONS]                Non-interactive mode

OPTIONS
  --name NAME           Skill name in kebab-case (e.g., "porters-five-forces")
  --category CATEGORY   Category slug (e.g., "frameworks", "leadership")
  --complexity LEVEL    basic | intermediate | advanced
  --stage STAGE         Comma-separated stages: idea,validation,early-traction,growth,scale
  --author AUTHOR       Author name (default: "Fatih Guner")
  --help                Show this help message

EXAMPLES
  ./scripts/new-skill.sh --name "my-skill" --category frameworks --complexity intermediate
  ./scripts/new-skill.sh --name "my-skill" --category leadership --complexity basic --stage "idea,validation"
EOF
    exit 0
}

# ── Helpers ───────────────────────────────────────────────────────────
die() { echo "ERROR: $*" >&2; exit 1; }

validate_kebab_case() {
    local name="$1"
    if [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
        die "Name must be kebab-case (lowercase letters, numbers, hyphens only): '$name'"
    fi
}

get_categories() {
    local cats=()
    for dir in "$PROJECT_ROOT"/.claude/skills/*/; do
        local base
        base="$(basename "$dir")"
        [[ "$base" == "_schema" ]] && continue
        cats+=("$base")
    done
    echo "${cats[@]}"
}

validate_category() {
    local cat="$1"
    local valid_cats
    valid_cats="$(get_categories)"
    for c in $valid_cats; do
        [[ "$c" == "$cat" ]] && return 0
    done
    die "Unknown category '$cat'. Available: $valid_cats"
}

validate_complexity() {
    local level="$1"
    case "$level" in
        basic|intermediate|advanced) return 0 ;;
        *) die "Complexity must be one of: basic, intermediate, advanced" ;;
    esac
}

VALID_STAGES=("idea" "validation" "early-traction" "growth" "scale")

validate_stage() {
    local stage="$1"
    for s in "${VALID_STAGES[@]}"; do
        [[ "$s" == "$stage" ]] && return 0
    done
    die "Unknown stage '$stage'. Valid stages: ${VALID_STAGES[*]}"
}

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)  usage ;;
        --name)     NAME="$2"; shift 2 ;;
        --category) CATEGORY="$2"; shift 2 ;;
        --complexity) COMPLEXITY="$2"; shift 2 ;;
        --stage)    IFS=',' read -ra STAGES <<< "$2"; shift 2 ;;
        --author)   AUTHOR="$2"; shift 2 ;;
        *)          die "Unknown option: $1. Use --help for usage." ;;
    esac
done

# ── Interactive Prompts ───────────────────────────────────────────────
if [[ -z "$NAME" ]]; then
    read -rp "Skill name (kebab-case, e.g., 'porters-five-forces'): " NAME
fi
validate_kebab_case "$NAME"

if [[ -z "$CATEGORY" ]]; then
    echo ""
    echo "Available categories:"
    i=1
    cats_array=()
    for c in $(get_categories); do
        echo "  $i) $c"
        cats_array+=("$c")
        ((i++))
    done
    echo ""
    read -rp "Select category (number or name): " cat_input
    if [[ "$cat_input" =~ ^[0-9]+$ ]]; then
        idx=$((cat_input - 1))
        if [[ $idx -ge 0 && $idx -lt ${#cats_array[@]} ]]; then
            CATEGORY="${cats_array[$idx]}"
        else
            die "Invalid selection: $cat_input"
        fi
    else
        CATEGORY="$cat_input"
    fi
fi
validate_category "$CATEGORY"

if [[ -z "$COMPLEXITY" ]]; then
    echo ""
    echo "Complexity levels:"
    echo "  1) basic"
    echo "  2) intermediate"
    echo "  3) advanced"
    read -rp "Select complexity (number or name): " comp_input
    case "$comp_input" in
        1) COMPLEXITY="basic" ;;
        2) COMPLEXITY="intermediate" ;;
        3) COMPLEXITY="advanced" ;;
        *) COMPLEXITY="$comp_input" ;;
    esac
fi
validate_complexity "$COMPLEXITY"

if [[ ${#STAGES[@]} -eq 0 ]]; then
    echo ""
    echo "Stages (select all that apply, comma-separated):"
    echo "  idea, validation, early-traction, growth, scale"
    read -rp "Stages [idea,validation,early-traction,growth,scale]: " stage_input
    if [[ -z "$stage_input" ]]; then
        STAGES=("idea" "validation" "early-traction" "growth" "scale")
    else
        IFS=',' read -ra STAGES <<< "$stage_input"
    fi
fi

for s in "${STAGES[@]}"; do
    s="$(echo "$s" | xargs)"  # trim whitespace
    validate_stage "$s"
done

# ── Validate Target ──────────────────────────────────────────────────
TARGET_DIR="$PROJECT_ROOT/.claude/skills/$CATEGORY"
TARGET_FILE="$TARGET_DIR/$NAME.md"

if [[ ! -d "$TARGET_DIR" ]]; then
    die "Category directory does not exist: $TARGET_DIR"
fi

if [[ -f "$TARGET_FILE" ]]; then
    die "Skill already exists: $TARGET_FILE"
fi

if [[ ! -f "$TEMPLATE" ]]; then
    die "Template not found: $TEMPLATE"
fi

# ── Build Stage YAML ─────────────────────────────────────────────────
stage_yaml=""
for s in "${STAGES[@]}"; do
    s="$(echo "$s" | xargs)"
    stage_yaml+="  - ${s}\n"
done

# ── Generate File ─────────────────────────────────────────────────────
cp "$TEMPLATE" "$TARGET_FILE"

# Replace frontmatter placeholders
sed -i '' "s/^name: .*/name: \"${NAME}\"/" "$TARGET_FILE"
sed -i '' "s/^category: .*/category: \"${CATEGORY}\"/" "$TARGET_FILE"
sed -i '' "s/^complexity: .*/complexity: \"${COMPLEXITY}\"/" "$TARGET_FILE"
sed -i '' "s/^author: .*/author: \"${AUTHOR}\"/" "$TARGET_FILE"

# Replace stage block
python3 -c "
import re, sys
with open('$TARGET_FILE', 'r') as f:
    content = f.read()

stage_yaml = '''stage:
$(for s in "${STAGES[@]}"; do s="$(echo "$s" | xargs)"; echo "  - $s"; done)'''

content = re.sub(
    r'stage:\n(?:  - \w[\w-]*\n)+',
    stage_yaml + '\n',
    content,
    count=1
)
with open('$TARGET_FILE', 'w') as f:
    f.write(content)
"

# ── Confirm ───────────────────────────────────────────────────────────
echo ""
echo "Created: $TARGET_FILE"
echo ""
echo "  Name:       $NAME"
echo "  Category:   $CATEGORY"
echo "  Complexity: $COMPLEXITY"
echo "  Stages:     ${STAGES[*]}"
echo "  Author:     $AUTHOR"
echo ""

# Open in editor if available
if [[ -n "${EDITOR:-}" ]]; then
    echo "Opening in \$EDITOR ($EDITOR)..."
    "$EDITOR" "$TARGET_FILE"
fi

exit 0
