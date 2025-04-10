-- Domain model representing crystals (triggers)
-- Defines crystal behavior and functionality
dofile('data/scripts/custom/itemupgrades/domain/Item.lua')

-- Crystal module
local Crystal = {}

--- Check if the item is a crystal of any type.
-- @param item Item
-- @return boolean True if the item is a crystal
function Crystal.isCrystal(item)
    if not item then
        return false
    end

    -- Check upgrade crystals
    for _, crystal in pairs(US_CONFIG[1]) do
        if item:getId() == crystal then
            return true
        end
    end

    -- Check special crystals
    return item:getId() == US_CONFIG.ITEM_MIRRORED_CRYSTAL or item:getId() == US_CONFIG.ITEM_MIND_CRYSTAL or
               item:getId() == US_CONFIG.ITEM_ANNULMENT_CRYSTAL or item:getId() == US_CONFIG.ITEM_DIVINE_CRYSTAL
end

--- Get the crystal type from an item.
-- @param item Item
-- @return number Crystal type constant
function Crystal.getType(item)
    if not item then
        return 0
    end

    -- Check each crystal type
    if item:getId() == US_CONFIG[1][ITEM_UPGRADE_CRYSTAL] then
        return ITEM_UPGRADE_CRYSTAL
    elseif item:getId() == US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL] then
        return ITEM_AUGMENTING_CRYSTAL
    elseif item:getId() == US_CONFIG[1][ITEM_ALTER_CRYSTAL] then
        return ITEM_ALTER_CRYSTAL
    elseif item:getId() == US_CONFIG[1][ITEM_SCOURING_CRYSTAL] then
        return ITEM_SCOURING_CRYSTAL
    elseif item:getId() == US_CONFIG[1][ITEM_EXALT_CRYSTAL] then
        return ITEM_EXALT_CRYSTAL
    elseif item:getId() == US_CONFIG[1][ITEM_CHAOS_CRYSTAL] then
        return ITEM_CHAOS_CRYSTAL
    elseif item:getId() == US_CONFIG.ITEM_MIRRORED_CRYSTAL then
        return -1 -- Special crystal: Mirrored
    elseif item:getId() == US_CONFIG.ITEM_MIND_CRYSTAL then
        return -2 -- Special crystal: Mind
    elseif item:getId() == US_CONFIG.ITEM_ANNULMENT_CRYSTAL then
        return -3 -- Special crystal: Annulment
    elseif item:getId() == US_CONFIG.ITEM_DIVINE_CRYSTAL then
        return -4 -- Special crystal: Divine
    end

    return 0 -- Not a crystal
end

--- Get the name of the crystal type.
-- @param crystalType number Crystal type constant
-- @return string Crystal type name
function Crystal.getTypeName(crystalType)
    if crystalType == ITEM_UPGRADE_CRYSTAL then
        return "Upgrade Crystal"
    elseif crystalType == ITEM_AUGMENTING_CRYSTAL then
        return "Augmenting Crystal"
    elseif crystalType == ITEM_ALTER_CRYSTAL then
        return "Alteration Crystal"
    elseif crystalType == ITEM_SCOURING_CRYSTAL then
        return "Scouring Crystal"
    elseif crystalType == ITEM_EXALT_CRYSTAL then
        return "Exalt Crystal"
    elseif crystalType == ITEM_CHAOS_CRYSTAL then
        return "Chaos Crystal"
    elseif crystalType == -1 then
        return "Mirrored Crystal"
    elseif crystalType == -2 then
        return "Mind Crystal"
    elseif crystalType == -3 then
        return "Annulment Crystal"
    elseif crystalType == -4 then
        return "Divine Crystal"
    end

    return "Unknown Crystal"
end

--- Check if a crystal breaks based on configuration.
-- @return boolean True if crystal breaks
function Crystal.checkBreak()
    return math.random(100) <= US_CONFIG.CRYSTAL_BREAK_CHANCE
end

--- Basic validation that the target is a valid upgradable item and not equipped.
-- @param player Player
-- @param item Item
-- @param target Item
-- @param toPosition Position
-- @return boolean
function Crystal.validateTarget(player, item, target, toPosition)
    if not target or not target:isItem() or not target:getType():isUpgradable() then
        return false
    end
    if toPosition.y <= CONST_SLOT_AMMO then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You can't use that on an equipped item!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end
    return true
end

--- Check if an item is not mirrored.
-- @param player Player
-- @param target Item
-- @return boolean
function Crystal.validateNotMirrored(player, target)
    if target:isMirrored() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "That item is mirrored and can't be modified.")
        return false
    end
    return true
end

--- Check if an item is not unique.
-- @param player Player
-- @param target Item
-- @return boolean
function Crystal.validateNotUnique(player, target)
    if target:isUnique() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Can't modify a Unique item's attributes.")
        return false
    end
    return true
end

return Crystal
