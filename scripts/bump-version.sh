#!/usr/bin/env bash
#
# bump-version.sh — Batch version bump for skill files.
#
# Usage:
#   ./scripts/bump-version.sh --file .claude/.claude/skills/frameworks/porters-five-forces.md --to 2.0.0
#   ./scripts/bump-version.sh --category frameworks --to 1.2.0
#   ./scripts/bump-version.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Defaults ──────────────────────────────────────────────────────────
FILE=""
CATEGORY=""
VERSION=""

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
bump-version.sh — Batch version bump for skill files.

USAGE
  ./scripts/bump-version.sh --file PATH --to VERSION
  ./scripts/bump-version.sh --category SLUG --to VERSION
  ./scripts/bump-version.sh --help

OPTIONS
  --file PATH           Single file to bump (relative or absolute path)
  --category SLUG       Bump all files in a skill category (e.g., "frameworks")
  --to VERSION          Target version in semver format (e.g., "1.2.0")
  --help                Show this help message

EXAMPLES
  ./scripts/bump-version.sh --file .claude/.claude/skills/frameworks/porters-five-forces.md --to 2.0.0
  ./scripts/bump-version.sh --category frameworks --to 1.2.0
  ./scripts/bump-version.sh --category leadership --to 1.1.0
EOF
    exit 0
}

# ── Helpers ───────────────────────────────────────────────────────────
die() { echo "ERROR: $*" >&2; exit 1; }

validate_semver() {
    local ver="$1"
    if [[ ! "$ver" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        die "Version must be in semver format (e.g., 1.2.0): '$ver'"
    fi
}

bump_file() {
    local file="$1"
    local new_version="$2"

    if [[ ! -f "$file" ]]; then
        echo "  SKIP  $file (not found)"
        return
    fi

    # Extract current version
    local current
    current=$(grep '^version:' "$file" 2>/dev/null | head -1 | sed 's/^version: *"\{0,1\}\([^"]*\)"\{0,1\}/\1/' || echo "unknown")

    if [[ "$current" == "$new_version" ]]; then
        echo "  SKIP  $(basename "$file")  ($current -> $new_version, already at target)"
        return
    fi

    # Replace version in frontmatter
    sed -i '' "s/^version: .*/version: \"${new_version}\"/" "$file"

    echo "  BUMP  $(basename "$file")  ($current -> $new_version)"
}

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)    usage ;;
        --file)       FILE="$2"; shift 2 ;;
        --category)   CATEGORY="$2"; shift 2 ;;
        --to)         VERSION="$2"; shift 2 ;;
        *)            die "Unknown option: $1. Use --help for usage." ;;
    esac
done

# ── Validate ──────────────────────────────────────────────────────────
[[ -z "$VERSION" ]] && die "--to VERSION is required."
validate_semver "$VERSION"
[[ -z "$FILE" && -z "$CATEGORY" ]] && die "Provide --file or --category."
[[ -n "$FILE" && -n "$CATEGORY" ]] && die "Use either --file or --category, not both."

# ── Execute ───────────────────────────────────────────────────────────
echo ""
echo "  VERSION BUMP -> $VERSION"
echo "  $(printf '%56s' '' | tr ' ' '-')"
echo ""

bumped=0

if [[ -n "$FILE" ]]; then
    # Resolve path relative to project root if needed
    if [[ "$FILE" != /* ]]; then
        FILE="$PROJECT_ROOT/$FILE"
    fi
    bump_file "$FILE" "$VERSION"
    bumped=1
fi

if [[ -n "$CATEGORY" ]]; then
    target_dir="$PROJECT_ROOT/.claude/skills/$CATEGORY"
    if [[ ! -d "$target_dir" ]]; then
        die "Category directory not found: $target_dir"
    fi

    for skill_file in "$target_dir"/*.md; do
        [[ ! -f "$skill_file" ]] && continue
        [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
        bump_file "$skill_file" "$VERSION"
        bumped=$((bumped + 1))
    done
fi

echo ""
echo "  Processed $bumped file(s)."
echo ""

exit 0
