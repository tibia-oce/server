-- data/scripts/custom/itemupgrades/magiclevel.lua
-- Logic for handling magic-level bonuses on upgraded items.
MAGICLEVEL = {}
MAGICLEVEL.CONDITIONS = {}

--- Check if an item is considered a spellbook (usually a shield-type with 'spellbook' in name).
-- @param item Item
-- @return boolean
function MAGICLEVEL.isSpellbook(item)
    local it = ItemType(item:getId())
    if it:getWeaponType() == WEAPON_SHIELD then
        local name = it:getName():lower()
        return (name:find("spellbook") or name:find("scroll")) and true or false
    end
    return false
end

--- Determine if an item should get a magic level bonus per upgrade.
-- @param item Item
-- @return boolean, number  True if eligible, plus how much ML per upgrade.
function MAGICLEVEL.shouldGetMagicLevelBonus(item)
    local it = ItemType(item:getId())
    local wtype = it:getWeaponType()
    if wtype == WEAPON_WAND and US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND] and
        US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND].magic_level then
        return true, US_CONFIG.WEAPON_UPGRADES[WEAPON_WAND].magic_level
    end
    if MAGICLEVEL.isSpellbook(item) then
        return true, 1
    end
    if wtype == WEAPON_SHIELD and US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD] and
        US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD].magic_level then
        return true, US_CONFIG.WEAPON_UPGRADES[WEAPON_SHIELD].magic_level
    end
    return false, 0
end

--- Update magic-level custom attribute on an item when its upgrade level changes.
-- @param item Item
-- @param oldLevel number
-- @param newLevel number
function MAGICLEVEL.updateBonus(item, oldLevel, newLevel)
    local eligible, mlPerUpgrade = MAGICLEVEL.shouldGetMagicLevelBonus(item)
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

--- Extend item description to show magic-level bonus if present.
-- @param item Item
-- @param description string
-- @return string
function MAGICLEVEL.extendDescription(item, description)
    local bonus = item:getCustomAttribute("bonus_magiclevel")
    if bonus and bonus > 0 then
        if description:find("%[ Attributes %]") then
            description = description .. "\nMagic Level: +" .. bonus
        end
    end
    return description
end

--- Apply magic-level bonuses for a player's equipped items on login.
-- @param player Player
function applyMagicLevelBonuses(player)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local bonusMagicLevel = item:getCustomAttribute("bonus_magiclevel")
            if bonusMagicLevel and bonusMagicLevel > 0 then
                local c = Condition(CONDITION_ATTRIBUTES)
                c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, bonusMagicLevel)
                c:setParameter(CONDITION_PARAM_TICKS, -1)
                c:setParameter(CONDITION_PARAM_SUBID, 70000 + player:getId() % 1000)
                c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                player:addCondition(c)
            end
        end
    end
end

--- Remove references when player logs out (cleanup).
-- @param playerId number
function MAGICLEVEL.cleanupOnLogout(playerId)
    MAGICLEVEL.CONDITIONS[playerId] = nil
end

return MAGICLEVEL
