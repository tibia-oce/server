#!/usr/bin/env lua
-- Enhanced script to modify monster files and delete those introduced after 10.98:
-- 1. Skip processing if the file already has version comment (idempotent)
-- 2. Check Tibia Wiki for monster version information (when needed)
-- 3. Delete monster files for creatures introduced after version 10.98
-- 4. For remaining files:
--    a. Convert name to id in loot tables
--    b. Modify speed entries in both defenses and attacks
--    c. Remove raceId and Bestiary attributes
--    d. Remove isPreyExclusive from monster.flags
--    e. Remove monster.faction and monster.enemyFactions attributes
--    f. Add Tibia Wiki link and version information as a comment
-- 5. Log monsters that couldn't be processed or where version couldn't be determined
-- Save this as tibia-wiki-prune-idempotent.lua

-- Function to read entire file contents
local function readFile(file)
    local f = io.open(file, "rb")
    if not f then
        return nil, "Could not open file for reading"
    end
    local content = f:read("*all")
    f:close()
    return content
end

-- Function to write content to file
local function writeFile(file, content)
    local f = io.open(file, "wb")
    if not f then
        return false, "Could not open file for writing"
    end
    f:write(content)
    f:close()
    return true
end

-- Function to append to a log file
local function appendToLog(logFile, line)
    local f = io.open(logFile, "a")
    if not f then
        f = io.open(logFile, "w")
        if not f then
            print("Warning: Could not create log file " .. logFile)
            return false
        end
    end
    f:write(line .. "\n")
    f:close()
    return true
end

-- Function to delete a file
local function deleteFile(file)
    local result = os.remove(file)
    return result
end

-- Function to find position of closing brace for a section
local function findClosingBrace(content, startPos)
    local braceLevel = 1
    local i = startPos
    
    while i <= #content do
        local char = content:sub(i, i)
        if char == "{" then
            braceLevel = braceLevel + 1
        elseif char == "}" then
            braceLevel = braceLevel - 1
            if braceLevel == 0 then
                return i
            end
        end
        i = i + 1
    end
    
    return nil
end

-- Function to extract a numeric value
local function extractNumber(str, pattern)
    local match = str:match(pattern)
    if match then
        return tonumber(match)
    end
    return nil
end

-- Function to extract monster name from file content
local function extractMonsterName(content)
    local name = content:match('createMonsterType%("([^"]+)"%)') or
                 content:match('createMonsterType%(\'([^\']+)\'%)')
    return name
end

-- Function to check if the file has already been processed (has version comment)
local function hasVersionComment(content)
    local versionComment = content:match("^%s*%-%-%s*[^%\n]+%(Tibia Wiki:%s*[^%)]+%)%s*%\n%s*%-%-%s*Version:%s*[^%\n]+")
    return versionComment ~= nil
end

-- Function to extract existing version information
local function extractExistingVersion(content)
    local version = content:match("^%s*%-%-%s*[^%\n]+%(Tibia Wiki:%s*([^%)]+)%)%s*%\n%s*%-%-%s*Version:%s*([^%\n]+)")
    if version then
        return true, version
    end
    return false
end

-- Function to fetch Tibia Wiki version information
local function fetchTibiaWikiInfo(monsterName)
    -- Replace spaces with underscores for URL
    local formattedName = monsterName:gsub(" ", "_")
    local url = "https://tibia.fandom.com/wiki/" .. formattedName
    
    -- Use curl to fetch the page content
    local cmd = 'curl -s "' .. url .. '"'
    local handle = io.popen(cmd)
    if not handle then
        return url, "unknown", false, "Failed to execute curl command"
    end
    
    local result = handle:read("*a")
    local closeSuccess, closeReason = handle:close()
    
    if not closeSuccess then
        return url, "unknown", false, "Error closing curl process: " .. tostring(closeReason)
    end
    
    -- Try to extract version information
    local version = result:match('<div class="pi%-data%-value pi%-font"><a href="/wiki/Updates/([^"]+)"')
    
    -- Check if we got a valid version
    if not version then
        return url, "unknown", false, "Version not found in Wiki page"
    end
    
    -- Check if version is beyond 10.98
    local isPostVersion = false
    local versionError = nil
    
    -- Compare version numbers
    local major, minor = version:match("(%d+)%.(%d+)")
    if major and minor then
        major = tonumber(major)
        minor = tonumber(minor)
        
        if major > 10 or (major == 10 and minor > 98) then
            isPostVersion = true
        end
    else
        versionError = "Could not parse version format: " .. version
    end
    
    -- Return the URL, version string, whether it's a post-10.98 version, and any error
    return url, version, isPostVersion, versionError
end

-- Function to process a single file
local function processFile(filename, errorLogFile, versionLogFile)
    -- Track any errors or issues
    local errors = {}
    local warningCount = 0
    
    -- Read the file
    local content, readError = readFile(filename)
    if not content then
        appendToLog(errorLogFile, filename .. ": " .. (readError or "Unknown read error"))
        return false, 0, 1
    end
    
    -- Check if the file has already been processed (has version comment)
    if hasVersionComment(content) then
        -- File already has version information, check if it's a post-10.98 version
        local existingVersion = content:match("^%s*%-%-%s*Version:%s*([^%\n]+)")
        if existingVersion and existingVersion:match("post 10%.98") then
            -- This is a post-10.98 monster that should have been deleted
            local deleteSuccess = deleteFile(filename)
            if not deleteSuccess then
                appendToLog(errorLogFile, filename .. ": Failed to delete post-10.98 monster file")
                return false, 0, 1
            end
            print("Deleted: " .. filename .. " (post-10.98 monster from version comment)")
            return true, 0, 0, 1
        end
        
        -- File is already processed and not post-10.98, skip it
        print("Skipped: " .. filename .. " (already processed)")
        return true, 0, 0, 0, true
    end
    
    -- Extract monster name for Wiki lookup
    local monsterName = extractMonsterName(content)
    if not monsterName then
        appendToLog(errorLogFile, filename .. ": Could not extract monster name")
        return false, 0, 1
    end
    
    -- Check version information
    local wikiUrl, versionStr, isPostVersion, versionError = fetchTibiaWikiInfo(monsterName)
    
    -- If there was an error determining the version, log it
    if versionError then
        appendToLog(versionLogFile, monsterName .. ": " .. versionError .. " (File: " .. filename .. ")")
        warningCount = warningCount + 1
    end
    
    -- If version is unknown, log it but proceed with modifications
    if versionStr == "unknown" then
        appendToLog(versionLogFile, monsterName .. ": Version unknown (File: " .. filename .. ")")
        warningCount = warningCount + 1
    end
    
    -- If it's a post-10.98 version, delete the file and return
    if isPostVersion then
        local deleteSuccess = deleteFile(filename)
        if not deleteSuccess then
            appendToLog(errorLogFile, filename .. ": Failed to delete file")
            return false, 0, 1
        end
        print("Deleted: " .. filename .. " (post-10.98 monster: " .. monsterName .. ")")
        return true, 0, 0, 1
    end
    
    -- For monsters to keep, proceed with modifications
    local originalContent = content
    local modified = false
    
    -- Add Tibia Wiki link and version information comment at the top
    local wikiComment = "-- " .. monsterName .. " (Tibia Wiki: " .. wikiUrl .. ")\n"
    wikiComment = wikiComment .. "-- Version: " .. versionStr .. "\n\n"
    content = wikiComment .. content
    modified = true
    
    -- Extract monster speed for later use in speed defense
    local monsterSpeed = extractNumber(content, "monster%.speed%s*=%s*(%d+)")
    
    -- 1. Convert name to id in loot tables
    local startPos = 1
    while true do
        local lootStart, lootEnd = content:find("monster%.loot%s*=%s*{", startPos)
        if not lootStart then break end
        
        local lootTableEnd = findClosingBrace(content, lootEnd + 1)
        if lootTableEnd then
            local lootSection = content:sub(lootStart, lootTableEnd)
            local modifiedSection = lootSection:gsub("(%{%s*)name(%s*=%s*)", "%1id%2")
            
            if modifiedSection ~= lootSection then
                content = content:sub(1, lootStart - 1) .. modifiedSection .. content:sub(lootTableEnd + 1)
                modified = true
            end
        end
        
        startPos = (lootTableEnd or lootEnd) + 1
    end
    
    -- 2. Modify speed entries in both defenses and attacks
    
    -- First, handle speed defense entries
    startPos = 1
    while true do
        local defStart, defEnd = content:find("monster%.defenses%s*=%s*{", startPos)
        if not defStart then break end
        
        local defenseEnd = findClosingBrace(content, defEnd + 1)
        if defenseEnd then
            local defenseSection = content:sub(defStart, defenseEnd)
            
            -- Find each speed defense entry and modify it
            local modifiedDefense = defenseSection
            
            -- First pattern removes speedChange, target, and duration
            modifiedDefense = modifiedDefense:gsub("(%{%s*name%s*=%s*\"speed\"[^}]*),(%s*speedChange%s*=%s*[^,}]+)([^}]*)(})", 
                function(prefix, _, suffix, closing)
                    -- Remove target and duration from suffix
                    local newSuffix = suffix:gsub("%s*target%s*=%s*[^,}]+,?", ""):gsub("%s*duration%s*=%s*[^,}]+,?", "")
                    
                    -- Add speed if monster speed is available
                    if monsterSpeed then
                        local doubleSpeed = monsterSpeed * 2
                        -- Check if newSuffix ends with a comma
                        if newSuffix:match(",%s*$") then
                            return prefix .. newSuffix .. " speed = " .. doubleSpeed .. closing
                        else
                            return prefix .. newSuffix .. ", speed = " .. doubleSpeed .. closing
                        end
                    else
                        return prefix .. newSuffix .. closing
                    end
                end)
            
            -- Handle cases where speedChange isn't present but target/duration are
            modifiedDefense = modifiedDefense:gsub("(%{%s*name%s*=%s*\"speed\"[^}]*),(%s*target%s*=%s*[^,}]+)([^}]*)(})", 
                function(prefix, _, suffix, closing)
                    -- Remove duration from suffix
                    local newSuffix = suffix:gsub("%s*duration%s*=%s*[^,}]+,?", "")
                    
                    -- Add speed if monster speed is available
                    if monsterSpeed then
                        local doubleSpeed = monsterSpeed * 2
                        -- Check if newSuffix ends with a comma
                        if newSuffix:match(",%s*$") then
                            return prefix .. newSuffix .. " speed = " .. doubleSpeed .. closing
                        else
                            return prefix .. newSuffix .. ", speed = " .. doubleSpeed .. closing
                        end
                    else
                        return prefix .. newSuffix .. closing
                    end
                end)
            
            -- Handle cases where only duration is present
            modifiedDefense = modifiedDefense:gsub("(%{%s*name%s*=%s*\"speed\"[^}]*),(%s*duration%s*=%s*[^,}]+)([^}]*)(})", 
                function(prefix, _, suffix, closing)
                    -- Add speed if monster speed is available
                    if monsterSpeed then
                        local doubleSpeed = monsterSpeed * 2
                        -- Check if suffix ends with a comma
                        if suffix:match(",%s*$") then
                            return prefix .. suffix .. " speed = " .. doubleSpeed .. closing
                        else
                            return prefix .. suffix .. ", speed = " .. doubleSpeed .. closing
                        end
                    else
                        return prefix .. suffix .. closing
                    end
                end)
            
            if modifiedDefense ~= defenseSection then
                content = content:sub(1, defStart - 1) .. modifiedDefense .. content:sub(defenseEnd + 1)
                modified = true
            end
        end
        
        startPos = (defenseEnd or defEnd) + 1
    end
    
    -- Now handle speed attacks entries
    startPos = 1
    while true do
        local attacksStart, attacksEnd = content:find("monster%.attacks%s*=%s*{", startPos)
        if not attacksStart then break end
        
        local attacksEnd = findClosingBrace(content, attacksEnd + 1)
        if attacksEnd then
            local attacksSection = content:sub(attacksStart, attacksEnd)
            
            -- Find each speed attack entry and convert speedChange to speed
            local modifiedAttacks = attacksSection:gsub("(%{%s*name%s*=%s*\"speed\"[^}]*),(%s*speedChange%s*=%s*)([^,}]+)([^}]*)(})", 
                function(prefix, speedChangeKey, speedChangeValue, suffix, closing)
                    -- Keep the value but change the key from speedChange to speed
                    return prefix .. ", speed = " .. speedChangeValue .. suffix .. closing
                end)
            
            if modifiedAttacks ~= attacksSection then
                content = content:sub(1, attacksStart - 1) .. modifiedAttacks .. content:sub(attacksEnd + 1)
                modified = true
            end
        end
        
        startPos = (attacksEnd or attacksEnd) + 1
    end
    
    -- 3. Remove raceId and Bestiary attributes
    
    -- Remove raceId
    local contentWithoutRaceId = content:gsub("monster%.raceId%s*=%s*[^%\n]+%\n", "")
    if contentWithoutRaceId ~= content then
        content = contentWithoutRaceId
        modified = true
    end
    
    -- Remove Bestiary section
    local bestiaryStart, bestiaryEnd = content:find("monster%.Bestiary%s*=%s*{")
    if bestiaryStart then
        local bestiaryEndPos = findClosingBrace(content, bestiaryEnd + 1)
        if bestiaryEndPos then
            -- Check for newline after closing brace
            local newlineEnd = content:find("\n", bestiaryEndPos)
            if newlineEnd then
                bestiaryEndPos = newlineEnd
            end
            
            content = content:sub(1, bestiaryStart - 1) .. content:sub(bestiaryEndPos + 1)
            modified = true
        end
    end
    
    -- 4. Remove isPreyExclusive from monster.flags
    startPos = 1
    while true do
        local flagsStart, flagsEnd = content:find("monster%.flags%s*=%s*{", startPos)
        if not flagsStart then break end
        
        local flagsEnd = findClosingBrace(content, flagsEnd + 1)
        if flagsEnd then
            local flagsSection = content:sub(flagsStart, flagsEnd)
            
            -- Remove isPreyExclusive line
            local modifiedFlags = flagsSection:gsub("%s*isPreyExclusive%s*=%s*[^,}]+,?", "")
            
            -- Clean up any potential double commas or trailing commas before closing brace
            modifiedFlags = modifiedFlags:gsub(",%s*}", "}")
            modifiedFlags = modifiedFlags:gsub(",%s*,", ",")
            
            if modifiedFlags ~= flagsSection then
                content = content:sub(1, flagsStart - 1) .. modifiedFlags .. content:sub(flagsEnd + 1)
                modified = true
            end
        end
        
        startPos = (flagsEnd or flagsEnd) + 1
    end
    
    -- 5. Remove monster.faction and monster.enemyFactions attributes
    
    -- Remove monster.faction
    local contentWithoutFaction = content:gsub("monster%.faction%s*=%s*[^%\n]+%\n", "")
    if contentWithoutFaction ~= content then
        content = contentWithoutFaction
        modified = true
    end
    
    -- Remove monster.enemyFactions section
    local enemyFactionsStart, enemyFactionsEnd = content:find("monster%.enemyFactions%s*=%s*{")
    if enemyFactionsStart then
        local enemyFactionsEndPos = findClosingBrace(content, enemyFactionsEnd + 1)
        if enemyFactionsEndPos then
            -- Check for newline after closing brace
            local newlineEnd = content:find("\n", enemyFactionsEndPos)
            if newlineEnd then
                enemyFactionsEndPos = newlineEnd
            end
            
            content = content:sub(1, enemyFactionsStart - 1) .. content:sub(enemyFactionsEndPos + 1)
            modified = true
        end
    end
    
    -- Write the modified content
    if modified then
        local writeSuccess, writeError = writeFile(filename, content)
        if not writeSuccess then
            appendToLog(errorLogFile, filename .. ": " .. (writeError or "Unknown write error"))
            return false, 0, 1
        end
        print("Modified: " .. filename)
        return true, 1, warningCount
    end
    
    return false, 0, warningCount
end

-- Function to find all Lua files recursively
local function findLuaFiles(directory)
    local files = {}
    local cmd = "find " .. directory .. " -type f -name '*.lua'"
    local handle = io.popen(cmd)
    if not handle then
        print("Error: Failed to execute find command")
        return files
    end
    
    local result = handle:read("*a")
    handle:close()
    
    for filename in result:gmatch("[^\r\n]+") do
        table.insert(files, filename)
    end
    
    return files
end

-- Main function
local function main(directory)
    if not directory then
        print("Usage: lua tibia-wiki-prune-idempotent.lua <directory>")
        print("Example: lua tibia-wiki-prune-idempotent.lua \"data/monster/lua\"")
        return
    end
    
    -- Set up logging files
    local errorLogFile = "monster_processing_errors.txt"
    local versionLogFile = "monster_version_issues.txt"
    
    -- Clear the log files if they exist
    os.remove(errorLogFile)
    os.remove(versionLogFile)
    
    -- Add headers to log files
    appendToLog(errorLogFile, "# Monster Processing Errors - " .. os.date())
    appendToLog(errorLogFile, "# Format: filename: error message")
    appendToLog(errorLogFile, "")
    
    appendToLog(versionLogFile, "# Monster Version Issues - " .. os.date())
    appendToLog(versionLogFile, "# Format: monster_name: issue details (File: path/to/file)")
    appendToLog(versionLogFile, "")
    
    local files = findLuaFiles(directory)
    print("Found " .. #files .. " Lua files to process")
    
    local modifiedCount = 0
    local deletedCount = 0
    local errorCount = 0
    local warningCount = 0
    local skippedCount = 0
    
    for _, filename in ipairs(files) do
        local status, processedType, warnings, deleted, skipped = pcall(function()
            return processFile(filename, errorLogFile, versionLogFile)
        end)
        
        if not status then
            print("Error processing " .. filename .. ": " .. tostring(processedType))
            appendToLog(errorLogFile, filename .. ": Lua error - " .. tostring(processedType))
            errorCount = errorCount + 1
        elseif processedType then
            -- File was successfully processed
            if skipped then
                skippedCount = skippedCount + 1
            elseif deleted then
                deletedCount = deletedCount + 1
            else
                modifiedCount = modifiedCount + 1
            end
            
            warningCount = warningCount + (warnings or 0)
        end
    end
    
    print("\nCompleted processing:")
    print("  - Modified: " .. modifiedCount .. " files")
    print("  - Deleted: " .. deletedCount .. " files (post-10.98)")
    print("  - Skipped: " .. skippedCount .. " files (already processed)")
    print("  - Errors: " .. errorCount .. " files (see " .. errorLogFile .. ")")
    print("  - Warnings: " .. warningCount .. " issues (see " .. versionLogFile .. ")")
end

-- Execute the main function with command line argument
main(arg[1])