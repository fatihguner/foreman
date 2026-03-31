#!/usr/bin/env bash
# ─────────────────────────────────────────────
# build-codex.sh
# Transforms .claude/skills/ into Codex-compatible skills/ directory
# Source: .claude/skills/{category}/{skill-name}.md
# Target: skills/{skill-name}/SKILL.md
#
# Codex expects: skills/{skill-name}/SKILL.md
# Foreman has:   .claude/skills/{category}/{skill-name}.md
#
# This script bridges the two formats without modifying source files.
# Run after any skill changes, or in CI before publishing.
#
# Usage: ./scripts/build-codex.sh [--clean] [--verbose] [--dry-run]
# Author: Fatih Guner
# ─────────────────────────────────────────────

set -euo pipefail

# ─── Configuration ───
SOURCE_DIR=".claude/skills"
TARGET_DIR="skills"
SCHEMA_DIR="_schema"

# ─── Flags ───
CLEAN=false
VERBOSE=false
DRY_RUN=false

for arg in "$@"; do
  case "$arg" in
    --clean)   CLEAN=true ;;
    --verbose) VERBOSE=true ;;
    --dry-run) DRY_RUN=true ;;
    --help|-h)
      echo "Usage: ./scripts/build-codex.sh [--clean] [--verbose] [--dry-run]"
      echo ""
      echo "Transforms .claude/skills/ into Codex-compatible skills/ directory."
      echo ""
      echo "Options:"
      echo "  --clean     Remove existing skills/ before building"
      echo "  --verbose   Show each file being processed"
      echo "  --dry-run   Show what would be done without writing files"
      echo "  --help      Show this help message"
      exit 0
      ;;
  esac
done

# ─── Colors ───
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ─── Validation ───
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' not found."
  echo "Run this script from the Foreman project root."
  exit 1
fi

# ─── Clean ───
if [ "$CLEAN" = true ]; then
  if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}[DRY-RUN]${NC} Would remove $TARGET_DIR/"
  else
    rm -rf "$TARGET_DIR"
    echo -e "${YELLOW}Cleaned${NC} $TARGET_DIR/"
  fi
fi

# ─── Build ───
total=0
skipped=0
created=0
updated=0

for source_file in "$SOURCE_DIR"/*/*.md; do
  # Skip schema files
  dir_name=$(basename "$(dirname "$source_file")")
  [ "$dir_name" = "$SCHEMA_DIR" ] && continue

  # Extract skill name from filename (without .md)
  skill_name=$(basename "$source_file" .md)
  target_dir="$TARGET_DIR/$skill_name"
  target_file="$target_dir/SKILL.md"

  total=$((total + 1))

  # Check if target needs updating
  if [ -f "$target_file" ]; then
    # Compare checksums — skip if identical
    if command -v md5sum &>/dev/null; then
      source_hash=$(md5sum "$source_file" | cut -d' ' -f1)
      target_hash=$(md5sum "$target_file" | cut -d' ' -f1)
    else
      source_hash=$(md5 -q "$source_file")
      target_hash=$(md5 -q "$target_file")
    fi
    if [ "$source_hash" = "$target_hash" ]; then
      skipped=$((skipped + 1))
      [ "$VERBOSE" = true ] && echo -e "  ${BLUE}skip${NC} $skill_name (unchanged)"
      continue
    fi
    updated=$((updated + 1))
    action="update"
  else
    created=$((created + 1))
    action="create"
  fi

  if [ "$DRY_RUN" = true ]; then
    echo -e "  ${YELLOW}[DRY-RUN]${NC} Would $action $target_file"
  else
    mkdir -p "$target_dir"
    cp "$source_file" "$target_file"
    [ "$VERBOSE" = true ] && echo -e "  ${GREEN}$action${NC} $skill_name"
  fi
done

# ─── Summary ───
echo ""
echo -e "${GREEN}Codex build complete${NC}"
echo "  Source:   $SOURCE_DIR/"
echo "  Target:   $TARGET_DIR/"
echo "  Total:    $total skills"
echo "  Created:  $created"
echo "  Updated:  $updated"
echo "  Skipped:  $skipped (unchanged)"

if [ "$DRY_RUN" = true ]; then
  echo ""
  echo -e "${YELLOW}This was a dry run. No files were written.${NC}"
fi

# ─── Add to .gitignore if not present ───
if ! grep -q "^skills/$" .gitignore 2>/dev/null; then
  if [ "$DRY_RUN" = false ]; then
    echo "" >> .gitignore
    echo "# Codex-generated skills directory (built from .claude/skills/)" >> .gitignore
    echo "skills/" >> .gitignore
    echo ""
    echo -e "${YELLOW}Added${NC} skills/ to .gitignore (generated directory)"
  fi
fi
