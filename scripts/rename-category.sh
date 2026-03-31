#!/usr/bin/env bash
#
# rename-category.sh — Rename a skill category and update ALL references.
#
# Usage:
#   ./scripts/rename-category.sh --from old-name --to new-name            (preview)
#   ./scripts/rename-category.sh --from old-name --to new-name --confirm  (execute)
#   ./scripts/rename-category.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Defaults ──────────────────────────────────────────────────────────
FROM=""
TO=""
CONFIRM=false

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
rename-category.sh — Rename a skill category and update ALL references.

USAGE
  ./scripts/rename-category.sh --from OLD --to NEW            Preview changes
  ./scripts/rename-category.sh --from OLD --to NEW --confirm  Execute changes
  ./scripts/rename-category.sh --help

OPTIONS
  --from OLD       Current category slug (e.g., "ai-leadership")
  --to NEW         New category slug in kebab-case (e.g., "ai-strategy")
  --confirm        Actually execute the rename (without this, preview only)
  --help           Show this help message

UPDATES
  - Directory: .claude/.claude/skills/OLD/ -> .claude/.claude/skills/NEW/
  - Frontmatter: category field in all skills in the renamed directory
  - Cross-references: Related Skills links across ALL skills
  - Diagnostics: any reference to .claude/.claude/skills/OLD/
  - Playbooks: any reference to .claude/.claude/skills/OLD/
  - Hooks: any reference to .claude/.claude/skills/OLD/
  - CLAUDE.md: category references
EOF
    exit 0
}

# ── Helpers ───────────────────────────────────────────────────────────
die() { echo "ERROR: $*" >&2; exit 1; }

validate_kebab_case() {
    local name="$1"
    if [[ ! "$name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
        die "Category must be kebab-case: '$name'"
    fi
}

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)  usage ;;
        --from)     FROM="$2"; shift 2 ;;
        --to)       TO="$2"; shift 2 ;;
        --confirm)  CONFIRM=true; shift ;;
        *)          die "Unknown option: $1. Use --help for usage." ;;
    esac
done

# ── Validate ──────────────────────────────────────────────────────────
[[ -z "$FROM" ]] && die "--from is required."
[[ -z "$TO" ]] && die "--to is required."
validate_kebab_case "$FROM"
validate_kebab_case "$TO"

FROM_DIR="$PROJECT_ROOT/.claude/skills/$FROM"
TO_DIR="$PROJECT_ROOT/.claude/skills/$TO"

[[ ! -d "$FROM_DIR" ]] && die "Source category does not exist: $FROM_DIR"
[[ -d "$TO_DIR" ]] && die "Target category already exists: $TO_DIR"

# ── Scan for References ──────────────────────────────────────────────
echo ""
echo "  CATEGORY RENAME: $FROM -> $TO"
echo "  $(printf '%60s' '' | tr ' ' '=')"
echo ""

# 1. Directory rename
skill_count=$(find "$FROM_DIR" -maxdepth 1 -name "*.md" | wc -l | tr -d ' ')
echo "  1. Directory rename: .claude/.claude/skills/$FROM/ -> .claude/.claude/skills/$TO/  ($skill_count files)"
echo ""

# 2. Frontmatter category field
echo "  2. Frontmatter updates (category: \"$FROM\" -> category: \"$TO\"):"
for f in "$FROM_DIR"/*.md; do
    [[ ! -f "$f" ]] && continue
    echo "       $(basename "$f")"
done
echo ""

# 3. Cross-references in all skills
echo "  3. Cross-reference updates (../$FROM/ -> ../$TO/):"
ref_files=()
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    if grep -q "$FROM" "$skill_file" 2>/dev/null; then
        ref_files+=("$skill_file")
        echo "       $(echo "$skill_file" | sed "s|$PROJECT_ROOT/||")"
    fi
done
echo "       ${#ref_files[@]} file(s) with references"
echo ""

# 4. Diagnostics, Playbooks, Hooks
echo "  4. Other references:"
other_refs=0
for search_dir in diagnostics playbooks hooks; do
    for f in "$PROJECT_ROOT/$search_dir"/*.md; do
        [[ ! -f "$f" ]] && continue
        if grep -q "$FROM" "$f" 2>/dev/null; then
            echo "       $(echo "$f" | sed "s|$PROJECT_ROOT/||")"
            other_refs=$((other_refs + 1))
        fi
    done
done

# CLAUDE.md
if grep -q "$FROM" "$PROJECT_ROOT/CLAUDE.md" 2>/dev/null; then
    echo "       CLAUDE.md"
    other_refs=$((other_refs + 1))
fi
echo "       $other_refs file(s)"
echo ""

# ── Execute or Preview ────────────────────────────────────────────────
if [[ "$CONFIRM" == false ]]; then
    echo "  $(printf '%60s' '' | tr ' ' '-')"
    echo "  Preview mode. No changes written."
    echo "  Add --confirm to execute the rename."
    echo ""
    exit 0
fi

echo "  $(printf '%60s' '' | tr ' ' '-')"
echo "  Executing rename..."
echo ""

# Step 1: Rename directory
mv "$FROM_DIR" "$TO_DIR"
echo "  [OK] Renamed directory: .claude/.claude/skills/$FROM/ -> .claude/.claude/skills/$TO/"

# Step 2: Update frontmatter in renamed skills
for f in "$TO_DIR"/*.md; do
    [[ ! -f "$f" ]] && continue
    sed -i '' "s/^category: \"$FROM\"/category: \"$TO\"/" "$f"
done
echo "  [OK] Updated frontmatter category field in $skill_count file(s)"

# Step 3: Update cross-references in ALL skill files
updated=0
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    if grep -q "$FROM" "$skill_file" 2>/dev/null; then
        sed -i '' "s|$FROM|$TO|g" "$skill_file"
        updated=$((updated + 1))
    fi
done
echo "  [OK] Updated cross-references in $updated skill file(s)"

# Step 4: Update diagnostics, playbooks, hooks
for search_dir in diagnostics playbooks hooks; do
    for f in "$PROJECT_ROOT/$search_dir"/*.md; do
        [[ ! -f "$f" ]] && continue
        if grep -q "$FROM" "$f" 2>/dev/null; then
            sed -i '' "s|$FROM|$TO|g" "$f"
        fi
    done
done
echo "  [OK] Updated diagnostics, playbooks, and hooks"

# Step 5: Update CLAUDE.md
if grep -q "$FROM" "$PROJECT_ROOT/CLAUDE.md" 2>/dev/null; then
    sed -i '' "s|$FROM|$TO|g" "$PROJECT_ROOT/CLAUDE.md"
    echo "  [OK] Updated CLAUDE.md"
fi

echo ""
echo "  Rename complete: $FROM -> $TO"
echo "  Run ./scripts/stats.sh to verify the new state."
echo ""

exit 0
