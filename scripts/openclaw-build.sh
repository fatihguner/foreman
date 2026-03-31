#!/usr/bin/env bash
#
# openclaw-build.sh — Validate the Foreman OpenClaw plugin build.
#
# Verifies that all plugin components are present and well-formed
# before publishing or distributing the plugin.
#
# Usage:
#   ./scripts/openclaw-build.sh
#   ./scripts/openclaw-build.sh --help
#
# Author: Fatih Guner
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Help ─────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
openclaw-build.sh — Validate the Foreman OpenClaw plugin.

USAGE
  ./scripts/openclaw-build.sh          Run all validation checks
  ./scripts/openclaw-build.sh --help   Show this help message

CHECKS
  1. openclaw.plugin.json exists and is valid JSON
  2. package.json has openclaw.extensions field
  3. index.ts entry point exists
  4. .claude/skills/ has content (source of truth)
  5. .claude-plugin/plugin.json exists (Claude bundle fallback)
  6. Content validation via validate-all.sh (if available)
EOF
    exit 0
}

[[ "${1:-}" == "--help" || "${1:-}" == "-h" ]] && usage

# ── Helpers ──────────────────────────────────────────────────────────
pass() { echo "  [OK]   $*"; }
fail() { echo "  [FAIL] $*"; }
info() { echo "  [INFO] $*"; }

errors=0
warnings=0

# ── Header ───────────────────────────────────────────────────────────
echo ""
echo "  FOREMAN — OPENCLAW PLUGIN BUILD CHECK"
echo "  $(printf '%56s' '' | tr ' ' '=')"
echo ""

# ── 1. Plugin Manifest ──────────────────────────────────────────────
echo "  1. Checking openclaw.plugin.json..."

PLUGIN_JSON="$PROJECT_ROOT/openclaw.plugin.json"
if [[ ! -f "$PLUGIN_JSON" ]]; then
    fail "openclaw.plugin.json not found at project root"
    errors=$((errors + 1))
elif ! python3 -c "import json; json.load(open('$PLUGIN_JSON'))" 2>/dev/null && \
     ! node -e "JSON.parse(require('fs').readFileSync('$PLUGIN_JSON','utf-8'))" 2>/dev/null; then
    fail "openclaw.plugin.json is not valid JSON"
    errors=$((errors + 1))
else
    pass "openclaw.plugin.json exists and is valid JSON"
fi
echo ""

# ── 2. Package.json Extensions ──────────────────────────────────────
echo "  2. Checking package.json..."

PACKAGE_JSON="$PROJECT_ROOT/package.json"
if [[ ! -f "$PACKAGE_JSON" ]]; then
    fail "package.json not found at project root"
    errors=$((errors + 1))
else
    # Check for openclaw.extensions field
    has_extensions=false
    if command -v node &>/dev/null; then
        has_extensions=$(node -e "
            const pkg = JSON.parse(require('fs').readFileSync('$PACKAGE_JSON','utf-8'));
            console.log(pkg.openclaw && pkg.openclaw.extensions ? 'true' : 'false');
        " 2>/dev/null || echo "false")
    elif command -v python3 &>/dev/null; then
        has_extensions=$(python3 -c "
import json
pkg = json.load(open('$PACKAGE_JSON'))
print('true' if pkg.get('openclaw', {}).get('extensions') else 'false')
" 2>/dev/null || echo "false")
    fi

    if [[ "$has_extensions" == "true" ]]; then
        pass "package.json has openclaw.extensions field"
    else
        fail "package.json missing openclaw.extensions field"
        errors=$((errors + 1))
    fi
fi
echo ""

# ── 3. Entry Point ──────────────────────────────────────────────────
echo "  3. Checking entry point..."

INDEX_TS="$PROJECT_ROOT/index.ts"
if [[ -f "$INDEX_TS" ]]; then
    pass "index.ts exists"
else
    fail "index.ts not found at project root"
    errors=$((errors + 1))
fi
echo ""

# ── 4. Skills Directory ─────────────────────────────────────────────
echo "  4. Checking .claude/skills/..."

SKILLS_DIR="$PROJECT_ROOT/.claude/skills"
if [[ ! -d "$SKILLS_DIR" ]]; then
    fail ".claude/skills/ directory not found"
    errors=$((errors + 1))
else
    skill_count=0
    for category_dir in "$SKILLS_DIR"/*/; do
        if [[ -d "$category_dir" ]] && [[ "$(basename "$category_dir")" != "_schema" ]]; then
            dir_count=$(find "$category_dir" -maxdepth 1 -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
            skill_count=$((skill_count + dir_count))
        fi
    done

    if [[ $skill_count -gt 0 ]]; then
        category_count=$(find "$SKILLS_DIR" -mindepth 1 -maxdepth 1 -type d -not -name "_schema" 2>/dev/null | wc -l | tr -d ' ')
        pass ".claude/skills/ has $skill_count skills across $category_count categories"
    else
        fail ".claude/skills/ exists but contains no skill files"
        errors=$((errors + 1))
    fi
fi
echo ""

# ── 5. Claude Bundle Fallback ────────────────────────────────────────
echo "  5. Checking .claude-plugin/plugin.json..."

CLAUDE_PLUGIN="$PROJECT_ROOT/.claude-plugin/plugin.json"
if [[ -f "$CLAUDE_PLUGIN" ]]; then
    pass ".claude-plugin/plugin.json exists (Claude bundle fallback)"
else
    info ".claude-plugin/plugin.json not found — Claude bundle fallback unavailable"
    warnings=$((warnings + 1))
fi
echo ""

# ── 6. Content Validation ────────────────────────────────────────────
echo "  6. Running content validation..."

VALIDATE_ALL="$SCRIPT_DIR/validate-all.sh"
if [[ -x "$VALIDATE_ALL" ]]; then
    if "$VALIDATE_ALL" 2>&1 | tail -5; then
        pass "Content validation passed"
    else
        fail "Content validation reported issues. Run ./scripts/validate-all.sh for details."
        errors=$((errors + 1))
    fi
else
    info "validate-all.sh not found or not executable — skipping content validation"
    warnings=$((warnings + 1))
fi
echo ""

# ── Summary ──────────────────────────────────────────────────────────
echo "  $(printf '%56s' '' | tr ' ' '=')"
echo ""

if [[ $errors -eq 0 ]]; then
    if [[ $warnings -gt 0 ]]; then
        echo "  Plugin ready ($warnings warning(s) — non-blocking)."
    else
        echo "  Plugin ready. All checks passed."
    fi
    echo ""
    echo "  To install locally:  openclaw plugins install ./"
    echo "  To test:             openclaw tool foreman_list_skills"
    echo ""
else
    echo "  Build check failed with $errors error(s). Fix the issues above before publishing."
    echo ""
    exit 1
fi

exit 0
