# Monster File Enrichment Scripts

This set of Python scripts helps enrich monster Lua files with documentation links to the Tibia Wiki.

## Overview

The scripts will:

1. Recursively scan your monster directory for Lua files that define monsters
2. Extract the monster names from these files
3. Fetch information from the Tibia Wiki for each monster
4. Update the Lua files with documentation links and version information
5. Create a list of monsters for which information could not be found

## Requirements

- Python 3.6 or higher
- Required Python packages: `requests`, `beautifulsoup4`

You can install the required packages with:

```bash
pip install requests beautifulsoup4
```

## Scripts

The project consists of several Python scripts:

- `enrich_monster_files.py` - The main script that orchestrates the entire process
- `scan_monsters.py` - Scans your monster directories recursively and extracts monster names
- `wiki_fetcher.py` - Fetches and parses information from the Tibia Wiki
- `update_monster_files.py` - Updates the Lua files with the appropriate documentation

## Usage

1. Place all the scripts in a directory (or use the provided `enrich_monster_files.py` to copy them to a `scripts` directory)
2. Run the main script:

```bash
python enrich_monster_files.py --monster-dir path/to/your/monster/directory
```

By default, the script looks for monster files in `data/monster/lua`.

## Output

The scripts will:

- Add documentation headers to all monster Lua files that can be found on the Tibia Wiki
- Create log files for each step of the process
- Generate a `missing_info.txt` file listing monsters for which information could not be found

## Example

For a monster file like `data/monster/lua/aquatics/blood_crab.lua`, the script will add:

```lua
-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Blood_Crab
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Blood_Crab
---
local mType = Game.createMonsterType("Blood Crab")
...
```

## Notes

- The scripts are designed to be respectful to the Tibia Wiki server by adding delays between requests
- The script will not modify files that already have documentation (files containing `-- Monster:`)
- If wiki information for a monster cannot be found, it will be listed in `missing_info.txt`

## Customization

You can customize the behavior of the scripts by editing the constants at the top of each file or by using command-line arguments for the main script.

## Python setup
```
# Update package lists
sudo apt update -y

# Install Python 3
sudo apt install python3 -y

# Install pip (Python package manager)
sudo apt install python3-pip -y

# Install development tools (optional but recommended)
sudo apt install python3-dev python3-venv -y

# Check Python version
python3 --version

# Check pip version
pip3 --version
```