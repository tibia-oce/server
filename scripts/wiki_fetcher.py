#!/usr/bin/env python3
"""
Script to fetch and parse monster information from the Tibia Wiki.
"""

import requests
import logging
import re
from bs4 import BeautifulSoup
import time
import urllib.parse

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('wiki_fetcher.log'),
        logging.StreamHandler()
    ]
)

class TibiaWikiFetcher:
    """Class to handle fetching and parsing data from the Tibia Wiki."""
    
    BASE_URL = "https://tibia.fandom.com/wiki/"
    
    def __init__(self, delay=1):
        """
        Initialize the fetcher with a delay between requests to be respectful to the server.
        
        Args:
            delay (int): Delay in seconds between requests
        """
        self.delay = delay
        self.session = requests.Session()
        self.session.headers.update({
            'User-Agent': 'TibiaMonsterDocumenter/1.0 (Respectful Script)'
        })
    
    def fetch_monster_page(self, monster_name):
        """
        Fetch the monster page from the Tibia Wiki.
        
        Args:
            monster_name (str): The name of the monster
            
        Returns:
            str: HTML content of the page or None if not found
        """
        url = self.BASE_URL + urllib.parse.quote(monster_name.replace(' ', '_'))
        logging.info(f"Fetching monster page: {url}")
        
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
    
    def fetch_loot_statistics_page(self, monster_name):
        """
        Fetch the loot statistics page for the monster.
        
        Args:
            monster_name (str): The name of the monster
            
        Returns:
            str: URL of the loot statistics page or None if not found
        """
        loot_url = self.BASE_URL + "Loot_Statistics:" + urllib.parse.quote(monster_name.replace(' ', '_'))
        logging.info(f"Checking loot statistics page: {loot_url}")
        
        try:
            response = self.session.head(loot_url)
            time.sleep(self.delay)  # Be respectful to the server
            
            if response.status_code == 200:
                return loot_url
            else:
                logging.warning(f"Loot statistics page not found for {monster_name}")
                return None
        except Exception as e:
            logging.error(f"Error checking loot statistics: {e}")
            return None
    
    def extract_version(self, html_content):
        """
        Extract the version information from the monster page.
        
        Args:
            html_content (str): HTML content of the monster page
            
        Returns:
            str: Version number or None if not found
        """
        if not html_content:
            return None
        
        try:
            soup = BeautifulSoup(html_content, 'html.parser')
            
            # Look for the version information in the infobox
            version_div = soup.find('div', {'data-source': 'implemented'})
            if version_div:
                version_link = version_div.find('a')
                if version_link:
                    # Extract version from the link text or title
                    version_text = version_link.text.strip()
                    # If the version is in the format "Updates/X.Y", extract just X.Y
                    if '/' in version_text:
                        version_text = version_text.split('/')[-1]
                    return version_text
                
                # If no link, try to find the version in the div text
                version_value = version_div.find('div', {'class': 'pi-data-value'})
                if version_value:
                    version_text = version_value.text.strip()
                    # Try to extract version using regex
                    match = re.search(r'(\d+\.\d+)', version_text)
                    if match:
                        return match.group(1)
            
            # Alternative method: look for version in headers
            headers = soup.find_all(['h2', 'h3'])
            for header in headers:
                if 'version' in header.text.lower() or 'implemented' in header.text.lower():
                    next_element = header.find_next()
                    if next_element:
                        match = re.search(r'(\d+\.\d+)', next_element.text)
                        if match:
                            return match.group(1)
            
            logging.warning("Could not extract version information")
            return None
        except Exception as e:
            logging.error(f"Error extracting version: {e}")
            return None
    
    def get_monster_info(self, monster_name):
        """
        Get all the relevant information for a monster.
        
        Args:
            monster_name (str): The name of the monster
            
        Returns:
            dict: Dictionary with monster information
        """
        monster_info = {
            "name": monster_name,
            "wiki_url": None,
            "loot_url": None,
            "version": None,
            "success": False
        }
        
        # Fetch the monster page
        html_content = self.fetch_monster_page(monster_name)
        if html_content:
            monster_info["wiki_url"] = self.BASE_URL + urllib.parse.quote(monster_name.replace(' ', '_'))
            monster_info["version"] = self.extract_version(html_content)
            
            # Check if loot statistics page exists
            monster_info["loot_url"] = self.fetch_loot_statistics_page(monster_name)
            
            monster_info["success"] = True
        
        return monster_info

if __name__ == "__main__":
    # Example usage
    fetcher = TibiaWikiFetcher(delay=2)  # Be extra respectful with a 2-second delay
    monster_info = fetcher.get_monster_info("Blood Crab")
    print(monster_info)