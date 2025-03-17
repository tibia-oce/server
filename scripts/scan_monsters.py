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
    base_path = Path(base_dir).resolve()  # Use resolve to get the absolute path
    
    if not base_path.exists():
        logging.error(f"Base directory {base_dir} does not exist! Resolved path: {base_path}")
        return monster_files
    
    logging.info(f"Scanning directory: {base_dir} (Resolved: {base_path})")
    
    # Debug: list all subdirectories to confirm we're in the right place
    subdirs = [d for d in base_path.iterdir() if d.is_dir()]
    logging.info(f"Found subdirectories: {', '.join(str(d.name) for d in subdirs)}")
    
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
    # Parse command line arguments
    import argparse
    parser = argparse.ArgumentParser(description='Scan monster directories for Lua files')
    parser.add_argument('--monster-dir', dest='monster_dir', default='data/monster/lua',
                      help='Directory containing monster Lua files (default: data/monster/lua)')
    args = parser.parse_args()
    
    # Use the provided monster directory
    monster_dir = args.monster_dir
    logging.info(f"Using monster directory: {monster_dir}")
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