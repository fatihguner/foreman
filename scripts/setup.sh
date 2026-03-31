#!/usr/bin/env bash
#
# setup.sh — First-time project setup for new Foreman contributors.
#
# Usage:
#   ./scripts/setup.sh
#   ./scripts/setup.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
setup.sh — First-time project setup for new contributors.

USAGE
  ./scripts/setup.sh          Run full setup
  ./scripts/setup.sh --help   Show this help message

CHECKS
  1. Git version (requires 2.20+)
  2. Pre-commit hook installation
  3. EditorConfig support verification
  4. Project health check (validates all files)
  5. Ready-to-contribute confirmation
EOF
    exit 0
}

[[ "${1:-}" == "--help" || "${1:-}" == "-h" ]] && usage

# ── Helpers ───────────────────────────────────────────────────────────
pass() { echo "  [OK]  $*"; }
fail() { echo "  [FAIL] $*"; }
warn() { echo "  [WARN] $*"; }
info() { echo "  [INFO] $*"; }

errors=0

# ── Header ────────────────────────────────────────────────────────────
echo ""
echo "  FOREMAN PROJECT SETUP"
echo "  $(printf '%56s' '' | tr ' ' '=')"
echo ""

# ── 1. Git Version ───────────────────────────────────────────────────
echo "  1. Checking Git..."

if ! command -v git &>/dev/null; then
    fail "Git is not installed. Install git and try again."
    errors=$((errors + 1))
else
    git_version=$(git --version | sed 's/git version //')
    major=$(echo "$git_version" | cut -d. -f1)
    minor=$(echo "$git_version" | cut -d. -f2)

    if [[ $major -gt 2 ]] || [[ $major -eq 2 && $minor -ge 20 ]]; then
        pass "Git $git_version (requires 2.20+)"
    else
        fail "Git $git_version is too old. Requires 2.20+."
        errors=$((errors + 1))
    fi
fi

# Verify we are in a git repo
if git -C "$PROJECT_ROOT" rev-parse --git-dir &>/dev/null; then
    pass "Inside a git repository"
else
    fail "Not inside a git repository. Run 'git init' first."
    errors=$((errors + 1))
fi
echo ""

# ── 2. Pre-commit Hook ───────────────────────────────────────────────
echo "  2. Setting up pre-commit hook..."

GIT_DIR=$(git -C "$PROJECT_ROOT" rev-parse --git-dir 2>/dev/null || echo "$PROJECT_ROOT/.git")
HOOKS_DIR="$GIT_DIR/hooks"
HOOK_SOURCE="$SCRIPT_DIR/pre-commit-hook.sh"
HOOK_TARGET="$HOOKS_DIR/pre-commit"

if [[ ! -f "$HOOK_SOURCE" ]]; then
    warn "Pre-commit hook source not found at: $HOOK_SOURCE"
    warn "Skipping hook installation."
else
    mkdir -p "$HOOKS_DIR"
    if [[ -f "$HOOK_TARGET" ]] || [[ -L "$HOOK_TARGET" ]]; then
        # Check if it already points to our hook
        if [[ -L "$HOOK_TARGET" ]] && [[ "$(readlink "$HOOK_TARGET")" == "$HOOK_SOURCE" ]]; then
            pass "Pre-commit hook already installed (symlink exists)"
        else
            warn "Existing pre-commit hook found at $HOOK_TARGET"
            warn "Back up and replace manually if needed:"
            warn "  ln -sf $HOOK_SOURCE $HOOK_TARGET"
        fi
    else
        ln -s "$HOOK_SOURCE" "$HOOK_TARGET"
        chmod +x "$HOOK_TARGET"
        pass "Pre-commit hook installed (symlinked to scripts/pre-commit-hook.sh)"
    fi
fi
echo ""

# ── 3. EditorConfig ──────────────────────────────────────────────────
echo "  3. Checking EditorConfig..."

if [[ -f "$PROJECT_ROOT/.editorconfig" ]]; then
    pass ".editorconfig file found"
else
    warn "No .editorconfig file found. Consider creating one for consistent formatting."
    warn "See https://editorconfig.org for details."
fi

# Check for common editors with editorconfig support
if command -v code &>/dev/null; then
    info "VS Code detected (has built-in EditorConfig support)"
elif command -v vim &>/dev/null; then
    info "Vim detected (install editorconfig-vim plugin for support)"
elif command -v nvim &>/dev/null; then
    info "Neovim detected (install editorconfig-vim plugin for support)"
fi
echo ""

# ── 4. Project Health Check ──────────────────────────────────────────
echo "  4. Running project health check..."

# Check essential directories exist
essential_dirs=("skills" "agents" "hooks" "memory" "playbooks" "diagnostics" "output-templates" "commands")
missing_dirs=0
for dir in "${essential_dirs[@]}"; do
    if [[ ! -d "$PROJECT_ROOT/$dir" ]]; then
        fail "Missing directory: $dir/"
        missing_dirs=$((missing_dirs + 1))
    fi
done

if [[ $missing_dirs -eq 0 ]]; then
    pass "All essential directories present (${#essential_dirs[@]}/${#essential_dirs[@]})"
else
    errors=$((errors + missing_dirs))
fi

# Check CLAUDE.md exists
if [[ -f "$PROJECT_ROOT/CLAUDE.md" ]]; then
    pass "CLAUDE.md found"
else
    fail "CLAUDE.md not found — this is the project brain."
    errors=$((errors + 1))
fi

# Check schema templates exist
schemas=(".claude/.claude/skills/_schema/skill-template.md" ".claude/.claude/diagnostics/_schema/diagnostic-template.md" ".claude/.claude/playbooks/_schema/playbook-template.md" ".claude/hooks/_schema/hook-template.md" ".claude/.claude/output-templates/_schema/output-template.md")
missing_schemas=0
for schema in "${schemas[@]}"; do
    if [[ ! -f "$PROJECT_ROOT/$schema" ]]; then
        fail "Missing schema: $schema"
        missing_schemas=$((missing_schemas + 1))
    fi
done

if [[ $missing_schemas -eq 0 ]]; then
    pass "All schema templates present (${#schemas[@]}/${#schemas[@]})"
else
    errors=$((errors + missing_schemas))
fi

# Count content files
skill_count=$(find "$PROJECT_ROOT/skills" -name "*.md" -not -path "*/_schema/*" 2>/dev/null | wc -l | tr -d ' ')
info "Found $skill_count skill files"

template_count=$(find "$PROJECT_ROOT/output-templates" -name "*.md" -not -path "*/_schema/*" 2>/dev/null | wc -l | tr -d ' ')
info "Found $template_count output templates"

# Run validate-all.sh if it exists
if [[ -x "$SCRIPT_DIR/validate-all.sh" ]]; then
    echo ""
    info "Running validate-all.sh..."
    if "$SCRIPT_DIR/validate-all.sh" 2>&1 | tail -3; then
        pass "Validation passed"
    else
        warn "Validation reported issues. Run ./scripts/validate-all.sh for details."
    fi
fi
echo ""

# ── 5. Summary ────────────────────────────────────────────────────────
echo "  $(printf '%56s' '' | tr ' ' '=')"
echo ""

if [[ $errors -eq 0 ]]; then
    echo "  You are ready to contribute."
    echo ""
    echo "  Quick reference:"
    echo "    - Read CLAUDE.md for project context and conventions"
    echo "    - Use ./scripts/new-skill.sh to create new skills"
    echo "    - Use ./scripts/stats.sh to view project statistics"
    echo "    - Use ./scripts/orphan-check.sh to find unlinked content"
    echo ""
else
    echo "  Setup completed with $errors error(s). Fix the issues above and re-run."
    echo ""
    exit 1
fi

exit 0
