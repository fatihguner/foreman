#!/usr/bin/env bash
#
# new-playbook.sh — Create a new playbook file from the schema template.
#
# Usage:
#   ./scripts/new-playbook.sh                                          (interactive)
#   ./scripts/new-playbook.sh --name "my-playbook" --complexity basic  (non-interactive)
#   ./scripts/new-playbook.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE="$PROJECT_ROOT/.claude/playbooks/_schema/playbook-template.md"
TARGET_DIR="$PROJECT_ROOT/playbooks"

# ── Defaults ──────────────────────────────────────────────────────────
NAME=""
COMPLEXITY=""
STAGES=()
AUTHOR="Fatih Guner"

VALID_STAGES=("idea" "validation" "early-traction" "growth" "scale")

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
new-playbook.sh — Create a new playbook file from the schema template.

USAGE
  ./scripts/new-playbook.sh                          Interactive mode
  ./scripts/new-playbook.sh [OPTIONS]                Non-interactive mode

OPTIONS
  --name NAME           Playbook name in kebab-case (e.g., "pivot-playbook")
  --complexity LEVEL    basic | intermediate | advanced
  --stage STAGES        Comma-separated stages: idea,validation,early-traction,growth,scale
  --author AUTHOR       Author name (default: "Fatih Guner")
  --help                Show this help message

EXAMPLES
  ./scripts/new-playbook.sh --name "pivot-playbook" --complexity intermediate
  ./scripts/new-playbook.sh --name "launch-playbook" --complexity basic --stage "validation,early-traction"
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

validate_complexity() {
    local level="$1"
    case "$level" in
        basic|intermediate|advanced) return 0 ;;
        *) die "Complexity must be one of: basic, intermediate, advanced" ;;
    esac
}

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
        --help|-h)     usage ;;
        --name)        NAME="$2"; shift 2 ;;
        --complexity)  COMPLEXITY="$2"; shift 2 ;;
        --stage)       IFS=',' read -ra STAGES <<< "$2"; shift 2 ;;
        --author)      AUTHOR="$2"; shift 2 ;;
        *)             die "Unknown option: $1. Use --help for usage." ;;
    esac
done

# ── Interactive Prompts ───────────────────────────────────────────────
if [[ -z "$NAME" ]]; then
    read -rp "Playbook name (kebab-case, e.g., 'pivot-playbook'): " NAME
fi
validate_kebab_case "$NAME"

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
    read -rp "Stages [validation,early-traction]: " stage_input
    if [[ -z "$stage_input" ]]; then
        STAGES=("validation" "early-traction")
    else
        IFS=',' read -ra STAGES <<< "$stage_input"
    fi
fi

for s in "${STAGES[@]}"; do
    s="$(echo "$s" | xargs)"
    validate_stage "$s"
done

# ── Validate Target ──────────────────────────────────────────────────
TARGET_FILE="$TARGET_DIR/$NAME.md"

if [[ -f "$TARGET_FILE" ]]; then
    die "Playbook already exists: $TARGET_FILE"
fi

if [[ ! -f "$TEMPLATE" ]]; then
    die "Template not found: $TEMPLATE"
fi

# ── Generate File ─────────────────────────────────────────────────────
cp "$TEMPLATE" "$TARGET_FILE"

# Replace frontmatter placeholders
sed -i '' "s/^name: .*/name: \"${NAME}\"/" "$TARGET_FILE"
sed -i '' "s/^complexity: .*/complexity: \"${COMPLEXITY}\"/" "$TARGET_FILE"
sed -i '' "s/^author: .*/author: \"${AUTHOR}\"/" "$TARGET_FILE"

# Replace stage block
python3 -c "
import re
with open('$TARGET_FILE', 'r') as f:
    content = f.read()

stages = [s.strip() for s in '${STAGES[*]}'.split()]
stage_yaml = 'stage:\n' + ''.join(f'  - {s}\n' for s in stages)

content = re.sub(
    r'stage:\n(?:  - [\w-]+\n)+',
    stage_yaml,
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
