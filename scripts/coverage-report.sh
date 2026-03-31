#!/usr/bin/env bash
#
# coverage-report.sh — Analyze coverage across all Foreman dimensions.
#
# Usage:
#   ./scripts/coverage-report.sh
#   ./scripts/coverage-report.sh --help
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# ── Help ──────────────────────────────────────────────────────────────
usage() {
    cat <<'EOF'
coverage-report.sh — Analyze coverage across all Foreman dimensions.

USAGE
  ./scripts/coverage-report.sh          Generate full coverage report
  ./scripts/coverage-report.sh --help   Show this help message

DIMENSIONS
  - Stage coverage: skills per stage
  - Category size distribution
  - Most/least cross-referenced skills (top 10, bottom 10)
  - Diagnostic -> skill routing coverage
  - Playbook -> skill usage
  - Template -> skill mapping
EOF
    exit 0
}

[[ "${1:-}" == "--help" || "${1:-}" == "-h" ]] && usage

# ── Header ────────────────────────────────────────────────────────────
echo ""
echo "  FOREMAN COVERAGE REPORT"
echo "  $(printf '%60s' '' | tr ' ' '=')"
echo ""

# ── 1. Stage Coverage ────────────────────────────────────────────────
echo "  1. STAGE COVERAGE"
echo "  $(printf '%60s' '' | tr ' ' '-')"
echo ""

total_skills=0
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    total_skills=$((total_skills + 1))
done

for stage in idea validation early-traction growth scale; do
    count=0
    for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
        [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
        if grep -q "  - $stage" "$skill_file" 2>/dev/null; then
            count=$((count + 1))
        fi
    done
    if [[ $total_skills -gt 0 ]]; then
        pct=$((count * 100 / total_skills))
    else
        pct=0
    fi
    bar=""
    bar_len=$((pct / 2))
    for ((i=0; i<bar_len; i++)); do bar+="#"; done
    printf "  %-18s %3d/%d (%3d%%)  %s\n" "$stage" "$count" "$total_skills" "$pct" "$bar"
done
echo ""

# ── 2. Category Size Distribution ────────────────────────────────────
echo "  2. CATEGORY SIZE DISTRIBUTION"
echo "  $(printf '%60s' '' | tr ' ' '-')"
echo ""

declare -A cat_counts
for dir in "$PROJECT_ROOT"/.claude/skills/*/; do
    cat_name="$(basename "$dir")"
    [[ "$cat_name" == "_schema" ]] && continue
    count=$(find "$dir" -maxdepth 1 -name "*.md" | wc -l | tr -d ' ')
    cat_counts["$cat_name"]=$count
done

# Sort descending
for cat_name in $(for k in "${!cat_counts[@]}"; do echo "$k ${cat_counts[$k]}"; done | sort -k2 -rn | awk '{print $1}'); do
    count="${cat_counts[$cat_name]}"
    bar=""
    for ((i=0; i<count; i++)); do bar+="#"; done
    printf "  %-22s %3s  %s\n" "$cat_name" "$count" "$bar"
done
echo ""

# ── 3. Cross-Reference Ranking ───────────────────────────────────────
echo "  3. CROSS-REFERENCE RANKING"
echo "  $(printf '%60s' '' | tr ' ' '-')"
echo ""

# Count how many times each skill is referenced by other skills
declare -A ref_counts
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    skill_name="$(basename "$skill_file" .md)"
    ref_counts["$skill_name"]=0
done

# Count references
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    # Extract related_skills entries
    in_related=false
    while IFS= read -r line; do
        if [[ "$line" == "related_skills:" ]]; then
            in_related=true
            continue
        fi
        if [[ "$in_related" == true ]]; then
            if [[ "$line" =~ ^[[:space:]]*-[[:space:]]+(.*) ]]; then
                ref_name="${BASH_REMATCH[1]}"
                ref_name="${ref_name//\"/}"  # strip quotes
                ref_name="$(echo "$ref_name" | xargs)"  # trim
                if [[ -n "${ref_counts[$ref_name]+x}" ]]; then
                    ref_counts["$ref_name"]=$(( ${ref_counts["$ref_name"]} + 1 ))
                fi
            else
                in_related=false
            fi
        fi
    done < "$skill_file"
done

# Top 10 most referenced
echo "  Most Referenced (Top 10):"
i=0
for skill in $(for k in "${!ref_counts[@]}"; do echo "$k ${ref_counts[$k]}"; done | sort -k2 -rn | head -10 | awk '{print $1}'); do
    count="${ref_counts[$skill]}"
    ((i++))
    printf "  %2d. %-35s %3s refs\n" "$i" "$skill" "$count"
done
echo ""

# Bottom 10 least referenced (with 0 refs)
echo "  Least Referenced (Bottom 10):"
i=0
for skill in $(for k in "${!ref_counts[@]}"; do echo "$k ${ref_counts[$k]}"; done | sort -k2 -n | head -10 | awk '{print $1}'); do
    count="${ref_counts[$skill]}"
    ((i++))
    printf "  %2d. %-35s %3s refs\n" "$i" "$skill" "$count"
done
echo ""

# ── 4. Diagnostic -> Skill Routing Coverage ──────────────────────────
echo "  4. DIAGNOSTIC -> SKILL ROUTING COVERAGE"
echo "  $(printf '%60s' '' | tr ' ' '-')"
echo ""

# Collect all skills reachable through diagnostics
declare -A diag_reachable
for diag_file in "$PROJECT_ROOT"/.claude/diagnostics/*.md; do
    [[ ! -f "$diag_file" ]] && continue
    in_routes=false
    while IFS= read -r line; do
        if [[ "$line" == "routes_to_skills:" ]]; then
            in_routes=true
            continue
        fi
        if [[ "$in_routes" == true ]]; then
            if [[ "$line" =~ ^[[:space:]]*-[[:space:]]+(.*) ]]; then
                skill_ref="${BASH_REMATCH[1]}"
                skill_ref="${skill_ref//\"/}"
                skill_ref="$(echo "$skill_ref" | xargs)"
                diag_reachable["$skill_ref"]=1
            else
                in_routes=false
            fi
        fi
    done < "$diag_file"
done

reachable_count="${#diag_reachable[@]}"
if [[ $total_skills -gt 0 ]]; then
    pct=$((reachable_count * 100 / total_skills))
else
    pct=0
fi
printf "  Skills reachable via diagnostics: %d/%d (%d%%)\n" "$reachable_count" "$total_skills" "$pct"

# List unreachable skills (up to 15)
unreachable=()
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    skill_name="$(basename "$skill_file" .md)"
    if [[ -z "${diag_reachable[$skill_name]+x}" ]]; then
        unreachable+=("$skill_name")
    fi
done

if [[ ${#unreachable[@]} -gt 0 ]]; then
    echo ""
    echo "  Not reachable via any diagnostic (first 15):"
    shown=0
    for s in "${unreachable[@]}"; do
        [[ $shown -ge 15 ]] && break
        echo "    - $s"
        ((shown++))
    done
    remaining=$((${#unreachable[@]} - shown))
    [[ $remaining -gt 0 ]] && echo "    ... and $remaining more"
fi
echo ""

# ── 5. Playbook -> Skill Usage ───────────────────────────────────────
echo "  5. PLAYBOOK -> SKILL USAGE"
echo "  $(printf '%60s' '' | tr ' ' '-')"
echo ""

declare -A playbook_reachable
for pb_file in "$PROJECT_ROOT"/.claude/playbooks/*.md; do
    [[ ! -f "$pb_file" ]] && continue
    # Look for skill references in steps
    while IFS= read -r line; do
        if [[ "$line" =~ skill:[[:space:]]*\"?([a-z0-9-]+)\"? ]]; then
            playbook_reachable["${BASH_REMATCH[1]}"]=1
        fi
    done < "$pb_file"
    # Also look for backtick-quoted skill names in routing sections
    while IFS= read -r line; do
        if [[ "$line" =~ \`([a-z0-9]+-[a-z0-9-]+)\` ]]; then
            playbook_reachable["${BASH_REMATCH[1]}"]=1
        fi
    done < "$pb_file"
done

pb_reachable_count="${#playbook_reachable[@]}"
if [[ $total_skills -gt 0 ]]; then
    pct=$((pb_reachable_count * 100 / total_skills))
else
    pct=0
fi
printf "  Skills used in playbooks: %d/%d (%d%%)\n" "$pb_reachable_count" "$total_skills" "$pct"
echo ""

# ── 6. Template -> Skill Mapping ─────────────────────────────────────
echo "  6. TEMPLATE -> SKILL MAPPING"
echo "  $(printf '%60s' '' | tr ' ' '-')"
echo ""

declare -A tmpl_skills
for tmpl_file in "$PROJECT_ROOT"/.claude/output-templates/*/*.md; do
    [[ "$(basename "$tmpl_file")" == "output-template.md" ]] && continue
    [[ ! -f "$tmpl_file" ]] && continue
    in_skills=false
    while IFS= read -r line; do
        if [[ "$line" == "applicable_skills:" ]]; then
            in_skills=true
            continue
        fi
        if [[ "$in_skills" == true ]]; then
            if [[ "$line" =~ ^[[:space:]]*-[[:space:]]+(.*) ]]; then
                skill_ref="${BASH_REMATCH[1]}"
                skill_ref="${skill_ref//\"/}"
                skill_ref="$(echo "$skill_ref" | xargs)"
                tmpl_skills["$skill_ref"]=1
            else
                in_skills=false
            fi
        fi
    done < "$tmpl_file"
done

tmpl_coverage="${#tmpl_skills[@]}"
if [[ $total_skills -gt 0 ]]; then
    pct=$((tmpl_coverage * 100 / total_skills))
else
    pct=0
fi
printf "  Skills with template coverage: %d/%d (%d%%)\n" "$tmpl_coverage" "$total_skills" "$pct"

# Skills without any template coverage (first 15)
no_tmpl=()
for skill_file in "$PROJECT_ROOT"/.claude/skills/*/*.md; do
    [[ "$(basename "$skill_file")" == "skill-template.md" ]] && continue
    skill_name="$(basename "$skill_file" .md)"
    if [[ -z "${tmpl_skills[$skill_name]+x}" ]]; then
        no_tmpl+=("$skill_name")
    fi
done

if [[ ${#no_tmpl[@]} -gt 0 ]]; then
    echo ""
    echo "  No template coverage (first 15):"
    shown=0
    for s in "${no_tmpl[@]}"; do
        [[ $shown -ge 15 ]] && break
        echo "    - $s"
        ((shown++))
    done
    remaining=$((${#no_tmpl[@]} - shown))
    [[ $remaining -gt 0 ]] && echo "    ... and $remaining more"
fi
echo ""

echo "  $(printf '%60s' '' | tr ' ' '=')"
echo ""

exit 0
