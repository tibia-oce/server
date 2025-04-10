-- Bonus module for weapon attack increases
-- Handles weapon attack bonus functionality
local WeaponAttackBonus = {}

--- Check if an item is a weapon that can have attack bonus.
-- @param item Item Item to check
-- @return boolean True if eligible for attack bonus
function WeaponAttackBonus.isEligibleWeapon(item)
    local it = ItemType(item:getId())
    if it:getAttack() > 0 then
        local wtype = it:getWeaponType()
        return
            wtype == WEAPON_SWORD or wtype == WEAPON_AXE or wtype == WEAPON_CLUB or wtype == WEAPON_DISTANCE or wtype ==
                WEAPON_WAND
    end
    return false
end

--- Calculate attack bonus for a weapon based on upgrade level difference.
-- @param item Item Weapon being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
-- @return number Attack bonus to apply
function WeaponAttackBonus.calculateBonus(item, oldLevel, newLevel)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()

    -- Get attack per upgrade from config based on weapon type
    local attackPerUpgrade = US_CONFIG.ATTACK_PER_UPGRADE
    if US_CONFIG.WEAPON_UPGRADES and US_CONFIG.WEAPON_UPGRADES[wtype] and US_CONFIG.WEAPON_UPGRADES[wtype].attack then
        attackPerUpgrade = US_CONFIG.WEAPON_UPGRADES[wtype].attack
    end

    local levelDiff = newLevel - oldLevel
    return levelDiff * attackPerUpgrade
end

--- Apply attack bonus to a weapon.
-- @param item Item Weapon being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
function WeaponAttackBonus.applyBonus(item, oldLevel, newLevel)
    if not WeaponAttackBonus.isEligibleWeapon(item) then
        return
    end

    local bonus = WeaponAttackBonus.calculateBonus(item, oldLevel, newLevel)
    local currentAttack = item:getAttribute(ITEM_ATTRIBUTE_ATTACK)

    if bonus ~= 0 then
        item:setAttribute(ITEM_ATTRIBUTE_ATTACK, currentAttack + bonus)
    end
end

return WeaponAttackBonus
