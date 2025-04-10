-- Bonus module for extra defense increases
-- Handles extra defense bonus functionality
local ExtraDefenseBonus = {}

--- Check if an item can have extra defense bonus.
-- @param item Item Item to check
-- @return boolean True if eligible for extra defense bonus
function ExtraDefenseBonus.isEligibleItem(item)
    local it = ItemType(item:getId())
    if it:getExtraDefense() > 0 then
        return true
    end
    -- Shields always get extra defense bonus
    if it:getWeaponType() == WEAPON_SHIELD then
        return true
    end
    return false
end

--- Calculate extra defense bonus based on upgrade level difference.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
-- @return number Extra defense bonus to apply
function ExtraDefenseBonus.calculateBonus(item, oldLevel, newLevel)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()

    -- Get extra defense per upgrade from config
    local extraDefPerUpgrade = US_CONFIG.EXTRADEFENSE_PER_UPGRADE
    if US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] and US_CONFIG.WEAPON_UPGRADES[wtype].extra_defense then
        extraDefPerUpgrade = US_CONFIG.WEAPON_UPGRADES[wtype].extra_defense
    end

    local levelDiff = newLevel - oldLevel
    return levelDiff * extraDefPerUpgrade
end

--- Apply extra defense bonus to an item.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
function ExtraDefenseBonus.applyBonus(item, oldLevel, newLevel)
    if not ExtraDefenseBonus.isEligibleItem(item) then
        return
    end

    local bonus = ExtraDefenseBonus.calculateBonus(item, oldLevel, newLevel)
    local currentExtraDefense = item:getAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE)

    if bonus ~= 0 then
        item:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE, currentExtraDefense + bonus)
    end
end

return ExtraDefenseBonus
