#!/usr/bin/env lua
-- Improved script to identify and remove unused monster spells
-- 1. Scans all monster files to collect all unique spell names used in monster.attacks
-- 2. Scans all spell files to get their spell names
-- 3. Removes spell files that aren't used by any monsters
-- Save this as remove_unused_spells_improved.lua

-- Function to read entire file contents
local function readFile(file)
    local f = io.open(file, "rb")
    if not f then
        print("Error: Could not open file " .. file)
        return nil
    end
    local content = f:read("*all")
    f:close()
    return content
end

-- Function to extract spell name from a spell file
local function extractSpellName(content)
    -- Try to find spell name in various formats
    local spellName = content:match('spell:name%("([^"]+)"%)') or
                     content:match("spell:name%('([^']+)'%)") or
                     content:match('spell:name%(([^%)]+)%)') or
                     content:match('local%s+spellName%s*=%s*"([^"]+)"')
    
    return spellName
end

-- Function to get all unique spell names from monster attack entries
local function collectMonsterSpells(monsterDirectory)
    local spells = {}
    local spellMonsters = {} -- Track which monsters use each spell
    local cmd = "find " .. monsterDirectory .. " -type f -name '*.lua'"
    local handle = io.popen(cmd)
    if not handle then
        print("Error: Failed to execute find command")
        return {}, {}
    end
    
    local result = handle:read("*a")
    handle:close()
    
    -- Process each monster file
    for filename in result:gmatch("[^\r\n]+") do
        local content = readFile(filename)
        if not content then
            print("Warning: Could not read " .. filename)
            goto continue
        end
        
        -- Extract monster name
        local monsterName = content:match('createMonsterType%("([^"]+)"%)') or
                           content:match("createMonsterType%('([^']+)'%)") or
                           "Unknown Monster"
        
        -- Find monster.attacks section
        -- This more comprehensive approach finds the entire monster.attacks section
        -- from the opening { to the matching closing }
        local attacksStart = content:find("monster%.attacks%s*=%s*{")
        if attacksStart then
            local braceLevel = 1
            local i = attacksStart
            while braceLevel > 0 and i < #content do
                i = i + 1
                local char = content:sub(i, i)
                if char == "{" then
                    braceLevel = braceLevel + 1
                elseif char == "}" then
                    braceLevel = braceLevel - 1
                    if braceLevel == 0 then
                        break
                    end
                end
            end
            
            local attacksSection = content:sub(attacksStart, i)
            
            -- Extract all spell names from the attacks section
            for attackName in attacksSection:gmatch('name%s*=%s*"([^"]+)"') do
                if attackName ~= "melee" and attackName ~= "combat" then
                    spells[attackName] = true
                    if not spellMonsters[attackName] then
                        spellMonsters[attackName] = {}
                    end
                    table.insert(spellMonsters[attackName], monsterName)
                end
            end
            
            -- Also check for single-quoted names
            for attackName in attacksSection:gmatch("name%s*=%s*'([^']+)'") do
                if attackName ~= "melee" and attackName ~= "combat" then
                    spells[attackName] = true
                    if not spellMonsters[attackName] then
                        spellMonsters[attackName] = {}
                    end
                    table.insert(spellMonsters[attackName], monsterName)
                end
            end
        end
        
        ::continue::
    end
    
    return spells, spellMonsters
end

-- Function to get all spell files and their names
local function collectSpellFiles(spellDirectory)
    local spellFiles = {}
    local cmd = "find " .. spellDirectory .. " -type f -name '*.lua'"
    local handle = io.popen(cmd)
    if not handle then
        print("Error: Failed to execute find command")
        return {}
    end
    
    local result = handle:read("*a")
    handle:close()
    
    -- Process each spell file
    for filename in result:gmatch("[^\r\n]+") do
        local content = readFile(filename)
        if not content then
            print("Warning: Could not read " .. filename)
            goto continue
        end
        
        local spellName = extractSpellName(content)
        
        if spellName then
            -- Remove any quotes that might be in the name
            spellName = spellName:gsub('"', ''):gsub("'", "")
            spellFiles[spellName] = filename
        else
            -- If we can't extract a name, use the filename as a fallback identifier
            local nameFromFile = filename:match("/([^/]+)%.lua$"):gsub("_", " ")
            print("Warning: Could not extract spell name from " .. filename .. ", using filename '" .. nameFromFile .. "' as identifier")
            spellFiles[nameFromFile] = filename
        end
        
        ::continue::
    end
    
    return spellFiles
end

-- Function to remove a file
local function removeFile(file)
    local result = os.remove(file)
    return result
end

-- Function to write a list to a file
local function writeListToFile(filename, list)
    local f = io.open(filename, "w")
    if not f then
        print("Error: Could not create file " .. filename)
        return false
    end
    
    for _, item in ipairs(list) do
        f:write(item .. "\n")
    end
    
    f:close()
    return true
end

-- Main function
local function main(monsterDirectory, spellDirectory, dryRun)
    if not monsterDirectory or not spellDirectory then
        print("Usage: lua remove_unused_spells_improved.lua <monster_directory> <spell_directory> [--dry-run]")
        print("Example: lua remove_unused_spells_improved.lua \"data/monster/lua\" \"data/spells/scripts/monster\" --dry-run")
        return
    end
    
    -- Check if this is a dry run (no actual deletions)
    local isDryRun = dryRun == "--dry-run"
    if isDryRun then
        print("DRY RUN MODE: No files will be deleted")
    end
    
    -- Step 1: Collect all spell names used in monster attacks
    print("Scanning monster files for spell names...")
    local usedSpells, spellMonsters = collectMonsterSpells(monsterDirectory)
    
    local usedSpellsList = {}
    for name, _ in pairs(usedSpells) do
        table.insert(usedSpellsList, name)
    end
    table.sort(usedSpellsList)
    
    print("Found " .. #usedSpellsList .. " unique spell names used by monsters:")
    for _, name in ipairs(usedSpellsList) do
        print("  - " .. name .. " (Used by: " .. table.concat(spellMonsters[name], ", ") .. ")")
    end
    
    -- Write used spells to a file for reference
    writeListToFile("used_spells.txt", usedSpellsList)
    
    -- Step 2: Collect all spell files and their names
    print("\nScanning spell files...")
    local spellFiles = collectSpellFiles(spellDirectory)
    
    local spellFilesList = {}
    for name, filename in pairs(spellFiles) do
        table.insert(spellFilesList, name .. " (" .. filename .. ")")
    end
    table.sort(spellFilesList)
    
    print("Found " .. #spellFilesList .. " spell files")
    
    -- Write spell files to a file for reference
    writeListToFile("spell_files.txt", spellFilesList)
    
    -- Step 3: Identify and remove unused spell files
    print("\nChecking for unused spell files...")
    local unusedCount = 0
    local usedCount = 0
    local unusedSpellsList = {}
    local usedSpellFilesList = {}
    
    for spellName, filename in pairs(spellFiles) do
        if usedSpells[spellName] then
            print("USED: " .. spellName .. " (" .. filename .. ")")
            usedCount = usedCount + 1
            table.insert(usedSpellFilesList, spellName .. " (" .. filename .. ")")
        else
            unusedCount = unusedCount + 1
            table.insert(unusedSpellsList, spellName .. " (" .. filename .. ")")
            if isDryRun then
                print("WOULD REMOVE: " .. spellName .. " (" .. filename .. ")")
            else
                print("REMOVING: " .. spellName .. " (" .. filename .. ")")
                local success = removeFile(filename)
                if not success then
                    print("  WARNING: Failed to remove " .. filename)
                end
            end
        end
    end
    
    -- Write unused spells to a file for reference
    if #unusedSpellsList > 0 then
        writeListToFile("unused_spells.txt", unusedSpellsList)
    end
    
    -- Write used spell files to a file for reference
    if #usedSpellFilesList > 0 then
        writeListToFile("used_spell_files.txt", usedSpellFilesList)
    end
    
    print("\nSummary:")
    print("  - " .. usedCount .. " spell files are used by monsters")
    print("  - " .. unusedCount .. " spell files are unused" .. (isDryRun and " and would be removed" or " and were removed"))
    print("\nGenerated reference files:")
    print("  - used_spells.txt - List of spell names used in monster files")
    print("  - spell_files.txt - List of all spell files and their extracted names")
    if #unusedSpellsList > 0 then
        print("  - unused_spells.txt - List of spell files that were removed or would be removed")
    end
    if #usedSpellFilesList > 0 then
        print("  - used_spell_files.txt - List of spell files that are being used")
    end
end

-- Parse command line arguments and execute
local monsterDir = arg[1]
local spellDir = arg[2]
local dryRunFlag = arg[3]
main(monsterDir, spellDir, dryRunFlag)
