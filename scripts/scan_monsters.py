#!/usr/bin/env python3
"""
Script to scan the monster directories recursively and find all monster Lua files.
"""

import os
import re
import logging
from pathlib import Path

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('monster_scanner.log'),
        logging.StreamHandler()
    ]
)

def find_monster_files(base_dir):
    """
    Recursively scan the directory for monster Lua files.
    
    Args:
        base_dir (str): The base directory to start scanning from
        
    Returns:
        list: List of paths to monster Lua files
    """
    monster_files = []
    base_path = Path(base_dir)
    
    if not base_path.exists():
        logging.error(f"Base directory {base_dir} does not exist!")
        return monster_files
    
    logging.info(f"Scanning directory: {base_dir}")
    
    for file_path in base_path.glob('**/*.lua'):
        # Read the file to check if it's a monster file
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
                # Check if this is a monster file by looking for createMonsterType
                if 'createMonsterType' in content:
                    monster_files.append(file_path)
                    logging.info(f"Found monster file: {file_path}")
        except Exception as e:
            logging.error(f"Error reading file {file_path}: {e}")
    
    logging.info(f"Found {len(monster_files)} monster files")
    return monster_files

def extract_monster_name(file_path):
    """
    Extract the monster name from the Lua file.
    
    Args:
        file_path (Path): Path to the monster Lua file
        
    Returns:
        str: The monster name or None if not found
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
            
            # Regular expression to extract the monster name
            match = re.search(r'createMonsterType\(["\']([^"\']+)["\']', content)
            if match:
                return match.group(1)
            else:
                logging.warning(f"Could not extract monster name from {file_path}")
                return None
    except Exception as e:
        logging.error(f"Error extracting monster name from {file_path}: {e}")
        return None

if __name__ == "__main__":
    # Example usage
    monster_dir = "data/monster/lua"
    monster_files = find_monster_files(monster_dir)
    
    # Create a list of monster names and their files
    monsters = []
    for file_path in monster_files:
        monster_name = extract_monster_name(file_path)
        if monster_name:
            monsters.append({
                "name": monster_name,
                "file_path": str(file_path)
            })
    
    # Save the results to a file for the next script to use
    with open('monster_files.txt', 'w', encoding='utf-8') as out_file:
        for monster in monsters:
            out_file.write(f"{monster['name']}|{monster['file_path']}\n")
    
    logging.info(f"Extracted {len(monsters)} monster names and saved to monster_files.txt")
