-- Bonus module for armor increases
-- Handles armor bonus functionality
local ArmorBonus = {}

--- Check if an item can have armor bonus.
-- @param item Item Item to check
-- @return boolean True if eligible for armor bonus
function ArmorBonus.isEligibleItem(item)
    local it = ItemType(item:getId())
    if it:getArmor() > 0 then
        return true
    end
    return false
end

--- Calculate armor bonus based on upgrade level difference.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
-- @return number Armor bonus to apply
function ArmorBonus.calculateBonus(item, oldLevel, newLevel)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()

    -- Get armor per upgrade from config
    local armorPerUpgrade = US_CONFIG.ARMOR_PER_UPGRADE
    if US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] and US_CONFIG.WEAPON_UPGRADES[wtype].armor then
        armorPerUpgrade = US_CONFIG.WEAPON_UPGRADES[wtype].armor
    end

    local levelDiff = newLevel - oldLevel
    return levelDiff * armorPerUpgrade
end

--- Apply armor bonus to an item.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
function ArmorBonus.applyBonus(item, oldLevel, newLevel)
    if not ArmorBonus.isEligibleItem(item) then
        return
    end

    local bonus = ArmorBonus.calculateBonus(item, oldLevel, newLevel)
    local currentArmor = item:getAttribute(ITEM_ATTRIBUTE_ARMOR)

    if bonus ~= 0 then
        item:setAttribute(ITEM_ATTRIBUTE_ARMOR, currentArmor + bonus)
    end
end

return ArmorBonus
