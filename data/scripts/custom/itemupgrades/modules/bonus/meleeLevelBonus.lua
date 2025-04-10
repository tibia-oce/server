-- Bonus module for melee level increases
-- Handles melee skill bonus functionality
local MeleeLevelBonus = {}

--- Check if an item is a melee weapon.
-- @param item Item Item to check
-- @return boolean True if melee weapon
function MeleeLevelBonus.isMeleeWeapon(item)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()
    return wtype == WEAPON_SWORD or wtype == WEAPON_AXE or wtype == WEAPON_CLUB
end

--- Determine if an item should get a melee level bonus per upgrade.
-- @param item Item Item to check
-- @return boolean, number True if eligible, plus how much melee level per upgrade
function MeleeLevelBonus.shouldGetMeleeLevelBonus(item)
    if MeleeLevelBonus.isMeleeWeapon(item) then
        local it = ItemType(item:getId())
        local wtype = it:getWeaponType()
        if US_CONFIG.WEAPON_UPGRADES[wtype] and US_CONFIG.WEAPON_UPGRADES[wtype].melee_level then
            return true, US_CONFIG.WEAPON_UPGRADES[wtype].melee_level
        end
        return true, 1 -- Default value if not specified in config
    end
    return false, 0
end

--- Update melee-level custom attribute on an item when its upgrade level changes.
-- @param item Item Item being upgraded
-- @param oldLevel number Old upgrade level
-- @param newLevel number New upgrade level
function MeleeLevelBonus.updateBonus(item, oldLevel, newLevel)
    local eligible, mlPerUpgrade = MeleeLevelBonus.shouldGetMeleeLevelBonus(item)
    if not eligible or mlPerUpgrade <= 0 then
        return
    end

    local levelDiff = newLevel - oldLevel
    local currentBonus = item:getCustomAttribute("bonus_meleelevel") or 0
    local newBonus = currentBonus

    if levelDiff > 0 then
        newBonus = currentBonus + (levelDiff * mlPerUpgrade)
    elseif levelDiff < 0 then
        newBonus = math.max(0, currentBonus + (levelDiff * mlPerUpgrade))
    end
    item:setCustomAttribute("bonus_meleelevel", newBonus)
end

--- Extend item description to show melee-level bonus if present.
-- @param item Item Item being described
-- @param description string Current description
-- @return string Updated description
function MeleeLevelBonus.extendDescription(item, description)
    local bonus = item:getCustomAttribute("bonus_meleelevel")
    if bonus and bonus > 0 then
        if description:find("%[ Attributes %]") then
            description = description .. "\nMelee Skills: +" .. bonus
        end
    end
    return description
end

return MeleeLevelBonus
