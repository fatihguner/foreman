#!/usr/bin/env bash
#
# new-diagnostic.sh — Create a new diagnostic file from the schema template.
#
# Usage:
#   ./scripts/new-diagnostic.sh                       (interactive)
#   ./scripts/new-diagnostic.sh --name "my-diagnosis"  (non-interactive)
#   ./scripts/new-diagnostic.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE="$PROJECT_ROOT/.claude/diagnostics/_schema/diagnostic-template.md"
TARGET_DIR="$PROJECT_ROOT/diagnostics"

# ── Defaults ──────────────────────────────────────────────────────────
NAME=""
SYMPTOMS=()
AUTHOR="Fatih Guner"

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
new-diagnostic.sh — Create a new diagnostic file from the schema template.

USAGE
  ./scripts/new-diagnostic.sh                          Interactive mode
  ./scripts/new-diagnostic.sh [OPTIONS]                Non-interactive mode

OPTIONS
  --name NAME           Diagnostic name in kebab-case (e.g., "revenue-diagnosis")
  --symptom SYMPTOM     Entry symptom (can be repeated: --symptom "X" --symptom "Y")
  --author AUTHOR       Author name (default: "Fatih Guner")
  --help                Show this help message

EXAMPLES
  ./scripts/new-diagnostic.sh --name "revenue-diagnosis"
  ./scripts/new-diagnostic.sh --name "churn-diagnosis" --symptom "customers are leaving" --symptom "high churn rate"
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

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)   usage ;;
        --name)      NAME="$2"; shift 2 ;;
        --symptom)   SYMPTOMS+=("$2"); shift 2 ;;
        --author)    AUTHOR="$2"; shift 2 ;;
        *)           die "Unknown option: $1. Use --help for usage." ;;
    esac
done

# ── Interactive Prompts ───────────────────────────────────────────────
if [[ -z "$NAME" ]]; then
    read -rp "Diagnostic name (kebab-case, e.g., 'revenue-diagnosis'): " NAME
fi
validate_kebab_case "$NAME"

if [[ ${#SYMPTOMS[@]} -eq 0 ]]; then
    echo ""
    echo "Enter entry symptoms (natural language phrases entrepreneurs might say)."
    echo "Press Enter on an empty line when done. Minimum 1 symptom."
    while true; do
        read -rp "  Symptom: " symptom
        [[ -z "$symptom" ]] && break
        SYMPTOMS+=("$symptom")
    done
    if [[ ${#SYMPTOMS[@]} -eq 0 ]]; then
        die "At least one entry symptom is required."
    fi
fi

# ── Validate Target ──────────────────────────────────────────────────
TARGET_FILE="$TARGET_DIR/$NAME.md"

if [[ -f "$TARGET_FILE" ]]; then
    die "Diagnostic already exists: $TARGET_FILE"
fi

if [[ ! -f "$TEMPLATE" ]]; then
    die "Template not found: $TEMPLATE"
fi

# ── Build Symptoms YAML ──────────────────────────────────────────────
symptoms_yaml=""
for s in "${SYMPTOMS[@]}"; do
    symptoms_yaml+="  - \"${s}\"\n"
done

# ── Generate File ─────────────────────────────────────────────────────
cp "$TEMPLATE" "$TARGET_FILE"

# Replace frontmatter placeholders
sed -i '' "s/^name: .*/name: \"${NAME}\"/" "$TARGET_FILE"
sed -i '' "s/^author: .*/author: \"${AUTHOR}\"/" "$TARGET_FILE"

# Replace entry_symptoms block
if [[ ${#SYMPTOMS[@]} -gt 0 ]]; then
    python3 -c "
import re
with open('$TARGET_FILE', 'r') as f:
    content = f.read()

symptoms = $(python3 -c "import json; print(json.dumps([s for s in '''${SYMPTOMS[*]}'''.split('  ')]))" 2>/dev/null || echo '[]')

# Build replacement
lines = ['entry_symptoms:']
for s in '''${SYMPTOMS[*]}'''.strip().split('  '):
    s = s.strip()
    if s:
        lines.append(f'  - \"{s}\"')

replacement = '\n'.join(lines) + '\n'
content = re.sub(
    r'entry_symptoms:\n(?:  - \"[^\"]*\"\n)+',
    replacement,
    content,
    count=1
)
with open('$TARGET_FILE', 'w') as f:
    f.write(content)
"
fi

# ── Confirm ───────────────────────────────────────────────────────────
echo ""
echo "Created: $TARGET_FILE"
echo ""
echo "  Name:     $NAME"
echo "  Symptoms: ${#SYMPTOMS[@]} entry symptom(s)"
for s in "${SYMPTOMS[@]}"; do
    echo "            - $s"
done
echo "  Author:   $AUTHOR"
echo ""

# Open in editor if available
if [[ -n "${EDITOR:-}" ]]; then
    echo "Opening in \$EDITOR ($EDITOR)..."
    "$EDITOR" "$TARGET_FILE"
fi

exit 0
