#!/usr/bin/env python3
"""
Script to update monster Lua files with documentation links.
"""

import os
import logging
from pathlib import Path
from wiki_fetcher import TibiaWikiFetcher

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('updater.log'),
        logging.StreamHandler()
    ]
)

def update_monster_file(file_path, monster_info):
    """
    Update a monster Lua file with documentation links.
    
    Args:
        file_path (str): Path to the monster Lua file
        monster_info (dict): Dictionary with monster information
        
    Returns:
        bool: True if successful, False otherwise
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            content = file.read()
        
        # Check if the file already has documentation
        if '-- Monster:' in content:
            logging.info(f"File {file_path} already has documentation, skipping")
            return True
        
        # Create the documentation header
        header = []
        if monster_info["version"]:
            header.append(f"-- Version: {monster_info['version']}")
        if monster_info["wiki_url"]:
            header.append(f"-- Monster: {monster_info['wiki_url']}")
        if monster_info["loot_url"]:
            header.append(f"-- Loot table: {monster_info['loot_url']}")
        header.append("---\n")
        
        # Combine header with existing content
        new_content = '\n'.join(header) + content
        
        # Write the updated content back to the file
        with open(file_path, 'w', encoding='utf-8') as file:
            file.write(new_content)
        
        logging.info(f"Successfully updated {file_path}")
        return True
    except Exception as e:
        logging.error(f"Error updating file {file_path}: {e}")
        return False

def log_missing_info(monster_name, file_path, missing_file):
    """
    Log missing monster information to a file.
    
    Args:
        monster_name (str): The name of the monster
        file_path (str): Path to the monster Lua file
        missing_file (file): File object to write to
    """
    missing_file.write(f"{monster_name}|{file_path}\n")

def main():
    """Main function to update all monster files."""
    # Create a directory for the scripts if it doesn't exist
    scripts_dir = Path('scripts')
    if not scripts_dir.exists():
        scripts_dir.mkdir(parents=True)
    
    # Initialize the wiki fetcher
    fetcher = TibiaWikiFetcher(delay=2)  # Be respectful with a 2-second delay
    
    # Read the list of monster files
    with open('monster_files.txt', 'r', encoding='utf-8') as file:
        monster_entries = [line.strip().split('|') for line in file if line.strip()]
    
    # Open a file to log monsters with missing information
    with open('missing_info.txt', 'w', encoding='utf-8') as missing_file:
        missing_file.write("# Monsters with missing wiki information\n")
        missing_file.write("# Format: monster_name|file_path\n")
        
        # Process each monster
        total = len(monster_entries)
        success = 0
        missing = 0
        
        for i, entry in enumerate(monster_entries):
            if len(entry) != 2:
                logging.warning(f"Invalid entry format: {entry}")
                continue
            
            monster_name, file_path = entry
            logging.info(f"Processing {i+1}/{total}: {monster_name}")
            
            # Get monster information from the wiki
            monster_info = fetcher.get_monster_info(monster_name)
            
            if monster_info["success"]:
                # Update the monster file
                if update_monster_file(file_path, monster_info):
                    success += 1
            else:
                # Log monsters with missing information
                log_missing_info(monster_name, file_path, missing_file)
                missing += 1
                logging.warning(f"Could not find wiki information for {monster_name}")
    
    logging.info(f"Process completed. Updated {success} files, {missing} files with missing information.")

if __name__ == "__main__":
    main()
