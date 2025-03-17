#!/bin/bash

# Usage: ./stage_completed_monsters.sh /path/to/monster/directory
# This script finds all Lua monster files that don't have "todo(loot)" comments
# and stages them for commit using git add

# Default directory if not specified
MONSTER_DIR="../data/monster/lua"

# Use provided directory if specified
if [ ! -z "$1" ]; then
  MONSTER_DIR="$1"
fi

# Check if the directory exists
if [ ! -d "$MONSTER_DIR" ]; then
  echo "Error: Directory '$MONSTER_DIR' does not exist"
  exit 1
fi

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: Not in a git repository"
  exit 1
fi

echo "Checking monster files in $MONSTER_DIR for todo(loot) comments..."

# Counter variables
TOTAL=0
STAGED=0
SKIPPED=0

# Process each Lua file
find "$MONSTER_DIR" -type f -name "*.lua" | while read file; do
  TOTAL=$((TOTAL + 1))

  # Check if file contains "todo(loot)"
  if grep -q "todo(loot)" "$file"; then
    echo "Skipping: $file (contains todo items)"
    SKIPPED=$((SKIPPED + 1))
  else
    echo "Staging: $file"
    git add "$file"
    STAGED=$((STAGED + 1))
  fi
done

# Print summary
echo "===== Summary ====="
echo "Total files checked: $TOTAL"
echo "Files staged: $STAGED"
echo "Files skipped: $SKIPPED"
echo "==================="

echo "Done. Use 'git status' to see staged files."
