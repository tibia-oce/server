-- Bonus module for weapon defense increases
-- Handles weapon defense bonus functionality
local WeaponDefenseBonus = {}

--- Check if an item is a weapon/shield that can have defense bonus.
-- @param item Item Item to check
-- @return boolean True if eligible for defense bonus
function WeaponDefenseBonus.isEligibleItem(item)
    local it = ItemType(item:getId())
    if it:getDefense() > 0 then
        return true
    end
    return false
end

--- Calculate defense bonus based on upgrade level difference.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
-- @return number Defense bonus to apply
function WeaponDefenseBonus.calculateBonus(item, oldLevel, newLevel)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()

    -- Get defense per upgrade from config based on weapon/item type
    local defensePerUpgrade = US_CONFIG.DEFENSE_PER_UPGRADE
    if US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] and US_CONFIG.WEAPON_UPGRADES[wtype].defense then
        defensePerUpgrade = US_CONFIG.WEAPON_UPGRADES[wtype].defense
    end

    local levelDiff = newLevel - oldLevel
    return levelDiff * defensePerUpgrade
end

--- Apply defense bonus to an item.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
function WeaponDefenseBonus.applyBonus(item, oldLevel, newLevel)
    if not WeaponDefenseBonus.isEligibleItem(item) then
        return
    end

    local bonus = WeaponDefenseBonus.calculateBonus(item, oldLevel, newLevel)
    local currentDefense = item:getAttribute(ITEM_ATTRIBUTE_DEFENSE)

    if bonus ~= 0 then
        item:setAttribute(ITEM_ATTRIBUTE_DEFENSE, currentDefense + bonus)
    end
end

return WeaponDefenseBonus
