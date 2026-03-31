#!/usr/bin/env bash
#
# openclaw-setup.sh — Set up Foreman as an OpenClaw agent in your workspace.
#
# This is the companion to setup.sh (which is for Claude Code contributors).
# This script is for entrepreneurs using Foreman through OpenClaw.
#
# Usage:
#   ./scripts/openclaw-setup.sh
#   ./scripts/openclaw-setup.sh --workspace /path/to/workspace
#   ./scripts/openclaw-setup.sh --skip-templates --skip-bootstrap
#   ./scripts/openclaw-setup.sh --help
#
# Author: Fatih Guner
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATES_DIR="$PROJECT_ROOT/openclaw-templates"

# ── Defaults ─────────────────────────────────────────────────────────
WORKSPACE_ROOT=""
SKIP_TEMPLATES=false
SKIP_BOOTSTRAP=false

# ── Help ─────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
openclaw-setup.sh — Set up Foreman as an OpenClaw agent.

USAGE
  ./scripts/openclaw-setup.sh                      Full setup (current directory as workspace)
  ./scripts/openclaw-setup.sh --workspace /path     Use a custom workspace root
  ./scripts/openclaw-setup.sh --skip-templates      Install plugin only, skip template copy
  ./scripts/openclaw-setup.sh --skip-bootstrap      Skip the bootstrap conversation prompt
  ./scripts/openclaw-setup.sh --help                Show this help message

WHAT IT DOES
  1. Verifies OpenClaw CLI is installed
  2. Installs the Foreman plugin
  3. Verifies installation
  4. Copies workspace templates (SOUL.md, IDENTITY.md, AGENTS.md, etc.)
  5. Optionally runs the bootstrap conversation for first-time setup

FLAGS
  --workspace PATH    Custom workspace root (default: current directory)
  --skip-templates    Do not copy templates to workspace
  --skip-bootstrap    Do not prompt for bootstrap conversation
  --help, -h          Show this help message
EOF
    exit 0
}

# ── Parse Arguments ──────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)
            usage
            ;;
        --workspace)
            WORKSPACE_ROOT="$2"
            shift 2
            ;;
        --skip-templates)
            SKIP_TEMPLATES=true
            shift
            ;;
        --skip-bootstrap)
            SKIP_BOOTSTRAP=true
            shift
            ;;
        *)
            echo "Unknown argument: $1"
            echo "Run with --help for usage."
            exit 1
            ;;
    esac
done

# Default workspace to current directory
if [[ -z "$WORKSPACE_ROOT" ]]; then
    WORKSPACE_ROOT="$(pwd)"
fi

# ── Helpers ──────────────────────────────────────────────────────────
pass() { echo "  [OK]   $*"; }
fail() { echo "  [FAIL] $*"; }
info() { echo "  [INFO] $*"; }

errors=0

# ── Header ───────────────────────────────────────────────────────────
echo ""
echo "  FOREMAN — OPENCLAW SETUP"
echo "  $(printf '%56s' '' | tr ' ' '=')"
echo ""

# ── 1. Check OpenClaw CLI ────────────────────────────────────────────
echo "  1. Checking OpenClaw CLI..."

if ! command -v openclaw &>/dev/null; then
    fail "OpenClaw CLI not found."
    echo ""
    echo "     Install OpenClaw first:"
    echo "       npm install -g openclaw"
    echo "       # or: brew install openclaw"
    echo ""
    echo "     Then re-run this script."
    exit 1
fi

openclaw_version=$(openclaw --version 2>/dev/null || echo "unknown")
pass "OpenClaw CLI found (version: $openclaw_version)"
echo ""

# ── 2. Install Foreman Plugin ────────────────────────────────────────
echo "  2. Installing Foreman plugin..."

if openclaw plugins install "$PROJECT_ROOT" 2>/dev/null; then
    pass "Foreman plugin installed from $PROJECT_ROOT"
else
    fail "Plugin installation failed."
    echo "     Check that openclaw.plugin.json exists and is valid."
    errors=$((errors + 1))
fi
echo ""

# ── 3. Verify Installation ──────────────────────────────────────────
echo "  3. Verifying installation..."

if openclaw plugins inspect foreman 2>/dev/null; then
    pass "Plugin 'foreman' is registered and accessible"
else
    fail "Plugin verification failed. 'openclaw plugins inspect foreman' returned an error."
    errors=$((errors + 1))
fi
echo ""

# ── 4. Copy Templates ───────────────────────────────────────────────
if [[ "$SKIP_TEMPLATES" == true ]]; then
    info "Skipping template copy (--skip-templates)"
    echo ""
else
    echo "  4. Copying workspace templates..."

    if [[ ! -d "$TEMPLATES_DIR" ]]; then
        fail "Templates directory not found at $TEMPLATES_DIR"
        errors=$((errors + 1))
    else
        template_count=0
        for template_file in "$TEMPLATES_DIR"/*.md; do
            if [[ -f "$template_file" ]]; then
                filename="$(basename "$template_file")"
                target="$WORKSPACE_ROOT/$filename"

                if [[ -f "$target" ]]; then
                    info "Skipping $filename (already exists in workspace)"
                else
                    cp "$template_file" "$target"
                    template_count=$((template_count + 1))
                fi
            fi
        done

        if [[ $template_count -gt 0 ]]; then
            pass "Copied $template_count template(s) to $WORKSPACE_ROOT/"
        else
            info "All templates already present in workspace"
        fi
    fi
    echo ""
fi

# ── 5. Bootstrap Conversation ────────────────────────────────────────
if [[ "$SKIP_BOOTSTRAP" == true ]]; then
    info "Skipping bootstrap conversation (--skip-bootstrap)"
    echo ""
elif [[ ! -f "$WORKSPACE_ROOT/BOOTSTRAP.md" ]]; then
    info "No BOOTSTRAP.md in workspace — skipping bootstrap prompt"
    echo ""
else
    echo "  5. Bootstrap conversation..."
    echo ""
    echo "     Foreman works best with context about you and your company."
    echo "     The bootstrap conversation takes 2-3 minutes and sets up your profile."
    echo ""
    read -r -p "     Run the bootstrap conversation now? [y/N] " response
    echo ""

    if [[ "$response" =~ ^[Yy]$ ]]; then
        info "Starting bootstrap conversation..."
        openclaw agent --message "Read BOOTSTRAP.md and run the first-time setup conversation with me." 2>/dev/null || {
            fail "Bootstrap conversation failed. You can run it manually later:"
            echo "     openclaw agent --message 'Run the BOOTSTRAP.md setup conversation'"
        }
    else
        info "Skipped. Run the bootstrap later with:"
        echo "     openclaw agent --message 'Run the BOOTSTRAP.md setup conversation'"
    fi
    echo ""
fi

# ── Summary ──────────────────────────────────────────────────────────
echo "  $(printf '%56s' '' | tr ' ' '=')"
echo ""

if [[ $errors -eq 0 ]]; then
    echo "  Setup complete."
    echo ""
    echo "  What was installed:"
    echo "    - Foreman OpenClaw plugin (7 tools registered)"
    if [[ "$SKIP_TEMPLATES" != true ]]; then
        echo "    - Workspace templates (SOUL.md, IDENTITY.md, AGENTS.md, BOOT.md, etc.)"
    fi
    echo ""
    echo "  Next steps:"
    echo "    - Start a conversation: openclaw agent"
    echo "    - Browse skills:        openclaw tool foreman_list_skills"
    echo "    - Run a diagnostic:     openclaw tool foreman_diagnose --area revenue"
    echo "    - Read the docs:        https://foreman.sh"
    echo ""
else
    echo "  Setup completed with $errors error(s). Fix the issues above and re-run."
    echo ""
    exit 1
fi

exit 0
