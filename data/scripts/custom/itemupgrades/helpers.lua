-- Global helper functions for the Item Upgrade System
--- Checks if a value exists in an array.
-- @param array table The array to search in
-- @param value any The value to search for
-- @return boolean True if found, false otherwise
function isInArray(array, value)
    if type(array) ~= "table" then
        return false
    end

    for _, v in ipairs(array) do
        if v == value then
            return true
        end
    end

    return false
end

--- Checks if two creatures are in the same party.
-- @param creature1 Creature First creature to check
-- @param creature2 Creature Second creature to check
-- @return boolean True if they're in the same party
function isInSameParty(creature1, creature2)
    if creature1:isPlayer() and creature2:isPlayer() and creature1:getParty() and creature2:getParty() then
        return creature1:getParty() == creature2:getParty()
    end
    return false
end

--- Checks if a Position is an equipment slot.
-- @param position Position The position to check
-- @return boolean True if it's an equipment slot
function isEquipPosition(position)
    return position.y <= CONST_SLOT_AMMO and position.y ~= CONST_SLOT_BACKPACK
end

--- Roll a random attribute ID, possibly avoiding duplicates.
-- @param existingAttrIds table Array of attribute IDs to avoid
-- @param item_level number The item's level
-- @param usItemType number The item's type flag
-- @return number The rolled attribute ID
function rollRandomAttribute(existingAttrIds, item_level, usItemType)
    local attrId = math.random(1, #US_ENCHANTMENTS)
    local attr = US_ENCHANTMENTS[attrId]

    while ((not US_CONFIG.ALLOW_DUPLICATE_ENCHANTS and isInArray(existingAttrIds, attrId)) or
        (bit.band(usItemType, attr.itemType) == 0) or (attr.chance and math.random(100) >= attr.chance)) do
        attrId = math.random(1, #US_ENCHANTMENTS)
        attr = US_ENCHANTMENTS[attrId]
    end
    return attrId
end

--- Randomly decide an upgrade level.
-- @return number The rolled upgrade level
function rollUpgradeLevel()
    local level = 1
    for i = US_CONFIG.MAX_UPGRADE_LEVEL, 1, -1 do
        if i >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
            if math.random(100) <= US_CONFIG.UPGRADE_DESTROY_CHANCE[i] then
                level = i
                break
            end
        else
            if math.random(100) <= US_CONFIG.UPGRADE_SUCCESS_CHANCE[i] then
                level = i
                break
            end
        end
    end
    return level
end

--- Compute an attribute's magnitude (percentage or otherwise).
-- @param attr table The attribute definition
-- @param item_level number The item's level
-- @return number The calculated attribute value
function calculateAttributeValue(attr, item_level)
    if attr.percentage then
        return math.random(1, US_CONFIG.MAX_PERCENTAGE_ROLL)
    elseif attr.VALUES_PER_LEVEL then
        local maxValue = math.ceil(item_level * attr.VALUES_PER_LEVEL)
        if maxValue < 1 then
            return 1
        end
        return math.random(1, maxValue)
    else
        return 1
    end
end

--- Get the per-upgrade config for an item from config.lua.
-- @param item Item The item to check
-- @return table The upgrade configuration for the item
function getUpgradeConfig(item)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()
    if wtype > 0 and US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] then
        return {
            attack_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].attack or US_CONFIG.ATTACK_PER_UPGRADE,
            defense_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].defense or US_CONFIG.DEFENSE_PER_UPGRADE,
            extra_defense_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].extra_defense or
                US_CONFIG.EXTRADEFENSE_PER_UPGRADE,
            armor_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].armor or US_CONFIG.ARMOR_PER_UPGRADE,
            hitchance_per_upgrade = US_CONFIG.WEAPON_UPGRADES[wtype].hitchance or US_CONFIG.HITCHANCE_PER_UPGRADE
        }
    end
    return {
        attack_per_upgrade = US_CONFIG.ATTACK_PER_UPGRADE,
        defense_per_upgrade = US_CONFIG.DEFENSE_PER_UPGRADE,
        extra_defense_per_upgrade = US_CONFIG.EXTRADEFENSE_PER_UPGRADE,
        armor_per_upgrade = US_CONFIG.ARMOR_PER_UPGRADE,
        hitchance_per_upgrade = US_CONFIG.HITCHANCE_PER_UPGRADE
    }
end

--- Update an attribute by comparing old vs. new upgrade level.
-- @param item Item The item being upgraded
-- @param attrType number The attribute type constant
-- @param perUpgrade number The per-upgrade value
-- @param oldLevel number The old upgrade level
-- @param newLevel number The new upgrade level
function updateUpgradeAttribute(item, attrType, perUpgrade, oldLevel, newLevel)
    local current = item:getAttribute(attrType)
    if oldLevel < newLevel then
        item:setAttribute(attrType, current + (newLevel - oldLevel) * perUpgrade)
    else
        item:setAttribute(attrType, current - (oldLevel - newLevel) * perUpgrade)
    end
end
