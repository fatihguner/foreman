#!/usr/bin/env bash
#
# stats.sh — Project statistics dashboard for Foreman.
#
# Usage:
#   ./scripts/stats.sh
#   ./scripts/stats.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
stats.sh — Project statistics dashboard.

USAGE
  ./scripts/stats.sh          Display full statistics dashboard
  ./scripts/stats.sh --help   Show this help message

Displays counts, distributions, and totals for all Foreman content:
skills, templates, diagnostics, playbooks, hooks, agents, and commands.
EOF
    exit 0
}

[[ "${1:-}" == "--help" || "${1:-}" == "-h" ]] && usage

# ── Helpers ───────────────────────────────────────────────────────────
count_md_files() {
    local dir="$1"
    if [[ -d "$dir" ]]; then
        find "$dir" -maxdepth 1 -name "*.md" -not -name "_*" | wc -l | tr -d ' '
    else
        echo "0"
    fi
}

pad_right() {
    printf "%-${2}s" "$1"
}

pad_left() {
    printf "%${2}s" "$1"
}

separator() {
    printf '%*s\n' "${1:-60}" '' | tr ' ' "$2"
}

# ── Header ────────────────────────────────────────────────────────────
echo ""
echo "  FOREMAN PROJECT STATISTICS"
echo "  $(separator 56 '=')"
echo ""

# ── Skills ────────────────────────────────────────────────────────────
echo "  SKILLS"
echo "  $(separator 56 '-')"

total_skills=0
declare -A cat_counts

for dir in "$PROJECT_ROOT"/.claude/skills/*/; do
    cat_name="$(basename "$dir")"
    [[ "$cat_name" == "_schema" ]] && continue
    count=$(count_md_files "$dir")
    cat_counts["$cat_name"]=$count
    total_skills=$((total_skills + count))
done

# Sort categories by count (descending)
for cat_name in $(for k in "${!cat_counts[@]}"; do echo "$k ${cat_counts[$k]}"; done | sort -k2 -rn | awk '{print $1}'); do
    count="${cat_counts[$cat_name]}"
    bar=""
    for ((i=0; i<count; i++)); do bar+="#"; done
    printf "  %-20s %3s  %s\n" "$cat_name" "$count" "$bar"
done
echo "  $(separator 56 '-')"
printf "  %-20s %3s\n" "TOTAL" "$total_skills"
echo ""

# Complexity distribution
echo "  Complexity Distribution"
echo "  $(separator 56 '-')"
for level in basic intermediate advanced; do
    count=$(grep -rl "^complexity: \"$level\"" "$PROJECT_ROOT"/.claude/skills/*/  2>/dev/null | wc -l | tr -d ' ')
    printf "  %-20s %3s\n" "$level" "$count"
done
echo ""

# Stage coverage
echo "  Stage Coverage"
echo "  $(separator 56 '-')"
for stage in idea validation early-traction growth scale; do
    count=$(grep -rl "  - $stage" "$PROJECT_ROOT"/.claude/skills/*/ 2>/dev/null | wc -l | tr -d ' ')
    printf "  %-20s %3s\n" "$stage" "$count"
done
echo ""

# ── Output Templates ──────────────────────────────────────────────────
echo "  OUTPUT TEMPLATES"
echo "  $(separator 56 '-')"

total_templates=0
for audience_dir in "$PROJECT_ROOT"/.claude/output-templates/*/; do
    audience="$(basename "$audience_dir")"
    [[ "$audience" == "_schema" ]] && continue
    count=$(count_md_files "$audience_dir")
    total_templates=$((total_templates + count))
    printf "  %-20s %3s\n" "$audience" "$count"
done
echo "  $(separator 56 '-')"
printf "  %-20s %3s\n" "TOTAL" "$total_templates"
echo ""

# ── Other Content Types ───────────────────────────────────────────────
echo "  OTHER CONTENT"
echo "  $(separator 56 '-')"

diag_count=$(count_md_files "$PROJECT_ROOT/diagnostics")
playbook_count=$(count_md_files "$PROJECT_ROOT/playbooks")
hook_count=$(count_md_files "$PROJECT_ROOT/hooks")
agent_count=$(count_md_files "$PROJECT_ROOT/agents")
command_count=$(count_md_files "$PROJECT_ROOT/commands")

printf "  %-20s %3s\n" "Diagnostics" "$diag_count"
printf "  %-20s %3s\n" "Playbooks" "$playbook_count"
printf "  %-20s %3s\n" "Hooks" "$hook_count"
printf "  %-20s %3s\n" "Agents" "$agent_count"
printf "  %-20s %3s\n" "Commands" "$command_count"
echo ""

# ── Industry Packs ───────────────────────────────────────────────────
echo "  INDUSTRY PACKS"
echo "  $(separator 56 '-')"

total_packs=0
total_pack_files=0
for pack_dir in "$PROJECT_ROOT"/.claude/industry-packs/*/; do
    pack_name="$(basename "$pack_dir")"
    [[ "$pack_name" == "_schema" ]] && continue
    pack_file_count=$(find "$pack_dir" -maxdepth 1 -name "*.yaml" | wc -l | tr -d ' ')
    total_packs=$((total_packs + 1))
    total_pack_files=$((total_pack_files + pack_file_count))
    printf "  %-20s %3s files\n" "$pack_name" "$pack_file_count"
done
echo "  $(separator 56 '-')"
printf "  %-20s %3s packs, %s files\n" "TOTAL" "$total_packs" "$total_pack_files"
echo ""

# ── Totals ────────────────────────────────────────────────────────────
echo "  PROJECT TOTALS"
echo "  $(separator 56 '-')"

total_content=$((total_skills + total_templates + diag_count + playbook_count + hook_count + agent_count + command_count))
printf "  %-20s %3s\n" "Content files" "$total_content"

# Total .md files in project
total_md=$(find "$PROJECT_ROOT" -name "*.md" -not -path "*/_schema/*" -not -path "*/.git/*" -not -path "*/node_modules/*" | wc -l | tr -d ' ')
printf "  %-20s %3s\n" "All .md files" "$total_md"

# Total lines
total_lines=$(find "$PROJECT_ROOT" -name "*.md" -not -path "*/.git/*" -not -path "*/node_modules/*" -exec cat {} + 2>/dev/null | wc -l | tr -d ' ')
printf "  %-20s %3s\n" "Total lines" "$total_lines"

# Total size
total_size=$(find "$PROJECT_ROOT" -name "*.md" -not -path "*/.git/*" -not -path "*/node_modules/*" -exec stat -f%z {} + 2>/dev/null | awk '{s+=$1} END {print s}')
if [[ $total_size -gt 1048576 ]]; then
    size_display="$(echo "scale=1; $total_size / 1048576" | bc)M"
elif [[ $total_size -gt 1024 ]]; then
    size_display="$(echo "scale=1; $total_size / 1024" | bc)K"
else
    size_display="${total_size}B"
fi
printf "  %-20s %3s\n" "Total size" "$size_display"
echo ""

# ── Cross-Reference Density ──────────────────────────────────────────
echo "  CROSS-REFERENCE DENSITY"
echo "  $(separator 56 '-')"

# Count related_skills entries across all skill files
total_refs=0
skill_files_with_refs=0
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    refs=$(grep -c "^  - " <<< "$(sed -n '/^related_skills:/,/^[^ ]/p' "$skill_file" 2>/dev/null)" 2>/dev/null || echo 0)
    if [[ $refs -gt 0 ]]; then
        total_refs=$((total_refs + refs))
        skill_files_with_refs=$((skill_files_with_refs + 1))
    fi
done

if [[ $skill_files_with_refs -gt 0 ]]; then
    avg_refs=$(echo "scale=1; $total_refs / $skill_files_with_refs" | bc)
else
    avg_refs="0"
fi

printf "  %-20s %3s\n" "Skills with refs" "$skill_files_with_refs"
printf "  %-20s %3s\n" "Total references" "$total_refs"
printf "  %-20s %3s\n" "Avg refs/skill" "$avg_refs"
echo ""

echo "  $(separator 56 '=')"
echo ""

exit 0
