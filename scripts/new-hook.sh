#!/usr/bin/env bash
#
# new-hook.sh — Create a new hook file from the schema template.
#
# Usage:
#   ./scripts/new-hook.sh                                      (interactive)
#   ./scripts/new-hook.sh --name "my-hook" --priority high     (non-interactive)
#   ./scripts/new-hook.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE="$PROJECT_ROOT/hooks/_schema/hook-template.md"
TARGET_DIR="$PROJECT_ROOT/hooks"

# ── Defaults ──────────────────────────────────────────────────────────
NAME=""
PRIORITY=""
AUTHOR="Fatih Guner"

VALID_PRIORITIES=("high" "medium" "low")

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
new-hook.sh — Create a new hook file from the schema template.

USAGE
  ./scripts/new-hook.sh                          Interactive mode
  ./scripts/new-hook.sh [OPTIONS]                Non-interactive mode

OPTIONS
  --name NAME           Hook name in kebab-case (e.g., "revenue-hook")
  --priority LEVEL      high | medium | low
  --author AUTHOR       Author name (default: "Fatih Guner")
  --help                Show this help message

EXAMPLES
  ./scripts/new-hook.sh --name "revenue-hook" --priority high
  ./scripts/new-hook.sh --name "personal-growth-hook" --priority low
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

validate_priority() {
    local pri="$1"
    for p in "${VALID_PRIORITIES[@]}"; do
        [[ "$p" == "$pri" ]] && return 0
    done
    die "Unknown priority '$pri'. Valid priorities: ${VALID_PRIORITIES[*]}"
}

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)    usage ;;
        --name)       NAME="$2"; shift 2 ;;
        --priority)   PRIORITY="$2"; shift 2 ;;
        --author)     AUTHOR="$2"; shift 2 ;;
        *)            die "Unknown option: $1. Use --help for usage." ;;
    esac
done

# ── Interactive Prompts ───────────────────────────────────────────────
if [[ -z "$NAME" ]]; then
    read -rp "Hook name (kebab-case, e.g., 'revenue-hook'): " NAME
fi
validate_kebab_case "$NAME"

if [[ -z "$PRIORITY" ]]; then
    echo ""
    echo "Priority levels:"
    echo "  1) high    — Urgent business problems (revenue, churn, fundraising)"
    echo "  2) medium  — Operational/tactical issues (hiring, processes, tools)"
    echo "  3) low     — Development/growth topics (learning, personal growth)"
    read -rp "Select priority (number or name): " pri_input
    case "$pri_input" in
        1) PRIORITY="high" ;;
        2) PRIORITY="medium" ;;
        3) PRIORITY="low" ;;
        *) PRIORITY="$pri_input" ;;
    esac
fi
validate_priority "$PRIORITY"

# ── Validate Target ──────────────────────────────────────────────────
TARGET_FILE="$TARGET_DIR/$NAME.md"

if [[ -f "$TARGET_FILE" ]]; then
    die "Hook already exists: $TARGET_FILE"
fi

if [[ ! -f "$TEMPLATE" ]]; then
    die "Template not found: $TEMPLATE"
fi

# ── Generate File ─────────────────────────────────────────────────────
cp "$TEMPLATE" "$TARGET_FILE"

# Replace frontmatter placeholders
sed -i '' "s/^name: .*/name: \"${NAME}\"/" "$TARGET_FILE"
sed -i '' "s/^priority: .*/priority: \"${PRIORITY}\"/" "$TARGET_FILE"
sed -i '' "s/^author: .*/author: \"${AUTHOR}\"/" "$TARGET_FILE"

# ── Confirm ───────────────────────────────────────────────────────────
echo ""
echo "Created: $TARGET_FILE"
echo ""
echo "  Name:     $NAME"
echo "  Priority: $PRIORITY"
echo "  Author:   $AUTHOR"
echo ""

# Open in editor if available
if [[ -n "${EDITOR:-}" ]]; then
    echo "Opening in \$EDITOR ($EDITOR)..."
    "$EDITOR" "$TARGET_FILE"
fi

exit 0
