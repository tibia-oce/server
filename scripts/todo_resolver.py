#!/usr/bin/env python3
"""
Script to find and list all todo(loot) instances in monster files.
PS D:\CompSci\Projects\tibia-oce\server> python .\scripts\todo_resolver.py find --monster-dir "data/monster/lua"
"""

import os
import re
import logging
from pathlib import Path
from typing import Dict, List, Tuple
import argparse

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('todo_resolver.log'),
        logging.StreamHandler()
    ]
)

class TodoFinder:
    """Class to find todo(loot) instances in monster files."""
    
    def __init__(self, monster_dir: str):
        """
        Initialize the todo finder.
        
        Args:
            monster_dir (str): Directory containing monster Lua files
        """
        self.monster_dir = Path(monster_dir)
        self.todo_items = []
    
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
            # Check if it's a monster file
            try:
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read()
                    if 'createMonsterType' in content and 'monster.loot' in content:
                        monster_files.append(file_path)
            except Exception as e:
                logging.error(f"Error reading file {file_path}: {e}")
        
        logging.info(f"Found {len(monster_files)} monster files")
        return monster_files
    
    def extract_monster_name(self, file_path: Path) -> str:
        """
        Extract the monster name from a Lua file.
        
        Args:
            file_path (Path): Path to the monster Lua file
            
        Returns:
            str: The monster name or "Unknown monster" if not found
        """
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
                
                # Regular expression to extract the monster name
                match = re.search(r'createMonsterType\(["\']([^"\']+)["\']', content)
                if match:
                    return match.group(1)
                else:
                    return "Unknown monster"
        except Exception as e:
            logging.error(f"Error extracting monster name from {file_path}: {e}")
            return "Unknown monster"
    
    def find_todo_items(self):
        """
        Find all todo(loot) instances in monster files.
        
        Returns:
            List[Dict]: List of dictionaries with todo item information
        """
        monster_files = self.find_monster_files()
        
        for file_path in monster_files:
            try:
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read()
                
                # Find the monster name
                monster_name = self.extract_monster_name(file_path)
                
                # Find all todo(loot) instances
                todo_pattern = r'{\s*id\s*=\s*["\'](.*?)["\']\s*,\s*chance\s*=\s*(\d+).*?\}\s*,?\s*--\s*todo\(loot\):\s*(.*?)(?:\n|$)'
                matches = re.finditer(todo_pattern, content, re.DOTALL)
                
                for match in matches:
                    item_name = match.group(1)
                    chance = match.group(2)
                    id_options = match.group(3).strip()
                    line_text = match.group(0).strip()
                    
                    # Extract additional parameters like maxCount, minCount
                    params = {}
                    max_count_match = re.search(r'maxCount\s*=\s*(\d+)', line_text)
                    if max_count_match:
                        params['maxCount'] = max_count_match.group(1)
                    
                    min_count_match = re.search(r'minCount\s*=\s*(\d+)', line_text)
                    if min_count_match:
                        params['minCount'] = min_count_match.group(1)
                    
                    # Store the todo item information
                    self.todo_items.append({
                        'file_path': str(file_path),
                        'monster_name': monster_name,
                        'item_name': item_name,
                        'chance': chance,
                        'id_options': id_options,
                        'line_text': line_text,
                        'params': params
                    })
                    
            except Exception as e:
                logging.error(f"Error processing file {file_path}: {e}")
        
        logging.info(f"Found {len(self.todo_items)} todo(loot) instances")
        return self.todo_items
    
    def save_todo_list(self, output_file='todo_list.txt'):
        """
        Save the list of todo items to a file.
        
        Args:
            output_file (str): Path to the output file
        """
        if not self.todo_items:
            self.find_todo_items()
        
        with open(output_file, 'w', encoding='utf-8') as f:
            f.write("# Todo(loot) instances found in monster files\n")
            f.write("# Format: index|file_path|monster_name|item_name|chance|id_options|params\n\n")
            
            for i, item in enumerate(self.todo_items):
                params_str = ','.join([f"{k}={v}" for k, v in item.get('params', {}).items()])
                f.write(f"{i+1}|{item['file_path']}|{item['monster_name']}|{item['item_name']}|{item['chance']}|{item['id_options']}|{params_str}\n")
        
        logging.info(f"Saved {len(self.todo_items)} todo items to {output_file}")


class TodoResolver:
    """Class to resolve todo(loot) instances in monster files."""
    
    def __init__(self, todo_list_file='todo_list.txt'):
        """
        Initialize the todo resolver.
        
        Args:
            todo_list_file (str): Path to the todo list file
        """
        self.todo_list_file = todo_list_file
        self.todo_items = []
        self.load_todo_list()
    
    def load_todo_list(self):
        """Load the todo list from the file."""
        if not os.path.exists(self.todo_list_file):
            logging.error(f"Todo list file {self.todo_list_file} does not exist!")
            return
        
        try:
            with open(self.todo_list_file, 'r', encoding='utf-8') as f:
                lines = f.readlines()
            
            # Skip header lines
            data_lines = [line for line in lines if not line.startswith('#') and line.strip()]
            
            for line in data_lines:
                parts = line.strip().split('|')
                if len(parts) >= 6:
                    index = parts[0]
                    file_path = parts[1]
                    monster_name = parts[2]
                    item_name = parts[3]
                    chance = parts[4]
                    id_options = parts[5]
                    
                    # Parse params if available
                    params = {}
                    if len(parts) >= 7 and parts[6]:
                        param_parts = parts[6].split(',')
                        for param in param_parts:
                            if '=' in param:
                                key, value = param.split('=')
                                params[key] = value
                    
                    self.todo_items.append({
                        'index': int(index),
                        'file_path': file_path,
                        'monster_name': monster_name,
                        'item_name': item_name,
                        'chance': chance,
                        'id_options': id_options,
                        'params': params
                    })
            
            logging.info(f"Loaded {len(self.todo_items)} todo items from {self.todo_list_file}")
        
        except Exception as e:
            logging.error(f"Error loading todo list: {e}")
    
    def resolve_todo_item_by_index(self, index, chosen_id):
        """
        Resolve a todo item by its index.
        
        Args:
            index (int): The index of the todo item to resolve
            chosen_id (str): The ID to use for the item
            
        Returns:
            bool: True if successful, False otherwise
        """
        # Adjust index (1-based in file, 0-based in list)
        item_index = index - 1
        
        if item_index < 0 or item_index >= len(self.todo_items):
            logging.error(f"Invalid todo item index: {index}")
            return False
        
        item = self.todo_items[item_index]
        
        # Resolve the item
        if self._resolve_item(item, chosen_id):
            # Remove the resolved item from the list
            self.todo_items.pop(item_index)
            
            # Update the todo list file
            self.update_todo_list()
            return True
        
        return False
    
    def resolve_todo_item_by_name(self, item_name, chosen_id, monster_name=None):
        """
        Resolve all todo items with the given item name.
        
        Args:
            item_name (str): The name of the item to resolve
            chosen_id (str): The ID to use for the item
            monster_name (str): Optional monster name to restrict the search
            
        Returns:
            int: Number of items resolved
        """
        resolved_count = 0
        items_to_remove = []
        
        for i, item in enumerate(self.todo_items):
            if item['item_name'] == item_name and (monster_name is None or item['monster_name'] == monster_name):
                if self._resolve_item(item, chosen_id):
                    items_to_remove.append(i)
                    resolved_count += 1
        
        # Remove resolved items (in reverse order to maintain indices)
        for i in sorted(items_to_remove, reverse=True):
            self.todo_items.pop(i)
        
        # Update the todo list file if any items were resolved
        if resolved_count > 0:
            self.update_todo_list()
        
        return resolved_count
    
    def _resolve_item(self, item, chosen_id):
        """
        Internal method to resolve a todo item.
        
        Args:
            item (dict): The todo item to resolve
            chosen_id (str): The ID to use for the item
            
        Returns:
            bool: True if successful, False otherwise
        """
        file_path = item['file_path']
        item_name = item['item_name']
        
        try:
            with open(file_path, 'r', encoding='utf-8') as file:
                content = file.read()
            
            # Pattern to match the entire line with the todo item
            pattern = r'{\s*id\s*=\s*["\']' + re.escape(item_name) + r'["\']\s*,\s*chance\s*=\s*' + re.escape(item['chance']) + r'.*?\}\s*,?\s*--\s*todo\(loot\):\s*' + re.escape(item['id_options']) + r'(?:\n|$)'
            
            # Replacement string with the chosen ID
            replacement = f"{{ id = {chosen_id}, chance = {item['chance']}"
            
            # Add additional parameters
            for param, value in item.get('params', {}).items():
                replacement += f", {param} = {value}"
            
            replacement += f" }},  -- \"{item_name}\""
            
            # Replace the todo item with the resolved item
            new_content = re.sub(pattern, replacement, content, flags=re.DOTALL)
            
            # Write the updated content back to the file
            with open(file_path, 'w', encoding='utf-8') as file:
                file.write(new_content)
            
            logging.info(f"Resolved todo item: {item_name} -> {chosen_id} in {file_path}")
            return True
            
        except Exception as e:
            logging.error(f"Error resolving todo item {item_name}: {e}")
            return False
    
    def update_todo_list(self):
        """Update the todo list file after resolving an item."""
        try:
            with open(self.todo_list_file, 'w', encoding='utf-8') as f:
                f.write("# Todo(loot) instances found in monster files\n")
                f.write("# Format: index|file_path|monster_name|item_name|chance|id_options|params\n\n")
                
                for i, item in enumerate(self.todo_items):
                    params_str = ','.join([f"{k}={v}" for k, v in item.get('params', {}).items()])
                    f.write(f"{i+1}|{item['file_path']}|{item['monster_name']}|{item['item_name']}|{item['chance']}|{item['id_options']}|{params_str}\n")
            
            logging.info(f"Updated todo list with {len(self.todo_items)} remaining items")
        
        except Exception as e:
            logging.error(f"Error updating todo list: {e}")


def main():
    """Main function to orchestrate the todo finder and resolver."""
    parser = argparse.ArgumentParser(description='Find and resolve todo(loot) instances in monster files')
    subparsers = parser.add_subparsers(dest='command', help='Commands')
    
    # Find command
    find_parser = subparsers.add_parser('find', help='Find todo(loot) instances')
    find_parser.add_argument('--monster-dir', dest='monster_dir', required=True,
                           help='Directory containing monster Lua files')
    find_parser.add_argument('--output', dest='output_file', default='todo_list.txt',
                           help='Path to the output file (default: todo_list.txt)')
    
    # Show command
    show_parser = subparsers.add_parser('show', help='Show todo(loot) instances')
    show_parser.add_argument('--list', dest='list_file', default='todo_list.txt',
                           help='Path to the todo list file (default: todo_list.txt)')
    show_parser.add_argument('--name', dest='item_name',
                           help='Filter by item name')
    show_parser.add_argument('--monster', dest='monster_name',
                           help='Filter by monster name')
    
    # Resolve command
    resolve_parser = subparsers.add_parser('resolve', help='Resolve a todo(loot) instance')
    resolve_group = resolve_parser.add_mutually_exclusive_group(required=True)
    resolve_group.add_argument('--index', dest='index', type=int,
                              help='Index of the todo item to resolve')
    resolve_group.add_argument('--name', dest='item_name',
                              help='Name of the item to resolve (resolves all matching items)')
    resolve_parser.add_argument('--monster', dest='monster_name',
                              help='Monster name to restrict resolution (only with --name)')
    resolve_parser.add_argument('--id', dest='chosen_id', required=True,
                              help='ID to use for the item')
    resolve_parser.add_argument('--list', dest='list_file', default='todo_list.txt',
                              help='Path to the todo list file (default: todo_list.txt)')
    
    args = parser.parse_args()
    
    if args.command == 'find':
        # Find todo(loot) instances
        finder = TodoFinder(args.monster_dir)
        finder.find_todo_items()
        finder.save_todo_list(args.output_file)
        
    elif args.command == 'show':
        # Show todo(loot) instances
        try:
            with open(args.list_file, 'r', encoding='utf-8') as f:
                lines = f.readlines()
            
            # Print header lines
            for line in lines:
                if line.startswith('#'):
                    print(line.strip())
            
            # Print filtered data lines
            data_lines = [line for line in lines if not line.startswith('#') and line.strip()]
            
            for line in data_lines:
                parts = line.strip().split('|')
                if len(parts) >= 6:
                    index = parts[0]
                    file_path = parts[1]
                    monster_name = parts[2]
                    item_name = parts[3]
                    chance = parts[4]
                    id_options = parts[5]
                    
                    # Apply filters
                    if args.item_name and args.item_name != item_name:
                        continue
                    
                    if args.monster_name and args.monster_name != monster_name:
                        continue
                    
                    print(f"{index}|{file_path}|{monster_name}|{item_name}|{chance}|{id_options}")
                    
        except Exception as e:
            logging.error(f"Error reading todo list file: {e}")
            
    elif args.command == 'resolve':
        # Resolve a todo(loot) instance
        resolver = TodoResolver(args.list_file)
        
        if args.index:
            # Resolve by index
            resolver.resolve_todo_item_by_index(args.index, args.chosen_id)
        elif args.item_name:
            # Resolve by name
            count = resolver.resolve_todo_item_by_name(args.item_name, args.chosen_id, args.monster_name)
            print(f"Resolved {count} todo items with name '{args.item_name}'")
        
    else:
        parser.print_help()


if __name__ == "__main__":
    main()