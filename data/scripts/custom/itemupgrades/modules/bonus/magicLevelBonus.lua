-- Bonus module for magic level increases
-- Handles magic level bonus functionality
local MagicLevelBonus = {}

--- Check if an item is considered a spellbook.
-- @param item Item Item to check
-- @return boolean True if spellbook
function MagicLevelBonus.isSpellbook(item)
    local it = ItemType(item:getId())
    if it:getWeaponType() == WEAPON_SHIELD then
        local name = it:getName():lower()
        return (name:find("spellbook") or name:find("scroll")) and true or false
    end
    return false
end

--- Determine if an item should get a magic level bonus per upgrade.
-- @param item Item Item to check
-- @return boolean, number True if eligible, plus how much ML per upgrade
function MagicLevelBonus.shouldGetMagicLevelBonus(item)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()
    if wtype == WEAPON_WAND and US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND] and
        US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND].magic_level then
        return true, US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND].magic_level
    end
    if MagicLevelBonus.isSpellbook(item) then
        return true, 1
    end
    if wtype == WEAPON_SHIELD and US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD] and
        US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD].magic_level then
        return true, US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD].magic_level
    end
    return false, 0
end

--- Update magic-level custom attribute on an item when its upgrade level changes.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
function MagicLevelBonus.updateBonus(item, oldLevel, newLevel)
    local eligible, mlPerUpgrade = MagicLevelBonus.shouldGetMagicLevelBonus(item)
    if not eligible or mlPerUpgrade <= 0 then
        return
    end

    local levelDiff = newLevel - oldLevel
    local currentBonus = item:getCustomAttribute("bonus_magiclevel") or 0
    local newBonus = currentBonus

    if levelDiff > 0 then
        newBonus = currentBonus + (levelDiff * mlPerUpgrade)
    elseif levelDiff < 0 then
        newBonus = math.max(0, currentBonus + (levelDiff * mlPerUpgrade))
    end
    item:setCustomAttribute("bonus_magiclevel", newBonus)
end

--- Get the current magic level bonus from an item.
-- @param item Item Item to check
-- @return number Current magic level bonus (0 if none)
function MagicLevelBonus.getBonus(item)
    return item:getCustomAttribute("bonus_magiclevel") or 0
end

--- Set a specific magic level bonus on an item.
-- @param item Item Item to modify
-- @param bonus number Bonus value to set
function MagicLevelBonus.setBonus(item, bonus)
    item:setCustomAttribute("bonus_magiclevel", math.max(0, bonus))
end

--- Increase the magic level bonus on an item.
-- @param item Item Item to modify
-- @param amount number Amount to increase (defaults to 1)
-- @return number New magic level bonus
function MagicLevelBonus.increaseBonus(item, amount)
    amount = amount or 1
    local currentBonus = MagicLevelBonus.getBonus(item)
    local newBonus = currentBonus + amount
    MagicLevelBonus.setBonus(item, newBonus)
    return newBonus
end

--- Decrease the magic level bonus on an item.
-- @param item Item Item to modify
-- @param amount number Amount to decrease (defaults to 1)
-- @return number New magic level bonus
function MagicLevelBonus.decreaseBonus(item, amount)
    amount = amount or 1
    local currentBonus = MagicLevelBonus.getBonus(item)
    local newBonus = math.max(0, currentBonus - amount)
    MagicLevelBonus.setBonus(item, newBonus)
    return newBonus
end

--- Apply magic level condition to a player from an item.
-- @param player Player Player to apply condition to
-- @param item Item Item providing the bonus (optional)
-- @param bonus number Optional explicit bonus value (uses item bonus if not provided)
function MagicLevelBonus.applyCondition(player, item, bonus)
    -- Remove any existing magic level condition
    player:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 70000 + player:getId() % 1000)

    -- If no specific bonus is provided, get it from the item
    if not bonus and item then
        bonus = MagicLevelBonus.getBonus(item)
    end

    -- Only apply if there's a positive bonus
    if bonus and bonus > 0 then
        local c = Condition(CONDITION_ATTRIBUTES)
        c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, bonus)
        c:setParameter(CONDITION_PARAM_TICKS, -1)
        c:setParameter(CONDITION_PARAM_SUBID, 70000 + player:getId() % 1000)
        c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
        player:addCondition(c)
    end
end

--- Extend item description to show magic-level bonus if present.
-- @param item Item Item being described
-- @param description string Current description
-- @return string Updated description
function MagicLevelBonus.extendDescription(item, description)
    -- This is now handled directly in AttributeService.enhanceUpgradableItemDescription
    return description
end

--- Remove magic level references when player logs out (cleanup).
-- @param playerId number Player ID
function MagicLevelBonus.cleanupOnLogout(playerId)
    if BONUS_CONFIG.MAGIC_LEVEL.CONDITIONS then
        BONUS_CONFIG.MAGIC_LEVEL.CONDITIONS[playerId] = nil
    end
end

return MagicLevelBonus
