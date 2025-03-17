#!/usr/bin/env python3
"""
Script to build monster loot objects from Tibia Wiki loot statistics pages.
Makes the script idempotent by tracking the state of previous runs.
"""

import os
import re
import logging
import requests
import xml.etree.ElementTree as ET
from bs4 import BeautifulSoup
from pathlib import Path
from collections import defaultdict
import urllib.parse
import time
from typing import Dict, List, Tuple, Optional, Set, Any
import sys
import json
import hashlib

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('loot_builder.log'),
        logging.StreamHandler()
    ]
)

class StateTracker:
    """Class to track the state of processed files to make the script idempotent."""
    
    def __init__(self, state_file='loot_builder_state.json'):
        self.state_file = Path(state_file)
        self.processed_files = {}
        self.load_state()
    
    def load_state(self):
        """Load the state from the state file if it exists."""
        if self.state_file.exists():
            try:
                with open(self.state_file, 'r', encoding='utf-8') as f:
                    self.processed_files = json.load(f)
                logging.info(f"Loaded state for {len(self.processed_files)} files")
            except Exception as e:
                logging.error(f"Error loading state file: {e}")
                self.processed_files = {}
    
    def save_state(self):
        """Save the current state to the state file."""
        try:
            with open(self.state_file, 'w', encoding='utf-8') as f:
                json.dump(self.processed_files, f, indent=2)
            logging.info(f"Saved state for {len(self.processed_files)} files")
        except Exception as e:
            logging.error(f"Error saving state file: {e}")
    
    def file_needs_processing(self, file_path, content):
        """
        Check if a file needs processing based on its content hash.
        
        Args:
            file_path (str): Path to the file
            content (str): Content of the file
            
        Returns:
            bool: True if the file needs processing, False otherwise
        """
        # Calculate content hash
        content_hash = hashlib.md5(content.encode()).hexdigest()
        
        # Convert file_path to string for dictionary key
        file_key = str(file_path)
        
        # Check if we've processed this file before and if the hash matches
        if file_key in self.processed_files and self.processed_files[file_key]['hash'] == content_hash:
            logging.info(f"Skipping already processed file: {file_path}")
            return False
        
        # Update the state
        self.processed_files[file_key] = {
            'hash': content_hash,
            'timestamp': time.time()
        }
        
        return True
    
    def mark_file_processed(self, file_path, success=True, error=None):
        """
        Mark a file as processed with the result.
        
        Args:
            file_path (str): Path to the file
            success (bool): Whether the processing was successful
            error (str): Error message if processing failed
        """
        file_key = str(file_path)
        if file_key in self.processed_files:
            self.processed_files[file_key]['success'] = success
            if error:
                self.processed_files[file_key]['error'] = error
        
        # Save the state after each file
        self.save_state()


class ItemMapper:
    """Class to map item names to IDs from the items.xml file."""
    
    def __init__(self, xml_url="https://raw.githubusercontent.com/tibia-oce/assets/refs/heads/master/items/items.xml"):
        self.xml_url = xml_url
        self.name_to_ids = defaultdict(list)
        self.load_items_xml()
    
    def load_items_xml(self) -> bool:
        """
        Load and parse the items.xml file from the given URL.
        
        Returns:
            bool: True if successful, False otherwise
        """
        try:
            logging.info(f"Fetching items.xml from {self.xml_url}")
            response = requests.get(self.xml_url)
            
            if response.status_code != 200:
                logging.error(f"Failed to fetch items.xml, status code: {response.status_code}")
                return False
            
            # Parse the XML content
            root = ET.fromstring(response.content)
            
            # Process each item
            for item in root.findall('.//item'):
                item_id = item.get('id')
                from_id = item.get('fromid')
                to_id = item.get('toid')
                name = item.get('name')
                
                if name:
                    if item_id:
                        self.name_to_ids[name].append(item_id)
                    
                    # Handle fromid/toid ranges
                    if from_id and to_id:
                        for i in range(int(from_id), int(to_id) + 1):
                            self.name_to_ids[name].append(str(i))
            
            logging.info(f"Loaded {len(self.name_to_ids)} unique item names from items.xml")
            return True
        
        except Exception as e:
            logging.error(f"Error loading items.xml: {e}")
            return False
    
    def get_ids_for_name(self, name: str) -> List[str]:
        """
        Get all IDs for a given item name.
        
        Args:
            name (str): The item name to look up
            
        Returns:
            List[str]: List of IDs for the item, or empty list if not found
        """
        return self.name_to_ids.get(name, [])
    
    def item_exists(self, name: str) -> bool:
        """
        Check if an item with the given name exists in the items.xml.
        
        Args:
            name (str): The item name to check
            
        Returns:
            bool: True if the item exists, False otherwise
        """
        return bool(self.name_to_ids.get(name, []))
    
    def has_multiple_ids(self, name: str) -> bool:
        """
        Check if an item has multiple IDs.
        
        Args:
            name (str): The item name to check
            
        Returns:
            bool: True if the item has multiple IDs, False otherwise
        """
        return len(self.name_to_ids.get(name, [])) > 1


class LootTableParser:
    """Class to parse loot statistics tables from the Tibia Wiki."""
    
    def __init__(self, delay=1):
        """
        Initialize the parser with a delay between requests to be respectful to the server.
        
        Args:
            delay (int): Delay in seconds between requests
        """
        self.delay = delay
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'TibiaMonsterLootBuilder/1.0 (Respectful Script)'
        })
    
    def fetch_loot_page(self, url: str) -> Optional[str]:
        """
        Fetch a loot statistics page from the Tibia Wiki.
        
        Args:
            url (str): URL of the loot statistics page
            
        Returns:
            str: HTML content of the page or None if not found
        """
        logging.info(f"Fetching loot page: {url}")
        
        try:
            response = self.session.get(url)
            time.sleep(self.delay)  # Be respectful to the server
            
            if response.status_code == 200:
                return response.text
            else:
                logging.warning(f"Failed to fetch {url}, status code: {response.status_code}")
                return None
        except Exception as e:
            logging.error(f"Error fetching {url}: {e}")
            return None
    
    def extract_version_tables(self, html_content: str) -> List[Tuple[str, BeautifulSoup]]:
        """
        Extract loot tables from the HTML content along with their version information.
        
        Args:
            html_content (str): HTML content of the loot statistics page
            
        Returns:
            List[Tuple[str, BeautifulSoup]]: List of (version, table) tuples
        """
        if not html_content:
            return []
        
        try:
            soup = BeautifulSoup(html_content, 'html.parser')
            tables = soup.find_all('table', class_='loot_list')
            version_tables = []
            
            for table in tables:
                # Find the version information in the caption
                caption = table.find('caption')
                if not caption:
                    continue
                
                # Look for update version in the caption
                update_link = caption.find('a', href=lambda href: href and 'Updates' in href)
                if not update_link:
                    continue
                
                version_text = update_link.text
                if 'Update' in version_text:
                    version_text = version_text.replace('Update', '').strip()
                
                # Extract version number
                match = re.search(r'(\d+\.\d+)', version_text)
                if match:
                    version = match.group(1)
                    version_tables.append((version, table))
                    logging.info(f"Found loot table for version {version}")
            
            # Sort by version number in descending order
            version_tables.sort(key=lambda x: float(x[0]), reverse=True)
            return version_tables
        
        except Exception as e:
            logging.error(f"Error extracting version tables: {e}")
            return []
    
    def extract_loot_items(self, table: BeautifulSoup) -> List[Dict[str, Any]]:
        """
        Extract loot items from a loot table.
        
        Args:
            table (BeautifulSoup): BeautifulSoup object of the loot table
            
        Returns:
            List[Dict[str, Any]]: List of loot items with their properties
        """
        items = []
        
        try:
            rows = table.find_all('tr')
            for row in rows:
                cells = row.find_all('td')
                if len(cells) < 4:  # Need at least sprite, amount, item, percentage
                    continue
                
                # Skip header row
                if 'loot_list_header' in row.get('class', ''):
                    continue
                
                # Check which table format we're dealing with (different versions have different layouts)
                if len(cells) >= 6:
                    # Newer format with more columns
                    item_index = 2  # Usually the 3rd column
                    percentage_index = 5  # Usually the 6th column
                    amount_index = 1  # Usually the 2nd column
                else:
                    # Older format with fewer columns
                    item_index = 1  # Usually the 2nd column
                    percentage_index = 3  # Usually the 4th column
                    amount_index = 2  # Usually the 3rd column
                
                # Extract item name
                item_cell = cells[item_index]
                item_link = item_cell.find('a')
                item_name = ""
                
                if item_link:
                    item_name = item_link.text.strip()
                else:
                    item_name = item_cell.text.strip()
                
                # Skip "Empty" drops
                if item_name.lower() == 'empty':
                    continue
                
                # Extract percentage
                percentage_text = cells[percentage_index].text.strip().replace('%', '')
                try:
                    percentage = float(percentage_text)
                except ValueError:
                    percentage = 0
                
                # Extract amount information (if available)
                amount_text = cells[amount_index].text.strip()
                min_count = 1
                max_count = 1
                
                # Check for amount ranges like "1-5"
                amount_match = re.search(r'(\d+)-(\d+)', amount_text)
                if amount_match:
                    min_count = int(amount_match.group(1))
                    max_count = int(amount_match.group(2))
                else:
                    # Try to parse as a single number
                    try:
                        count = int(amount_text)
                        if count > 1:
                            min_count = count
                            max_count = count
                    except ValueError:
                        pass
                
                # Create the item entry
                item_entry = {
                    'name': item_name,
                    'percentage': percentage,
                    'chance': int(percentage * 1000),  # Convert percentage to chance value
                    'min_count': min_count,
                    'max_count': max_count
                }
                
                items.append(item_entry)
                logging.debug(f"Found item: {item_name}, chance: {percentage}%, count: {min_count}-{max_count}")
            
            return items
        
        except Exception as e:
            logging.error(f"Error extracting loot items: {e}")
            return []


class LootBuilder:
    """Main class to build monster loot objects."""
    
    def __init__(self, monster_dir: str, items_xml_url: str = "https://raw.githubusercontent.com/tibia-oce/assets/refs/heads/master/items/items.xml"):
        """
        Initialize the loot builder.
        
        Args:
            monster_dir (str): Directory containing monster Lua files
            items_xml_url (str): URL to the items.xml file
        """
        self.monster_dir = Path(monster_dir)
        self.item_mapper = ItemMapper(items_xml_url)
        self.loot_parser = LootTableParser(delay=2)  # Be extra respectful with a 2-second delay
        self.max_version = "10.98"  # Maximum version to consider
        self.errors = []
        self.state_tracker = StateTracker()
    
    def find_monster_files(self) -> List[Path]:
        """
        Find all monster Lua files in the given directory.
        
        Returns:
            List[Path]: List of paths to monster Lua files
        """
        monster_files = []
        
        if not self.monster_dir.exists():
            logging.error(f"Monster directory {self.monster_dir} does not exist!")
            return monster_files
        
        logging.info(f"Scanning directory: {self.monster_dir}")
        
        for file_path in self.monster_dir.glob('**/*.lua'):
            # Check if it's a monster file with loot table link
            try:
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read()
                    if 'createMonsterType' in content and 'Loot table:' in content:
                        monster_files.append(file_path)
                        logging.info(f"Found monster file with loot table: {file_path}")
            except Exception as e:
                logging.error(f"Error reading file {file_path}: {e}")
        
        logging.info(f"Found {len(monster_files)} monster files with loot tables")
        return monster_files
    
    def extract_loot_table_url(self, file_path: Path) -> Optional[str]:
        """
        Extract the loot table URL from a monster file.
        
        Args:
            file_path (Path): Path to the monster Lua file
            
        Returns:
            str: The loot table URL or None if not found
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
                
                # Regular expression to extract the loot table URL
                match = re.search(r'-- Loot table: (https://[^\s\n]+)', content)
                if match:
                    return match.group(1)
                else:
                    return None
        except Exception as e:
            logging.error(f"Error extracting loot table URL from {file_path}: {e}")
            return None
    
    def extract_monster_name(self, file_path: Path) -> Optional[str]:
        """
        Extract the monster name from a Lua file.
        
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
                    return None
        except Exception as e:
            logging.error(f"Error extracting monster name from {file_path}: {e}")
            return None
    
    def get_suitable_loot_table(self, loot_url: str) -> Optional[List[Dict[str, Any]]]:
        """
        Get the most suitable loot table from a loot statistics page.
        
        Args:
            loot_url (str): URL of the loot statistics page
            
        Returns:
            Optional[List[Dict[str, Any]]]: List of loot items or None if no suitable table found
        """
        html_content = self.loot_parser.fetch_loot_page(loot_url)
        if not html_content:
            return None
        
        # Extract all version tables
        version_tables = self.loot_parser.extract_version_tables(html_content)
        if not version_tables:
            logging.warning(f"No version tables found in {loot_url}")
            return None
        
        # Find the latest table that's before or at the max version
        for version, table in version_tables:
            if self.compare_versions(version, self.max_version) <= 0:
                logging.info(f"Using loot table for version {version}")
                return self.loot_parser.extract_loot_items(table)
        
        logging.warning(f"No suitable loot table found in {loot_url}")
        return None
    
    def compare_versions(self, version1: str, version2: str) -> int:
        """
        Compare two version strings.
        
        Args:
            version1 (str): First version string
            version2 (str): Second version string
            
        Returns:
            int: -1 if version1 < version2, 0 if version1 == version2, 1 if version1 > version2
        """
        v1_parts = list(map(int, version1.split('.')))
        v2_parts = list(map(int, version2.split('.')))
        
        for i in range(max(len(v1_parts), len(v2_parts))):
            v1 = v1_parts[i] if i < len(v1_parts) else 0
            v2 = v2_parts[i] if i < len(v2_parts) else 0
            
            if v1 < v2:
                return -1
            elif v1 > v2:
                return 1
        
        return 0
    
    def build_loot_object(self, loot_items: List[Dict[str, Any]]) -> List[str]:
        """
        Build the monster.loot object as a list of formatted strings.
        
        Args:
            loot_items (List[Dict[str, Any]]): List of loot items
            
        Returns:
            List[str]: Lines for the monster.loot object
        """
        loot_lines = []
        
        for item in loot_items:
            item_name = item['name'].lower()
            chance = item['chance']
            
            # Check if the item exists in the items.xml
            if not self.item_mapper.item_exists(item_name):
                # Item doesn't exist, comment it out
                line = f"\t-- {{ id = \"{item_name}\", chance = {chance} }},  -- todo(loot): {item_name} does not exist in items.xml"
                loot_lines.append(line)
                continue
            
            # Get the IDs for the item
            item_ids = self.item_mapper.get_ids_for_name(item_name)
            
            # Build the item entry
            entry = f"\t{{ id = \"{item_name}\", chance = {chance}"
            
            # Add minCount and maxCount if applicable
            if item['min_count'] > 1 or item['max_count'] > 1:
                if item['min_count'] == item['max_count']:
                    entry += f", maxCount = {item['max_count']}"
                else:
                    entry += f", minCount = {item['min_count']}, maxCount = {item['max_count']}"
            
            entry += " }"
            
            # Add the ID comment
            if self.item_mapper.has_multiple_ids(item_name):
                entry += f",  -- todo(loot): {', '.join(item_ids)}"
            else:
                entry += f",  -- {item_ids[0]}"
            
            loot_lines.append(entry)
        
        return loot_lines
    
    def add_loot_table_error(self, file_path: Path) -> bool:
        """
        Add a comment at the top of the file indicating that the loot table cannot be found.
        
        Args:
            file_path (Path): Path to the monster Lua file
            
        Returns:
            bool: True if successful, False otherwise
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
            
            # Check if the error comment already exists
            if 'todo(loot): Loot table cannot be found' in content:
                logging.info(f"Loot table error comment already exists in {file_path}")
                return True
            
            # Find the position after the loot table line
            match = re.search(r'-- Loot table: [^\n]*\n', content)
            if match:
                insert_pos = match.end()
                new_content = content[:insert_pos] + '-- todo(loot): Loot table cannot be found\n' + content[insert_pos:]
                
                # Write the updated content back to the file
                with open(file_path, 'w', encoding='utf-8') as file:
                    file.write(new_content)
                
                logging.info(f"Added loot table error comment to {file_path}")
                return True
            else:
                logging.warning(f"Could not find loot table line in {file_path}")
                return False
        
        except Exception as e:
            logging.error(f"Error adding loot table error comment to {file_path}: {e}")
            return False
    
    def update_monster_loot(self, file_path: Path) -> bool:
        """
        Update the monster.loot section in a monster file.
        
        Args:
            file_path (Path): Path to the monster Lua file
            
        Returns:
            bool: True if successful, False otherwise
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
            
            # Check if this file needs processing
            if not self.state_tracker.file_needs_processing(file_path, content):
                return True
            
            monster_name = self.extract_monster_name(file_path)
            if not monster_name:
                error_msg = f"Could not extract monster name from {file_path}"
                self.errors.append(error_msg)
                self.state_tracker.mark_file_processed(file_path, False, error_msg)
                return False
            
            # Get the loot table URL
            loot_url = self.extract_loot_table_url(file_path)
            if not loot_url:
                error_msg = f"No loot table URL found for {monster_name}"
                self.errors.append(error_msg)
                self.state_tracker.mark_file_processed(file_path, False, error_msg)
                return False
            
            # Get the loot items
            loot_items = self.get_suitable_loot_table(loot_url)
            if not loot_items:
                error_msg = f"No suitable loot table found for {monster_name}"
                self.errors.append(error_msg)
                self.add_loot_table_error(file_path)
                self.state_tracker.mark_file_processed(file_path, False, error_msg)
                return False
            
            # Build the loot object
            loot_lines = self.build_loot_object(loot_items)
            
            # Replace the monster.loot section
            loot_pattern = r'monster\.loot = \{[^}]*\}'
            loot_section = 'monster.loot = {\n' + '\n'.join(loot_lines) + '\n}'
            
            if re.search(loot_pattern, content, re.DOTALL):
                new_content = re.sub(loot_pattern, loot_section, content, flags=re.DOTALL)
                
                # Write the updated content back to the file
                with open(file_path, 'w', encoding='utf-8') as file:
                    file.write(new_content)
                
                logging.info(f"Updated loot for {monster_name}")
                self.state_tracker.mark_file_processed(file_path, True)
                return True
            else:
                error_msg = f"Could not find monster.loot section in {file_path}"
                self.errors.append(error_msg)
                self.state_tracker.mark_file_processed(file_path, False, error_msg)
                return False
        
        except Exception as e:
            error_msg = f"Error updating {file_path}: {e}"
            self.errors.append(error_msg)
            logging.error(error_msg)
            self.state_tracker.mark_file_processed(file_path, False, error_msg)
            return False
    
    def process_all_monsters(self):
        """Process all monster files and update their loot objects."""
        monster_files = self.find_monster_files()
        
        # Create a file to log errors
        error_file = Path('loot_errors.txt')
        
        total = len(monster_files)
        success = 0
        failed = 0
        skipped = 0
        
        for i, file_path in enumerate(monster_files):
            logging.info(f"Processing {i+1}/{total}: {file_path}")
            
            # Check if this file has already been processed successfully
            file_key = str(file_path)
            if (file_key in self.state_tracker.processed_files 
                and self.state_tracker.processed_files[file_key].get('success', False)):
                logging.info(f"Skipping already successfully processed file: {file_path}")
                skipped += 1
                continue
            
            if self.update_monster_loot(file_path):
                success += 1
            else:
                failed += 1
        
        # Write errors to file
        with open(error_file, 'w', encoding='utf-8') as f:
            f.write("# Loot processing errors\n")
            for error in self.errors:
                f.write(f"{error}\n")
        
        logging.info(f"Process completed. Updated {success} files, {failed} files with errors, {skipped} files skipped.")
        logging.info(f"Errors written to {error_file}")


if __name__ == "__main__":
    # Parse command line arguments
    import argparse
    parser = argparse.ArgumentParser(description='Build monster loot objects from Tibia Wiki loot statistics pages')
    parser.add_argument('--monster-dir', dest='monster_dir', required=True,
                      help='Directory containing monster Lua files')
    parser.add_argument('--items-xml', dest='items_xml_url', 
                      default="https://raw.githubusercontent.com/tibia-oce/assets/refs/heads/master/items/items.xml",
                      help='URL to the items.xml file')
    parser.add_argument('--reset-state', dest='reset_state', action='store_true',
                      help='Reset the state and process all files')
    args = parser.parse_args()
    
    # Reset state if requested
    if args.reset_state and os.path.exists('loot_builder_state.json'):
        os.remove('loot_builder_state.json')
        logging.info("State reset. Processing all files.")
    
    # Build the loot objects
    builder = LootBuilder(args.monster_dir, args.items_xml_url)
    builder.process_all_monsters()
