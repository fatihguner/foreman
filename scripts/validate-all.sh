#!/usr/bin/env bash
#
# validate-all.sh — Master validation script for the Foreman project
#
# Runs all five layer validators sequentially and reports a grand summary.
#
# Usage:
#   ./scripts/validate-all.sh [--help] [--verbose] [--stop-on-first-failure]
#
# Exit codes:
#   0  All validators pass
#   1  One or more validators reported failures
#
# Author: Foreman Contributors

set -uo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

VALIDATORS=(
    "validate-skills.sh:Skills"
    "validate-templates.sh:Output Templates"
    "validate-diagnostics.sh:Diagnostics"
    "validate-playbooks.sh:Playbooks"
    "validate-hooks.sh:Hooks"
)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BOLD='\033[1m'
NC='\033[0m'

VERBOSE=0
STOP_ON_FIRST=0
PASS_ARGS=()

# ---------------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------------
usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Runs all Foreman validators and reports a grand summary.

Options:
  --help                    Show this help message and exit
  --verbose                 Pass --verbose to each validator
  --stop-on-first-failure   Stop after the first validator that reports failures

Exit codes:
  0  All validators pass
  1  One or more validators reported failures
EOF
    exit 0
}

# ---------------------------------------------------------------------------
# Parse arguments
# ---------------------------------------------------------------------------
for arg in "$@"; do
    case "$arg" in
        --help) usage ;;
        --verbose) VERBOSE=1; PASS_ARGS+=(--verbose) ;;
        --stop-on-first-failure) STOP_ON_FIRST=1 ;;
        *) echo "Unknown option: $arg"; usage ;;
    esac
done

# ---------------------------------------------------------------------------
# Run validators
# ---------------------------------------------------------------------------
printf "${BOLD}===========================================================${NC}\n"
printf "${BOLD}  Foreman — Full Project Validation${NC}\n"
printf "${BOLD}===========================================================${NC}\n\n"

TOTAL_VALIDATORS=0
PASSED_VALIDATORS=0
FAILED_VALIDATORS=0
FAILED_NAMES=()

for entry in "${VALIDATORS[@]}"; do
    script="${entry%%:*}"
    label="${entry##*:}"
    TOTAL_VALIDATORS=$((TOTAL_VALIDATORS + 1))

    printf "${BOLD}-----------------------------------------------------------${NC}\n"
    printf "${BOLD}  Running: %s${NC}\n" "$label"
    printf "${BOLD}-----------------------------------------------------------${NC}\n"

    if "$SCRIPT_DIR/$script" "${PASS_ARGS[@]+"${PASS_ARGS[@]}"}"; then
        PASSED_VALIDATORS=$((PASSED_VALIDATORS + 1))
    else
        FAILED_VALIDATORS=$((FAILED_VALIDATORS + 1))
        FAILED_NAMES+=("$label")
        if [[ $STOP_ON_FIRST -eq 1 ]]; then
            printf "\n${YELLOW}Stopping early (--stop-on-first-failure).${NC}\n"
            break
        fi
    fi
    echo ""
done

# ---------------------------------------------------------------------------
# Grand summary
# ---------------------------------------------------------------------------
printf "${BOLD}===========================================================${NC}\n"
printf "${BOLD}  Grand Summary${NC}\n"
printf "${BOLD}===========================================================${NC}\n"
printf "  Validators run:    %d / %d\n" "$TOTAL_VALIDATORS" "${#VALIDATORS[@]}"
printf "  ${GREEN}Passed:            %d${NC}\n" "$PASSED_VALIDATORS"

if [[ $FAILED_VALIDATORS -gt 0 ]]; then
    printf "  ${RED}Failed:            %d${NC}\n" "$FAILED_VALIDATORS"
    for fn in "${FAILED_NAMES[@]}"; do
        printf "    ${RED}-> %s${NC}\n" "$fn"
    done
else
    printf "  Failed:            %d\n" "$FAILED_VALIDATORS"
fi

printf "${BOLD}===========================================================${NC}\n"

if [[ $FAILED_VALIDATORS -gt 0 ]]; then
    exit 1
fi
exit 0
