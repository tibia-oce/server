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

FOODS_DICT = {
    2362: True,  # carrot
    2666: True,  # meat
    2667: True,  # fish
    2668: True,  # salmon
    2669: True,  # northern pike
    2670: True,  # shrimp
    2671: True,  # ham
    2672: True,  # dragon ham
    2673: True,  # pear
    2674: True,  # red apple
    2675: True,  # orange
    2676: True,  # banana
    2677: True,  # blueberry
    2678: True,  # coconut
    2679: True,  # cherry
    2680: True,  # strawberry
    2681: True,  # grapes
    2682: True,  # melon
    2683: True,  # pumpkin
    2684: True,  # carrot
    2685: True,  # tomato
    2686: True,  # corncob
    2687: True,  # cookie
    2688: True,  # candy cane
    2689: True,  # bread
    2690: True,  # roll
    2691: True,  # brown bread
    2695: True,  # egg
    2696: True,  # cheese
    2787: True,  # white mushroom
    2788: True,  # red mushroom
    2789: True,  # brown mushroom
    2790: True,  # orange mushroom
    2791: True,  # wood mushroom
    2792: True,  # dark mushroom
    2793: True,  # some mushrooms
    2794: True,  # some mushrooms
    2795: True,  # fire mushroom
    2796: True,  # green mushroom
    5097: True,  # mango
    5678: True,  # tortoise egg
    6125: True,  # tortoise egg from Nargor
    6278: True,  # cake
    6279: True,  # decorated cake
    6393: True,  # valentine's cake
    6394: True,  # cream cake
    6501: True,  # gingerbread man
    6541: True,  # coloured egg (yellow)
    6542: True,  # coloured egg (red)
    6543: True,  # coloured egg (blue)
    6544: True,  # coloured egg (green)
    6545: True,  # coloured egg (purple)
    6569: True,  # candy
    6574: True,  # bar of chocolate
    7158: True,  # rainbow trout
    7159: True,  # green perch
    7372: True,  # ice cream cone (crispy chocolate chips)
    7373: True,  # ice cream cone (velvet vanilla)
    7374: True,  # ice cream cone (sweet strawberry)
    7375: True,  # ice cream cone (chilly cherry)
    7376: True,  # ice cream cone (mellow melon)
    7377: True,  # ice cream cone (blue-barian)
    7909: True,  # walnut
    7910: True,  # peanut
    7963: True,  # marlin
    8112: True,  # scarab cheese
    8838: True,  # potato
    8839: True,  # plum
    8840: True,  # raspberry
    8841: True,  # lemon
    8842: True,  # cucumber
    8843: True,  # onion
    8844: True,  # jalapeño pepper
    8845: True,  # beetroot
    8847: True,  # chocolate cake
    9005: True,  # yummy gummy worm
    9114: True,  # bulb of garlic
    9996: True,  # banana chocolate shake
    10454: True,  # headache pill
    11246: True,  # rice ball
    11370: True,  # terramite eggs
    11429: True,  # crocodile steak
    12415: True,  # pineapple
    12416: True,  # aubergine
    12417: True,  # broccoli
    12418: True,  # cauliflower
    12637: True,  # ectoplasmic sushi
    12638: True,  # dragonfruit
    12639: True,  # peas
    13297: True,  # haunch of boar
    15405: True,  # sandfish
    15487: True,  # larvae
    15488: True,  # deepling filet
    16014: True,  # anniversary cake
    18397: True,  # mushroom pie
    19737: True,  # insectoid eggs
    20100: True,  # soft cheese
    20101: True,  # rat cheese
    23514: True,  # glooth sandwich
    23515: True,  # bowl of glooth soup
    23516: True,  # bottle of glooth wine
    23517: True,  # glooth steak
    24841: True,  # prickly pear
    24843: True,  # roasted meat
    26191: True,  # energy bar
    26201: True  # energy drink
}


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
                
                # Look for update version in the caption text
                caption_text = caption.get_text()
                update_link = caption.find('a', href=lambda href: href and 'Updates' in href)
                
                if update_link:
                    version_text = update_link.text
                    if 'Update' in version_text:
                        version_text = version_text.replace('Update', '').strip()
                    
                    # Extract version number
                    match = re.search(r'(\d+\.\d+)', version_text)
                    if match:
                        version = match.group(1)
                        version_tables.append((version, table))
                        logging.info(f"Found loot table for version {version}")
                else:
                    # Try to extract version from caption text if no direct link
                    match = re.search(r'Update (\d+\.\d+)', caption_text)
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

    def _parse_amount_str(self, text: str) -> Tuple[int, int]:
        text = text.strip()
        if not text or text in ('-', '?'):
            return (1, 1)
        # e.g. "1-17"
        match = re.search(r'(\d+)-(\d+)', text)
        if match:
            return (int(match.group(1)), int(match.group(2)))
        # or a single digit
        match = re.search(r'(\d+)', text)
        if match:
            val = int(match.group(1))
            return (val, val)
        return (1, 1)

    def extract_loot_items(self, table: BeautifulSoup) -> List[Dict[str, Any]]:
        """
        Extract loot items from a loot table, using the 'Times' column
        and total kills from the table's caption whenever possible.
        """
        items = []

        try:
            # 1) Check table headers
            headers = [th.get_text().strip().lower() for th in table.find_all('th')]
            is_reward_chest = False

            # If we see 'sprite' AND 'amount' in the header, assume reward chest
            if any('sprite' in h for h in headers) and any('amount' in h for h in headers):
                is_reward_chest = True

            # 2) Attempt to find total kills from the table caption
            #    e.g. "Rotworm, 121,689 kills" or "Statistics made after Update... Rotworm, 121689 kills"
            total_kills = 0
            caption = table.find('caption')
            if caption:
                # Common patterns: "121,689 kills" or "121689 kills"
                match_kills = re.search(r'([\d,\.]+)\s*kills', caption.get_text().lower())
                if match_kills:
                    # remove commas
                    kills_str = match_kills.group(1).replace(',', '').replace('.', '')
                    try:
                        total_kills = int(kills_str)
                    except ValueError:
                        total_kills = 0

            # 3) Figure out which columns correspond to "Times", "Item", "Amount" in normal monster tables
            #    If you know the typical order (Sprite | Amount | Item | Times | Total amount | Percentage...), you can index them.
            #    Let's do an example fallback:
            times_index = None
            amount_index = None
            item_index = None

            # We'll guess:
            #   0 => Sprite
            #   1 => Amount
            #   2 => Item
            #   3 => Times
            #   4 => Total amount or Percentage
            #   etc.

            # Or if we see the word "times" in a <th>, we'll store that index.
            for i, htext in enumerate(headers):
                if 'times' in htext:
                    times_index = i
                elif 'item' in htext:
                    item_index = i
                elif 'amount' in htext:
                    amount_index = i

            # If we didn't find a 'times' header, times_index might remain None and we'll fallback.

            rows = table.find_all('tr')
            for row in rows:
                cells = row.find_all('td')
                if len(cells) < 3:  # skip header or short row
                    continue

                # Some tables have "loot_list_header" row classes
                if 'loot_list_header' in row.get('class', []):
                    continue

                # 4) Different logic for reward-chest vs standard monster
                if is_reward_chest:
                    # Already existing reward-chest logic in your code, e.g.:
                    # Sprite | Amount | Item | Times | Total amount
                    # => parse item_name, times, total_kills from caption, etc.
                    item_cell = cells[2] if len(cells) > 2 else None
                    times_cell = cells[3] if len(cells) > 3 else None
                    amount_cell = cells[1] if len(cells) > 1 else None

                    if not item_cell or not times_cell:
                        continue

                    # item name
                    item_name = item_cell.get_text().strip()
                    if item_name.lower() == 'empty':
                        continue

                    # times
                    try:
                        times = int(times_cell.get_text().strip())
                    except ValueError:
                        times = 0

                    # compute percentage
                    percent = 0.0
                    if total_kills > 0:
                        percent = (times / total_kills) * 100

                    # parse min/max amount similarly
                    min_count, max_count = self._parse_amount_str(amount_cell.get_text())

                else:
                    # Normal monster loot
                    # We try to read the "Times" column (times_index)
                    # or fallback to the old 'percentage' if needed
                    if item_index is not None and item_index < len(cells):
                        item_cell = cells[item_index]
                    else:
                        item_cell = cells[0]

                    item_name = item_cell.get_text().strip()
                    if item_name.lower() in ('empty', '!empty'):
                        continue

                    # parse times if we found times_index
                    times = 0
                    if times_index is not None and times_index < len(cells):
                        try:
                            times_str = cells[times_index].get_text().strip()
                            times = int(times_str.replace(',', ''))  # remove commas
                        except ValueError:
                            times = 0

                    # compute percentage from times / total_kills
                    percent = 0.0
                    if total_kills > 0 and times > 0:
                        percent = (times / total_kills) * 100
                    else:
                        # fallback if times=0 or total_kills=0 => maybe parse the old 'Percentage' cell
                        # or skip
                        pass

                    # parse min/max counts
                    amt_txt = ''
                    if amount_index is not None and amount_index < len(cells):
                        amt_txt = cells[amount_index].get_text().strip()

                    min_count, max_count = self._parse_amount_str(amt_txt)

                # 5) convert to an integer chance for TFS
                # If your TFS has MAX_LOOTCHANCE=100000, do *1000
                scaled_chance = int(round(percent * 1000))
                if scaled_chance > 100000:
                    scaled_chance = 100000

                # 6) Build item entry
                item_entry = {
                    'name': item_name,
                    'percentage': percent,
                    'chance': scaled_chance,
                    'min_count': min_count,
                    'max_count': max_count
                }
                items.append(item_entry)

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
        """
        loot_lines = []

        for item in loot_items:
            item_name = item['name'].lower()
            chance = item['chance']

            # Skip soul core / soul prism items
            if 'soul core' in item_name:
                continue
            if 'soul prism' in item_name:
                continue

            # Check if the item exists in items.xml
            if not self.item_mapper.item_exists(item_name):
                # Item doesn't exist, comment it out
                line = (
                    f"\t-- {{ id = \"{item_name}\", chance = {chance} }},"
                    f"  -- todo(loot): {item_name} does not exist in items.xml"
                )
                loot_lines.append(line)
                continue

            # Get the IDs for the item name
            item_ids = self.item_mapper.get_ids_for_name(item_name)

            # Prepare the loot line string
            entry = f"\t{{ id = \"{item_name}\", chance = {chance}"
            if item['min_count'] > 1 or item['max_count'] > 1:
                if item['min_count'] == item['max_count']:
                    entry += f", maxCount = {item['max_count']}"
                else:
                    entry += f", minCount = {item['min_count']}, maxCount = {item['max_count']}"
            entry += " }"

            # If there's **more than one** matching ID, see if it is a known food
            if len(item_ids) > 1:
                # Filter only those IDs which exist in FOODS_DICT
                possible_food_ids = [iid for iid in item_ids if iid.isdigit() and int(iid) in FOODS_DICT]

                if len(possible_food_ids) == 1:
                    # Exactly one valid food ID → no multiple-IDs comment
                    chosen_id = possible_food_ids[0]
                    entry += f",  -- {chosen_id}"
                else:
                    # Fallback: multiple IDs remain ambiguous
                    entry += f",  -- todo(loot): {', '.join(item_ids)}"
            else:
                # If exactly one ID or none
                if len(item_ids) == 1:
                    entry += f",  -- {item_ids[0]}"
                else:
                    # No IDs found, though item_exists() was True? Rare edge case
                    entry += ",  -- todo(loot): no ID found"

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
    
    def add_loot_parsing_error(self, file_path: Path) -> bool:
        """
        Add a comment at the top of the file indicating that the loot table parsing failed.
        
        Args:
            file_path (Path): Path to the monster Lua file
            
        Returns:
            bool: True if successful, False otherwise
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
            
            # Check if the error comment already exists
            if 'todo(loot): Loot table parsing error - original loot table preserved' in content:
                logging.info(f"Loot parsing error comment already exists in {file_path}")
                return True
            
            # Find the position after the loot table line
            match = re.search(r'-- Loot table: [^\n]*\n', content)
            if match:
                insert_pos = match.end()
                new_content = content[:insert_pos] + '-- todo(loot): Loot table parsing error - original loot table preserved\n' + content[insert_pos:]
                
                # Write the updated content back to the file
                with open(file_path, 'w', encoding='utf-8') as file:
                    file.write(new_content)
                
                logging.info(f"Added loot parsing error comment to {file_path}")
                return True
            else:
                logging.warning(f"Could not find loot table line in {file_path}")
                return False
        
        except Exception as e:
            logging.error(f"Error adding loot parsing error comment to {file_path}: {e}")
            return False

    def set_empty_loot(self, file_path: Path) -> bool:
        """
        Set the monster.loot section to an empty table.
        
        Args:
            file_path (Path): Path to the monster Lua file
            
        Returns:
            bool: True if successful, False otherwise
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
            
            # Replace the monster.loot section with an empty table
            new_content = re.sub(r'monster\.loot = \{[^}]*\}', 'monster.loot = {}', content, flags=re.DOTALL)
            
            # Write the updated content back to the file
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(new_content)
            
            logging.info(f"Set empty loot for {file_path}")
            return True
        
        except Exception as e:
            logging.error(f"Error setting empty loot for {file_path}: {e}")
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
            
            # Skip empty/!empty entries
            loot_items = [item for item in loot_items 
                        if item['name'].lower() != 'empty' and item['name'].lower() != '!empty']
            
            # Check for invalid loot data - items where numbers or hyphens are being extracted as item names
            invalid_items = [item for item in loot_items if item['name'].strip('-').isdigit() or 
                            re.match(r'^\d+-\d+$', item['name']) or
                            item['name'] == '-']
            
            # If most items are invalid, this suggests a parsing problem
            if len(invalid_items) > len(loot_items) * 0.5:  # More than 50% invalid items
                error_msg = f"Loot table parsing error for {monster_name} - most items appear to be invalid: {[item['name'] for item in invalid_items[:5]]}..."
                self.errors.append(error_msg)
                
                # Keep the original loot table instead of overwriting with bad data
                logging.error(error_msg)
                
                # Add a comment to the file indicating the loot parsing problem
                self.add_loot_parsing_error(file_path)
                
                self.state_tracker.mark_file_processed(file_path, False, error_msg)
                return False
            
            # If no valid items after filtering, set empty loot
            if not loot_items:
                if self.set_empty_loot(file_path):
                    logging.info(f"Set empty loot for {monster_name} (no valid items)")
                    self.state_tracker.mark_file_processed(file_path, True)
                    return True
            
            # Build the loot object
            loot_lines = self.build_loot_object(loot_items)
            
            # Replace the monster.loot section with a completely new one
            loot_pattern = r'monster\.loot = \{[^}]*\}'
            loot_section = 'monster.loot = {\n' + '\n'.join(loot_lines) + '\n}'
            
            # Try to find and replace the loot section
            if re.search(loot_pattern, content, re.DOTALL):
                # Use a safer approach to ensure we get the entire loot section
                # Find the start of the loot section
                start_match = re.search(r'monster\.loot = \{', content)
                if not start_match:
                    error_msg = f"Could not find monster.loot section start in {file_path}"
                    self.errors.append(error_msg)
                    self.state_tracker.mark_file_processed(file_path, False, error_msg)
                    return False
                
                start_pos = start_match.start()
                
                # Find the end of the loot section (the matching closing brace)
                brace_count = 1  # We start after the opening brace
                end_pos = start_match.end()
                
                while brace_count > 0 and end_pos < len(content):
                    if content[end_pos] == '{':
                        brace_count += 1
                    elif content[end_pos] == '}':
                        brace_count -= 1
                    end_pos += 1
                
                if brace_count > 0:
                    # Couldn't find matching brace, potential syntax error
                    # Set an empty loot table instead
                    new_content = content[:start_pos] + 'monster.loot = {}' + content[end_pos:]
                    error_msg = f"Syntax error in loot table for {monster_name}, replaced with empty loot"
                    self.errors.append(error_msg)
                else:
                    # Replace the entire section
                    new_content = content[:start_pos] + loot_section + content[end_pos:]
                
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
