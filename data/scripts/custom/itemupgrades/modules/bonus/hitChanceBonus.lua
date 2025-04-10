-- Bonus module for hit chance increases
-- Handles hit chance bonus functionality
local HitChanceBonus = {}

--- Check if an item can have hit chance bonus.
-- @param item Item Item to check
-- @return boolean True if eligible for hit chance bonus
function HitChanceBonus.isEligibleItem(item)
    local it = ItemType(item:getId())
    if it:getHitChance() > 0 then
        return true
    end
    -- Distance weapons always get hit chance bonus
    if it:getWeaponType() == WEAPON_DISTANCE then
        return true
    end
    return false
end

--- Calculate hit chance bonus based on upgrade level difference.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
-- @return number Hit chance bonus to apply
function HitChanceBonus.calculateBonus(item, oldLevel, newLevel)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()

    -- Get hit chance per upgrade from config
    local hitChancePerUpgrade = US_CONFIG.HITCHANCE_PER_UPGRADE
    if US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] and US_CONFIG.WEAPON_UPGRADES[wtype].hitchance then
        hitChancePerUpgrade = US_CONFIG.WEAPON_UPGRADES[wtype].hitchance
    end

    local levelDiff = newLevel - oldLevel
    return levelDiff * hitChancePerUpgrade
end

--- Apply hit chance bonus to an item.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
function HitChanceBonus.applyBonus(item, oldLevel, newLevel)
    if not HitChanceBonus.isEligibleItem(item) then
        return
    end

    local bonus = HitChanceBonus.calculateBonus(item, oldLevel, newLevel)
    local currentHitChance = item:getAttribute(ITEM_ATTRIBUTE_HITCHANCE)

    if bonus ~= 0 then
        item:setAttribute(ITEM_ATTRIBUTE_HITCHANCE, currentHitChance + bonus)
    end
end

return HitChanceBonus
