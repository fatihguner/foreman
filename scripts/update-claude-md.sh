#!/usr/bin/env bash
#
# update-claude-md.sh — Auto-update CLAUDE.md with current project statistics.
#
# Updates:
#   - Skill Directory Mapping section with current categories and counts
# Does NOT touch: writing style, architecture, schema, or other sections.
#
# Usage:
#   ./scripts/update-claude-md.sh            Preview changes (dry-run)
#   ./scripts/update-claude-md.sh --apply    Write changes to CLAUDE.md
#   ./scripts/update-claude-md.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
CLAUDE_MD="$PROJECT_ROOT/CLAUDE.md"

# ── Defaults ──────────────────────────────────────────────────────────
APPLY=false

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
update-claude-md.sh — Auto-update CLAUDE.md with current statistics.

USAGE
  ./scripts/update-claude-md.sh            Preview changes (dry-run)
  ./scripts/update-claude-md.sh --apply    Write changes to CLAUDE.md
  ./scripts/update-claude-md.sh --help     Show this help message

UPDATES
  - Skill Directory Mapping: category list with file counts
  Does NOT modify writing style, architecture, schema, or other sections.
EOF
    exit 0
}

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h) usage ;;
        --apply)   APPLY=true; shift ;;
        *)         echo "ERROR: Unknown option: $1" >&2; exit 1 ;;
    esac
done

if [[ ! -f "$CLAUDE_MD" ]]; then
    echo "ERROR: CLAUDE.md not found at $CLAUDE_MD" >&2
    exit 1
fi

# ── Build Updated Directory Mapping ───────────────────────────────────
new_mapping=".claude/.claude/skills/
  _schema/              # Skill template and validation schema"

# Collect categories with counts, sorted alphabetically
for dir in "$PROJECT_ROOT"/.claude/skills/*/; do
    cat_name="$(basename "$dir")"
    [[ "$cat_name" == "_schema" ]] && continue
    count=$(find "$dir" -maxdepth 1 -name "*.md" | wc -l | tr -d ' ')

    # Determine source book from CLAUDE.md current content
    source=""
    current_line=$(grep "^  ${cat_name}/" "$CLAUDE_MD" 2>/dev/null | head -1 || true)
    if [[ -n "$current_line" && "$current_line" =~ "#"[[:space:]]*(.*) ]]; then
        source="${BASH_REMATCH[1]}"
    fi

    # Pad the directory name for alignment
    dir_entry="  ${cat_name}/"
    if [[ $count -gt 0 ]]; then
        # Pad with spaces for alignment
        padding=$((22 - ${#dir_entry}))
        [[ $padding -lt 1 ]] && padding=1
        spaces=$(printf '%*s' "$padding" '')
        if [[ -n "$source" ]]; then
            new_mapping+=$'\n'"${dir_entry}${spaces}# ${count} files — ${source#From: }"
        else
            new_mapping+=$'\n'"${dir_entry}${spaces}# ${count} files"
        fi
    else
        padding=$((22 - ${#dir_entry}))
        [[ $padding -lt 1 ]] && padding=1
        spaces=$(printf '%*s' "$padding" '')
        if [[ -n "$source" ]]; then
            new_mapping+=$'\n'"${dir_entry}${spaces}# ${source}"
        else
            new_mapping+=$'\n'"${dir_entry}"
        fi
    fi
done

new_mapping+=$'\n'"  [future-category]/    # From: future books"

# ── Apply Update via Python ───────────────────────────────────────────
TEMP_FILE=$(mktemp)
trap 'rm -f "$TEMP_FILE"' EXIT

python3 << 'PYEOF' - "$CLAUDE_MD" "$TEMP_FILE" "$new_mapping"
import sys
import re

claude_md_path = sys.argv[1]
temp_path = sys.argv[2]
new_mapping = sys.argv[3]

with open(claude_md_path, 'r') as f:
    content = f.read()

# Replace the Skill Directory Mapping code block
# Find the ```\nskills/ ... ``` block under "### Skill Directory Mapping"
pattern = r'(### Skill Directory Mapping\s*\n\s*```\n)(.*?)(```)'
match = re.search(pattern, content, re.DOTALL)

if match:
    new_content = match.group(1) + new_mapping + '\n' + match.group(3)
    content = content[:match.start()] + new_content + content[match.end():]

with open(temp_path, 'w') as f:
    f.write(content)
PYEOF

# ── Show Diff ─────────────────────────────────────────────────────────
echo ""
echo "  Changes to CLAUDE.md:"
echo "  $(printf '%56s' '' | tr ' ' '-')"
echo ""

diff_output=$(diff -u "$CLAUDE_MD" "$TEMP_FILE" 2>/dev/null || true)

if [[ -z "$diff_output" ]]; then
    echo "  No changes detected. CLAUDE.md is up to date."
    echo ""
    exit 0
fi

echo "$diff_output"
echo ""

# ── Apply or Preview ─────────────────────────────────────────────────
if [[ "$APPLY" == true ]]; then
    cp "$TEMP_FILE" "$CLAUDE_MD"
    echo "  CLAUDE.md updated successfully."
else
    echo "  Dry-run mode. Use --apply to write changes."
fi
echo ""

exit 0
