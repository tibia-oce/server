globalLoot = globalLoot or {}

--- Default values for missing loot entry fields.
-- @return table default loot values.
local defaultLootEntry = {
    subType = -1,
    actionId = -1,
    text = "",
    requiredLvl = 0,
    childLoot = {}
}

--- Normalises a loot entry by filling in missing fields with default values.
-- @param entry table: The loot entry to normalise.
-- @return table The normalised loot entry.
local function normaliseLootEntry(entry)
    for key, defaultValue in pairs(defaultLootEntry) do
        if entry[key] == nil then
            entry[key] = defaultValue
        end
    end
    return entry
end

--- Registers a list of loot entries into the global loot table.
-- @param lootEntries table: A table of loot entry tables.
function registerGlobalLoot(lootEntries)
    for _, entry in ipairs(lootEntries) do
        table.insert(globalLoot, normaliseLootEntry(entry))
    end
end
