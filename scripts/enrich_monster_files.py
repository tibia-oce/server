#!/usr/bin/env python3
"""
Main script to enrich monster files with documentation links.
This script orchestrates the entire process.
"""

import os
import logging
import argparse
from pathlib import Path
import subprocess
import sys

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('enrich_monsters.log'),
        logging.StreamHandler()
    ]
)

def run_script(script_path):
    """
    Run a Python script and return the result.
    
    Args:
        script_path (str): Path to the Python script
        
    Returns:
        bool: True if the script executed successfully, False otherwise
    """
    try:
        subprocess.run([sys.executable, script_path], check=True)
        return True
    except subprocess.CalledProcessError as e:
        logging.error(f"Error running script {script_path}: {e}")
        return False
    except Exception as e:
        logging.error(f"Unexpected error running script {script_path}: {e}")
        return False

def main():
    """Main function to orchestrate the enrichment process."""
    parser = argparse.ArgumentParser(description='Enrich monster files with wiki links and version information')
    parser.add_argument('--monster-dir', dest='monster_dir', default='data/monster/lua',
                      help='Directory containing monster Lua files (default: data/monster/lua)')
    parser.add_argument('--scripts-dir', dest='scripts_dir', default='scripts',
                      help='Directory to store the scripts (default: scripts)')
    args = parser.parse_args()
    
    # Create the scripts directory if it doesn't exist
    scripts_dir = Path(args.scripts_dir)
    if not scripts_dir.exists():
        scripts_dir.mkdir(parents=True)
    
    # Define the paths to the scripts
    scan_script = scripts_dir / 'scan_monsters.py'
    wiki_script = scripts_dir / 'wiki_fetcher.py'
    update_script = scripts_dir / 'update_monster_files.py'
    
    # Copy the scripts to the scripts directory
    current_dir = Path(__file__).parent
    
    try:
        # Copy the scripts from where they are to the scripts directory
        # In a real scenario, these would be part of your project
        # For now, we'll assume they're in the same directory as this script
        for script_name in ['scan_monsters.py', 'wiki_fetcher.py', 'update_monster_files.py']:
            src_path = current_dir / script_name
            dst_path = scripts_dir / script_name
            
            # If the script exists in the current directory, copy it
            if src_path.exists():
                with open(src_path, 'r', encoding='utf-8') as src_file:
                    content = src_file.read()
                with open(dst_path, 'w', encoding='utf-8') as dst_file:
                    dst_file.write(content)
                logging.info(f"Copied {script_name} to {scripts_dir}")
            else:
                logging.warning(f"Script {script_name} not found in current directory")
    except Exception as e:
        logging.error(f"Error copying scripts: {e}")
        return
    
    # Make the scripts executable
    for script_path in [scan_script, wiki_script, update_script]:
        if os.name != 'nt':  # Not Windows
            try:
                os.chmod(script_path, 0o755)
            except Exception as e:
                logging.warning(f"Could not make {script_path} executable: {e}")
    
    # Run the scripts in sequence
    logging.info("Step 1: Scanning monster files...")
    if not run_script(scan_script):
        logging.error("Failed to scan monster files, aborting")
        return
    
    logging.info("Step 2: Updating monster files with wiki information...")
    if not run_script(update_script):
        logging.error("Failed to update monster files, aborting")
        return
    
    logging.info("Process completed successfully")
    logging.info("Check missing_info.txt for monsters without wiki information")

if __name__ == "__main__":
    main()
