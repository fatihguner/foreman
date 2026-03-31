#!/usr/bin/env bash
#
# orphan-check.sh — Find files never referenced by anything else in the project.
#
# Usage:
#   ./scripts/orphan-check.sh
#   ./scripts/orphan-check.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
orphan-check.sh — Find files never referenced by anything else.

USAGE
  ./scripts/orphan-check.sh          Scan for orphan files
  ./scripts/orphan-check.sh --help   Show this help message

CHECKS
  - Skills not mentioned in any hook, diagnostic, playbook, or other skill's related_skills
  - Templates not mentioned in any playbook's final_outputs or diagnostic's routes_to_templates
  - Diagnostics not mentioned in any hook or playbook

Reports orphans with suggestions for what to connect them to.
EOF
    exit 0
}

[[ "${1:-}" == "--help" || "${1:-}" == "-h" ]] && usage

# ── Helpers ───────────────────────────────────────────────────────────
orphan_count=0

check_orphan_skills() {
    echo "  ORPHAN SKILLS"
    echo "  $(printf '%56s' '' | tr ' ' '-')"
    echo ""

    local found=0

    # Build a combined reference corpus from hooks, diagnostics, playbooks, and other skills
    local ref_corpus
    ref_corpus=$(cat \
        "$PROJECT_ROOT"/hooks/*.md \
        "$PROJECT_ROOT"/.claude/diagnostics/*.md \
        "$PROJECT_ROOT"/.claude/playbooks/*.md \
        2>/dev/null || true)

    for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
        [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue

        local skill_name
        skill_name="$(basename "$skill_file" .md)"

        # Check if this skill name appears anywhere in the reference corpus
        local in_external=false
        if echo "$ref_corpus" | grep -q "$skill_name" 2>/dev/null; then
            in_external=true
        fi

        # Check if referenced in another skill's related_skills
        local in_related=false
        for other_skill in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
            [[ "$other_skill" == "$skill_file" ]] && continue
            [[ "$(basename "$other_skill")" == "skill-template.md" ]] && continue
            if grep -q "$skill_name" "$other_skill" 2>/dev/null; then
                in_related=true
                break
            fi
        done

        if [[ "$in_external" == "false" && "$in_related" == "false" ]]; then
            local category
            category="$(basename "$(dirname "$skill_file")")"
            echo "    $skill_name  ($category)"

            # Suggest connection based on category
            local hook_match
            hook_match=$(grep -l "$category" "$PROJECT_ROOT"/hooks/*.md 2>/dev/null | head -1 || true)
            if [[ -n "$hook_match" ]]; then
                echo "      -> Consider adding to: $(basename "$hook_match")"
            else
                echo "      -> Consider creating a hook or adding to a playbook"
            fi
            echo ""
            found=$((found + 1))
            orphan_count=$((orphan_count + 1))
        fi
    done

    if [[ $found -eq 0 ]]; then
        echo "    No orphan skills found."
        echo ""
    else
        echo "  Found $found orphan skill(s)."
    fi
    echo ""
}

check_orphan_templates() {
    echo "  ORPHAN TEMPLATES"
    echo "  $(printf '%56s' '' | tr ' ' '-')"
    echo ""

    local found=0

    # Build reference corpus from playbooks and diagnostics
    local ref_corpus
    ref_corpus=$(cat \
        "$PROJECT_ROOT"/.claude/playbooks/*.md \
        "$PROJECT_ROOT"/.claude/diagnostics/*.md \
        "$PROJECT_ROOT"/.claude/skills/*/*.md \
        2>/dev/null || true)

    for audience_dir in "$PROJECT_ROOT"/.claude/output-templates/*/; do
        local audience
        audience="$(basename "$audience_dir")"
        [[ "$audience" == "_schema" ]] && continue

        for tmpl_file in "$audience_dir"*.md; do
            [[ ! -f "$tmpl_file" ]] && continue
            local tmpl_name
            tmpl_name="$(basename "$tmpl_file" .md)"

            if ! echo "$ref_corpus" | grep -q "$tmpl_name" 2>/dev/null; then
                echo "    $tmpl_name  ($audience)"
                echo "      -> Consider referencing in a playbook's final_outputs or a skill's output template"
                echo ""
                found=$((found + 1))
                orphan_count=$((orphan_count + 1))
            fi
        done
    done

    if [[ $found -eq 0 ]]; then
        echo "    No orphan templates found."
        echo ""
    else
        echo "  Found $found orphan template(s)."
    fi
    echo ""
}

check_orphan_diagnostics() {
    echo "  ORPHAN DIAGNOSTICS"
    echo "  $(printf '%56s' '' | tr ' ' '-')"
    echo ""

    local found=0

    # Build reference corpus from hooks and playbooks
    local ref_corpus
    ref_corpus=$(cat \
        "$PROJECT_ROOT"/hooks/*.md \
        "$PROJECT_ROOT"/.claude/playbooks/*.md \
        2>/dev/null || true)

    for diag_file in "$PROJECT_ROOT"/.claude/diagnostics/*.md; do
        [[ ! -f "$diag_file" ]] && continue
        local diag_name
        diag_name="$(basename "$diag_file" .md)"

        if ! echo "$ref_corpus" | grep -q "$diag_name" 2>/dev/null; then
            echo "    $diag_name"
            echo "      -> Consider adding to a hook's routes_to.diagnostics"
            echo ""
            found=$((found + 1))
            orphan_count=$((orphan_count + 1))
        fi
    done

    if [[ $found -eq 0 ]]; then
        echo "    No orphan diagnostics found."
        echo ""
    else
        echo "  Found $found orphan diagnostic(s)."
    fi
    echo ""
}

# ── Main ──────────────────────────────────────────────────────────────
echo ""
echo "  FOREMAN ORPHAN CHECK"
echo "  $(printf '%56s' '' | tr ' ' '=')"
echo ""

check_orphan_skills
check_orphan_templates
check_orphan_diagnostics

echo "  $(printf '%56s' '' | tr ' ' '=')"
if [[ $orphan_count -eq 0 ]]; then
    echo "  All files are cross-referenced. No orphans found."
else
    echo "  Total orphans: $orphan_count"
    echo "  Run this check again after adding cross-references."
fi
echo ""

exit 0
