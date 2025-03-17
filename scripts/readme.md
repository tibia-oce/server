# Monster File Enrichment Scripts

This set of Python scripts helps enrich monster Lua files with documentation links and loot data from the Tibia Wiki.

## Overview

The scripts will:

1. Recursively scan your monster directory for Lua files that define monsters
2. Extract the monster names and existing data from these files
3. Fetch information from the Tibia Wiki for each monster (including version, monster links, and loot data)
4. Update the Lua files with documentation links, version information, and structured loot objects
5. Create reports of monsters for which information could not be found or processed

## Requirements

- Python 3.6 or higher
- Required Python packages: `requests`, `beautifulsoup4`

## Setup

### Setting up a Virtual Environment

Using a virtual environment is recommended to keep dependencies isolated from your system Python.

#### Windows

```batch
# Create a virtual environment
python -m venv venv

# Activate the virtual environment
venv\Scripts\activate

# Install required packages
pip install requests beautifulsoup4
```

#### Linux/macOS

```bash
# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install required packages
pip install requests beautifulsoup4
```

## Scripts

The project consists of several Python scripts:

- `enrich_monster_files.py` - Main script to add version and wiki links to monster files
- `build_monster_loot.py` - Creates proper monster.loot objects based on Tibia Wiki loot statistics
- `scan_monsters.py` - Scans monster directories recursively and extracts monster data
- `wiki_fetcher.py` - Fetches and parses information from the Tibia Wiki
- `update_monster_files.py` - Updates the Lua files with the appropriate documentation

## Usage

First, activate your virtual environment as shown in the setup instructions above. Then:

### 1. Adding Documentation Links

```bash
# Windows
python enrich_monster_files.py --monster-dir path\to\your\monster\directory

# Linux/macOS
python3 enrich_monster_files.py --monster-dir path/to/your/monster/directory
```

### 2. Building Loot Objects

```bash
# Windows
python build_monster_loot.py --monster-dir path\to\your\monster\directory

# Linux/macOS
python3 build_monster_loot.py --monster-dir path/to/your/monster/directory
```

Additional options for loot building:
```bash
python3 build_monster_loot.py --monster-dir path/to/monster/lua --max-version 11.50 --reset-state
```

## Output

The scripts will:

- Add documentation headers to all monster Lua files that can be found on the Tibia Wiki
- Replace or create `monster.loot` objects with properly formatted loot data
- Create log files for each step of the process
- Generate error files listing monsters for which information could not be found

## Examples

### Documentation Links

For a monster file, the script will add documentation like:

```lua
-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Blood_Crab
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Blood_Crab
---
local mType = Game.createMonsterType("Blood Crab")
...
```

### Loot Objects

The script will replace or create monster.loot objects:

```lua
monster.loot = {
	{ id = "gold coin", chance = 85000, maxCount = 20 },  -- 2148
	{ id = "bone", chance = 10000 },  -- 2230
	{ id = "bloody pincers", chance = 5000 },  -- 10549
	-- { id = "rare item", chance = 100 },  -- todo(loot): rare item does not exist in items.xml
}
```

## Special Cases Handling

- For monsters without loot table links but health < 500, an empty loot object is added
- For monsters without loot table links but health >= 500, a todo comment is added
- For items with multiple IDs in items.xml, a todo comment is added
- For items not found in items.xml, the item entry is commented out

## Idempotent Execution

The scripts track state between runs to avoid unnecessary processing. This means:

- Only changed files will be processed in subsequent runs
- Files that were successfully processed previously will be skipped
- You can force reprocessing with the `--reset-state` flag

## Notes

- The scripts are designed to be respectful to the Tibia Wiki server by adding delays between requests
- The loot builder respects version constraints (default max version: 10.98)
- The scripts will not modify files that already have documentation (files containing `-- Monster:`)

## Troubleshooting

If you encounter issues:

1. Check the log files (`loot_builder.log`, `monster_scanner.log`, etc.)
2. Verify your Python version with `python --version` (should be 3.6+)
3. Make sure your virtual environment is activated (command prompt should show `(venv)`)
4. Ensure you have internet access to reach the Tibia Wiki and GitHub repositories
