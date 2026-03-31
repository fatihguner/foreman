#!/usr/bin/env bash
#
# anonymize-author.sh — Remove all references to a specified author name.
#
# Usage:
#   ./scripts/anonymize-author.sh --name "John Smith"                   (dry-run, all files)
#   ./scripts/anonymize-author.sh --name "John Smith" --in .claude/.claude/skills/      (dry-run, scoped)
#   ./scripts/anonymize-author.sh --name "John Smith" --apply           (execute)
#   ./scripts/anonymize-author.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Defaults ──────────────────────────────────────────────────────────
AUTHOR_NAME=""
SEARCH_DIR=""
APPLY=false

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
anonymize-author.sh — Remove all references to a specified author name.

USAGE
  ./scripts/anonymize-author.sh --name "NAME"                Dry-run, all .md files
  ./scripts/anonymize-author.sh --name "NAME" --in DIR       Dry-run, scoped to DIR
  ./scripts/anonymize-author.sh --name "NAME" --apply        Execute replacements
  ./scripts/anonymize-author.sh --help

OPTIONS
  --name NAME       The author name to remove (exact match, case-sensitive)
  --in DIR          Scope the search to a directory (relative to project root)
  --apply           Execute replacements (default is dry-run)
  --help            Show this help message

REPLACEMENT STRATEGY
  - Frontmatter "author:" field -> "Anonymous Contributor"
  - Body text references -> context-appropriate alternatives:
    "the framework", "the author", "the research", "the text"

EXAMPLES
  ./scripts/anonymize-author.sh --name "John Smith"
  ./scripts/anonymize-author.sh --name "John Smith" --in .claude/.claude/skills/ --apply
EOF
    exit 0
}

# ── Helpers ───────────────────────────────────────────────────────────
die() { echo "ERROR: $*" >&2; exit 1; }

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h) usage ;;
        --name)    AUTHOR_NAME="$2"; shift 2 ;;
        --in)      SEARCH_DIR="$2"; shift 2 ;;
        --apply)   APPLY=true; shift ;;
        *)         die "Unknown option: $1. Use --help for usage." ;;
    esac
done

[[ -z "$AUTHOR_NAME" ]] && die "--name is required."

# Resolve search directory
if [[ -n "$SEARCH_DIR" ]]; then
    if [[ "$SEARCH_DIR" != /* ]]; then
        SEARCH_DIR="$PROJECT_ROOT/$SEARCH_DIR"
    fi
    [[ ! -d "$SEARCH_DIR" ]] && die "Directory not found: $SEARCH_DIR"
else
    SEARCH_DIR="$PROJECT_ROOT"
fi

# ── Scan ──────────────────────────────────────────────────────────────
echo ""
if [[ "$APPLY" == true ]]; then
    echo "  ANONYMIZE AUTHOR: \"$AUTHOR_NAME\" (APPLYING CHANGES)"
else
    echo "  ANONYMIZE AUTHOR: \"$AUTHOR_NAME\" (DRY RUN)"
fi
echo "  Scope: $(echo "$SEARCH_DIR" | sed "s|$PROJECT_ROOT/||")"
echo "  $(printf '%60s' '' | tr ' ' '=')"
echo ""

total_replacements=0
total_files=0

while IFS= read -r file; do
    [[ ! -f "$file" ]] && continue

    # Count occurrences
    count=$(grep -c "$AUTHOR_NAME" "$file" 2>/dev/null || echo 0)
    [[ "$count" -eq 0 ]] && continue

    rel_path=$(echo "$file" | sed "s|$PROJECT_ROOT/||")
    total_files=$((total_files + 1))
    total_replacements=$((total_replacements + count))

    echo "  $rel_path  ($count occurrence(s))"

    if [[ "$APPLY" == true ]]; then
        # Replace in frontmatter author field
        sed -i '' "s/^author: \"$AUTHOR_NAME\"/author: \"Anonymous Contributor\"/" "$file"

        # Replace in body text with context-appropriate alternatives
        # First, handle possessive forms (e.g., "John Smith's framework")
        sed -i '' "s/${AUTHOR_NAME}'s framework/the framework/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s research/the research/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s model/the model/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s theory/the theory/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s work/the work/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s method/the method/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s approach/the approach/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s book/the text/g" "$file"
        sed -i '' "s/${AUTHOR_NAME}'s/the author's/g" "$file"

        # Replace standalone name occurrences (not in frontmatter, handled above)
        # Use a general replacement for remaining body references
        sed -i '' "s/$AUTHOR_NAME/the author/g" "$file"

        # Restore the frontmatter replacement (in case the general one caught it)
        sed -i '' "s/^author: \"the author\"/author: \"Anonymous Contributor\"/" "$file"

        echo "    -> Replaced"
    fi

done < <(find "$SEARCH_DIR" -name "*.md" -not -path "*/.git/*" -not -path "*/_schema/*" -not -path "*/node_modules/*")

echo ""
echo "  $(printf '%60s' '' | tr ' ' '-')"
echo "  Files affected:    $total_files"
echo "  Total occurrences: $total_replacements"

if [[ "$APPLY" == false ]]; then
    echo ""
    echo "  Dry-run mode. No changes written."
    echo "  Add --apply to execute replacements."
fi
echo ""

exit 0
