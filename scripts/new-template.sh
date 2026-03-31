#!/usr/bin/env bash
#
# new-template.sh — Create a new output template from the schema template.
#
# Usage:
#   ./scripts/new-template.sh                                                (interactive)
#   ./scripts/new-template.sh --audience investor --name "my-template"       (non-interactive)
#   ./scripts/new-template.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TEMPLATE="$PROJECT_ROOT/.claude/output-templates/_schema/output-template.md"
TEMPLATES_DIR="$PROJECT_ROOT/output-templates"

# ── Defaults ──────────────────────────────────────────────────────────
NAME=""
AUDIENCE=""
FORMAT=""
AUTHOR="Fatih Guner"

VALID_AUDIENCES=("investor" "board" "team" "self" "client")
VALID_FORMATS=(
    "one-pager" "memo" "report" "proposal" "briefing" "checklist" "plan"
    "dashboard" "email-template" "scorecard" "canvas" "journal-entry"
    "reflection" "prep-worksheet" "tracker" "self-assessment"
    "meeting-template" "working-document" "planning-guide" "feedback-form"
    "structured-review" "case-study" "status-report" "agreement"
    "welcome-packet" "review-and-plan" "map" "agenda" "summary" "analysis" "update"
)

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
new-template.sh — Create a new output template from the schema template.

USAGE
  ./scripts/new-template.sh                          Interactive mode
  ./scripts/new-template.sh [OPTIONS]                Non-interactive mode

OPTIONS
  --name NAME           Template name in kebab-case (e.g., "strategic-analysis-one-pager")
  --audience AUDIENCE   investor | board | team | self | client
  --format FORMAT       Template format (one-pager, memo, report, proposal, etc.)
  --author AUTHOR       Author name (default: "Fatih Guner")
  --help                Show this help message

EXAMPLES
  ./scripts/new-template.sh --audience investor --name "market-overview"
  ./scripts/new-template.sh --audience team --name "sprint-retro" --format "meeting-template"
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

validate_audience() {
    local audience="$1"
    for a in "${VALID_AUDIENCES[@]}"; do
        [[ "$a" == "$audience" ]] && return 0
    done
    die "Unknown audience '$audience'. Valid audiences: ${VALID_AUDIENCES[*]}"
}

validate_format() {
    local fmt="$1"
    for f in "${VALID_FORMATS[@]}"; do
        [[ "$f" == "$fmt" ]] && return 0
    done
    die "Unknown format '$fmt'. See --help for valid formats."
}

# ── Parse Arguments ───────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --help|-h)    usage ;;
        --name)       NAME="$2"; shift 2 ;;
        --audience)   AUDIENCE="$2"; shift 2 ;;
        --format)     FORMAT="$2"; shift 2 ;;
        --author)     AUTHOR="$2"; shift 2 ;;
        *)            die "Unknown option: $1. Use --help for usage." ;;
    esac
done

# ── Interactive Prompts ───────────────────────────────────────────────
if [[ -z "$NAME" ]]; then
    read -rp "Template name (kebab-case, e.g., 'strategic-analysis-one-pager'): " NAME
fi
validate_kebab_case "$NAME"

if [[ -z "$AUDIENCE" ]]; then
    echo ""
    echo "Target audience:"
    i=1
    for a in "${VALID_AUDIENCES[@]}"; do
        echo "  $i) $a"
        ((i++))
    done
    echo ""
    read -rp "Select audience (number or name): " aud_input
    if [[ "$aud_input" =~ ^[0-9]+$ ]]; then
        idx=$((aud_input - 1))
        if [[ $idx -ge 0 && $idx -lt ${#VALID_AUDIENCES[@]} ]]; then
            AUDIENCE="${VALID_AUDIENCES[$idx]}"
        else
            die "Invalid selection: $aud_input"
        fi
    else
        AUDIENCE="$aud_input"
    fi
fi
validate_audience "$AUDIENCE"

if [[ -z "$FORMAT" ]]; then
    echo ""
    echo "Common formats: one-pager, memo, report, proposal, briefing, checklist,"
    echo "  plan, dashboard, email-template, scorecard, canvas, meeting-template"
    read -rp "Format: " FORMAT
fi
validate_format "$FORMAT"

# ── Validate Target ──────────────────────────────────────────────────
TARGET_DIR="$TEMPLATES_DIR/$AUDIENCE"
TARGET_FILE="$TARGET_DIR/$NAME.md"

if [[ ! -d "$TARGET_DIR" ]]; then
    die "Audience directory does not exist: $TARGET_DIR"
fi

if [[ -f "$TARGET_FILE" ]]; then
    die "Template already exists: $TARGET_FILE"
fi

if [[ ! -f "$TEMPLATE" ]]; then
    die "Schema template not found: $TEMPLATE"
fi

# ── Generate File ─────────────────────────────────────────────────────
cp "$TEMPLATE" "$TARGET_FILE"

# Replace frontmatter placeholders
sed -i '' "s/^name: .*/name: \"${NAME}\"/" "$TARGET_FILE"
sed -i '' "s/^audience: .*/audience: \"${AUDIENCE}\"/" "$TARGET_FILE"
sed -i '' "s/^format: .*/format: \"${FORMAT}\"/" "$TARGET_FILE"
sed -i '' "s/^author: .*/author: \"${AUTHOR}\"/" "$TARGET_FILE"

# ── Confirm ───────────────────────────────────────────────────────────
echo ""
echo "Created: $TARGET_FILE"
echo ""
echo "  Name:     $NAME"
echo "  Audience: $AUDIENCE"
echo "  Format:   $FORMAT"
echo "  Author:   $AUTHOR"
echo ""

# Open in editor if available
if [[ -n "${EDITOR:-}" ]]; then
    echo "Opening in \$EDITOR ($EDITOR)..."
    "$EDITOR" "$TARGET_FILE"
fi

exit 0
