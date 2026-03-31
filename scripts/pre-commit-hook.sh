#!/usr/bin/env bash
#
# pre-commit-hook.sh — Git pre-commit hook for Foreman.
#
# Runs on staged .md files only. Designed to complete in under 2 seconds.
#
# Checks:
#   1. Prohibited phrases (from CLAUDE.md writing style guide)
#   2. Frontmatter existence
#   3. Blocked author names (configurable)
#
# Install:
#   ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
#
# Usage:
#   Runs automatically on git commit. Exit 1 blocks the commit.
#   ./scripts/pre-commit-hook.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Handle case where script is called from .git/hooks/ via symlink
if [[ -L "${BASH_SOURCE[0]}" ]]; then
    REAL_SCRIPT="$(readlink "${BASH_SOURCE[0]}")"
    if [[ "$REAL_SCRIPT" != /* ]]; then
        REAL_SCRIPT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd "$(dirname "$REAL_SCRIPT")" && pwd)/$(basename "$REAL_SCRIPT")"
    fi
    SCRIPT_DIR="$(dirname "$REAL_SCRIPT")"
fi

PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Help ──────────────────────────────────────────────────────────────
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
    cat <<'EOF'
pre-commit-hook.sh — Git pre-commit hook for Foreman.

Runs automatically on staged .md files. Exit 1 blocks the commit.

CHECKS
  1. Prohibited phrases from the writing style guide
  2. Frontmatter existence (YAML block between --- delimiters)
  3. Blocked author names (configurable blocklist)

INSTALL
  ln -s ../../scripts/pre-commit-hook.sh .git/hooks/pre-commit
  (or run ./scripts/setup.sh)

CONFIGURATION
  Edit the BLOCKED_AUTHORS array in this script to add/remove names.
EOF
    exit 0
fi

# ── Configuration ─────────────────────────────────────────────────────

# Prohibited phrases from CLAUDE.md Absolute Prohibitions
PROHIBITED_PHRASES=(
    "In today's fast-paced"
    "In today's rapidly"
    "In today's ever-changing"
    "In today's competitive"
    "Let's dive in"
    "Let's explore"
    "In this skill, you will learn"
    "Without further ado"
    "It's important to note that"
    "At the end of the day"
)

# Blocked author names — add names that should not appear in commits
# Example: authors whose content has been anonymized
BLOCKED_AUTHORS=(
    # "Blocked Author Name"
)

# ── Get Staged .md Files ──────────────────────────────────────────────
staged_files=()
while IFS= read -r file; do
    [[ -n "$file" ]] && staged_files+=("$file")
done < <(git diff --cached --name-only --diff-filter=ACM -- '*.md' 2>/dev/null || true)

# Nothing to check
if [[ ${#staged_files[@]} -eq 0 ]]; then
    exit 0
fi

# ── Run Checks ────────────────────────────────────────────────────────
errors=0
error_messages=()

add_error() {
    errors=$((errors + 1))
    error_messages+=("$1")
}

for file in "${staged_files[@]}"; do
    full_path="$PROJECT_ROOT/$file"
    [[ ! -f "$full_path" ]] && continue

    # Read file content once for performance
    content=$(cat "$full_path")

    # ── Check 1: Prohibited Phrases ──────────────────────────────────
    for phrase in "${PROHIBITED_PHRASES[@]}"; do
        line_num=$(echo "$content" | grep -n -i "$phrase" 2>/dev/null | head -1 | cut -d: -f1 || true)
        if [[ -n "$line_num" ]]; then
            add_error "$file:$line_num: Prohibited phrase: \"$phrase\""
        fi
    done

    # ── Check 2: Frontmatter Existence ───────────────────────────────
    # Skip files in _schema directories (templates have placeholder frontmatter)
    if [[ "$file" != *"_schema"* ]]; then
        # Check if file starts with --- and has a closing ---
        first_line=$(echo "$content" | head -1)
        if [[ "$first_line" != "---" ]]; then
            add_error "$file: Missing frontmatter (file must start with '---')"
        else
            # Check for closing ---
            closing=$(echo "$content" | tail -n +2 | grep -n "^---$" | head -1 || true)
            if [[ -z "$closing" ]]; then
                add_error "$file: Incomplete frontmatter (missing closing '---')"
            fi
        fi
    fi

    # ── Check 3: Blocked Author Names ────────────────────────────────
    for author in "${BLOCKED_AUTHORS[@]}"; do
        [[ -z "$author" ]] && continue
        line_num=$(echo "$content" | grep -n "$author" 2>/dev/null | head -1 | cut -d: -f1 || true)
        if [[ -n "$line_num" ]]; then
            add_error "$file:$line_num: Blocked author name: \"$author\""
        fi
    done
done

# ── Report ────────────────────────────────────────────────────────────
if [[ $errors -gt 0 ]]; then
    echo ""
    echo "  PRE-COMMIT CHECK FAILED ($errors error(s))"
    echo "  $(printf '%56s' '' | tr ' ' '-')"
    echo ""
    for msg in "${error_messages[@]}"; do
        echo "  $msg"
    done
    echo ""
    echo "  Fix the issues above and stage the corrected files."
    echo "  To bypass this check (not recommended): git commit --no-verify"
    echo ""
    exit 1
fi

exit 0
