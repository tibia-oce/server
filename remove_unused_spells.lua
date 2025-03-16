#!/usr/bin/env lua
-- Script to identify and remove unused monster spells
-- 1. Scans all monster files to collect all unique spell names used in monster.attacks
-- 2. Scans all spell files to get their spell names
-- 3. Removes spell files that aren't used by any monsters
-- Save this as remove_unused_spells.lua

-- Function to read entire file contents
local function readFile(file)
    local f = assert(io.open(file, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

-- Function to extract spell name from a spell file
local function extractSpellName(content)
    -- Try to find spell name in various formats
    local spellName = content:match('spell:name%("([^"]+)"%)') or
                     content:match("spell:name%('([^']+)'%)") or
                     content:match('local%s+spellName%s*=%s*"([^"]+)"')
                     
    return spellName
end

-- Function to get all unique spell names from monster attack entries
local function collectMonsterSpells(monsterDirectory)
    local spells = {}
    local cmd = "find " .. monsterDirectory .. " -type f -name '*.lua'"
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    
    -- Process each monster file
    for filename in result:gmatch("[^\r\n]+") do
        local content = readFile(filename)
        
        -- Find monster.attacks section
        local attacksSection = content:match("monster%.attacks%s*=%s*{.-}")
        if attacksSection then
            -- Extract all spell names from the attacks section
            for attackName in attacksSection:gmatch('name%s*=%s*"([^"]+)"') do
                if attackName ~= "melee" and attackName ~= "combat" then
                    spells[attackName] = true
                end
            end
            
            -- Also check for single-quoted names
            for attackName in attacksSection:gmatch("name%s*=%s*'([^']+)'") do
                if attackName ~= "melee" and attackName ~= "combat" then
                    spells[attackName] = true
                end
            end
        end
    end
    
    return spells
end

-- Function to get all spell files and their names
local function collectSpellFiles(spellDirectory)
    local spellFiles = {}
    local cmd = "find " .. spellDirectory .. " -type f -name '*.lua'"
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    
    -- Process each spell file
    for filename in result:gmatch("[^\r\n]+") do
        local content = readFile(filename)
        local spellName = extractSpellName(content)
        
        if spellName then
            spellFiles[spellName] = filename
        else
            -- If we can't extract a name, use the filename as a fallback identifier
            local nameFromFile = filename:match("/([^/]+)%.lua$")
            print("Warning: Could not extract spell name from " .. filename .. ", using filename '" .. nameFromFile .. "' as identifier")
            spellFiles[nameFromFile] = filename
        end
    end
    
    return spellFiles
end

-- Function to remove a file
local function removeFile(file)
    os.remove(file)
end

-- Main function
local function main(monsterDirectory, spellDirectory, dryRun)
    if not monsterDirectory or not spellDirectory then
        print("Usage: lua remove_unused_spells.lua <monster_directory> <spell_directory> [--dry-run]")
        print("Example: lua remove_unused_spells.lua \"data/monster/lua\" \"data/spells/scripts/monster\" --dry-run")
        return
    end
    
    -- Check if this is a dry run (no actual deletions)
    local isDryRun = dryRun == "--dry-run"
    if isDryRun then
        print("DRY RUN MODE: No files will be deleted")
    end
    
    -- Step 1: Collect all spell names used in monster attacks
    print("Scanning monster files for spell names...")
    local usedSpells = collectMonsterSpells(monsterDirectory)
    
    local usedSpellsList = {}
    for name, _ in pairs(usedSpells) do
        table.insert(usedSpellsList, name)
    end
    table.sort(usedSpellsList)
    
    print("Found " .. #usedSpellsList .. " unique spell names used by monsters:")
    for _, name in ipairs(usedSpellsList) do
        print("  - " .. name)
    end
    
    -- Step 2: Collect all spell files and their names
    print("\nScanning spell files...")
    local spellFiles = collectSpellFiles(spellDirectory)
    
    local spellFilesList = {}
    for name, _ in pairs(spellFiles) do
        table.insert(spellFilesList, name)
    end
    table.sort(spellFilesList)
    
    print("Found " .. #spellFilesList .. " spell files")
    
    -- Step 3: Identify and remove unused spell files
    print("\nChecking for unused spell files...")
    local unusedCount = 0
    local usedCount = 0
    
    for spellName, filename in pairs(spellFiles) do
        if usedSpells[spellName] then
            print("USED: " .. spellName .. " (" .. filename .. ")")
            usedCount = usedCount + 1
        else
            unusedCount = unusedCount + 1
            if isDryRun then
                print("WOULD REMOVE: " .. spellName .. " (" .. filename .. ")")
            else
                print("REMOVING: " .. spellName .. " (" .. filename .. ")")
                removeFile(filename)
            end
        end
    end
    
    print("\nSummary:")
    print("  - " .. usedCount .. " spell files are used by monsters")
    print("  - " .. unusedCount .. " spell files are unused" .. (isDryRun and " and would be removed" or " and were removed"))
end

-- Parse command line arguments and execute
local monsterDir = arg[1]
local spellDir = arg[2]
local dryRunFlag = arg[3]
main(monsterDir, spellDir, dryRunFlag)