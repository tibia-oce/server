-- data/scripts/custom/itemupgrades/augments.lua
-- Routines for creating damage/protection augments from enchantments.
ATTACK_MOD = 0
DEFENSE_MOD = 1
ATTACK_MODIFIER_PIERCING = 6
DEFENSE_MODIFIER_RESIST = 8
PERCENT_MODIFIER = 1
FLAT_MODIFIER = 0
COMBAT_NONE = 0
ORIGIN_AUGMENT = 12
CREATURETYPE_ATTACKABLE = 12
RACE_NONE = 0

--- Convert a string-based damage type (e.g., "energy") to its constant.
-- @param typeName string
-- @return number
function getCombatType(typeName)
    local mapping = {
        physical = COMBAT_PHYSICALDAMAGE,
        energy = COMBAT_ENERGYDAMAGE,
        earth = COMBAT_EARTHDAMAGE,
        fire = COMBAT_FIREDAMAGE,
        ice = COMBAT_ICEDAMAGE,
        holy = COMBAT_HOLYDAMAGE,
        death = COMBAT_DEATHDAMAGE
    }
    return mapping[typeName] or COMBAT_NONE
end

--- Check if an enchantment ID is in the OFFENSIVE/DEFENSIVE table.
-- @param id number
-- @return boolean
function isCombatEnchantment(id)
    return ENCHANT_TYPES and
               (ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[id] or ENCHANT_TYPES.DEFENSIVE and
                   ENCHANT_TYPES.DEFENSIVE[id])
end

--- Create a DamageModifier instance.
-- @param stance number
-- @param modType number
-- @param value number
-- @param factor number
-- @param combatType number
-- @return DamageModifier|nil
local function makeModifier(stance, modType, value, factor, combatType)
    local mod = DamageModifier((stance == 0) and 1 or stance, (modType == 0) and 1 or modType,
        (value == 0) and 1 or value, (factor == 0) and 1 or factor, 100, combatType or COMBAT_NONE, ORIGIN_AUGMENT,
        CREATURETYPE_ATTACKABLE, RACE_NONE, "")
    if not mod then
        return nil
    end
    mod:setValue(value)
    mod:setRateFactor(factor)
    mod:setCombatFilter(combatType or COMBAT_NONE)
    mod:setOriginFilter(ORIGIN_AUGMENT)
    return mod
end

--- Create an Augment object from given info.
-- @param info table
-- @param value number
-- @param stance number
-- @param modType number
-- @return Augment
local function createAugment(info, value, stance, modType)
    local modifiers = {}
    local augmentName = info.name
    local types = (info.type == "elemental") and {"energy", "earth", "fire", "ice", "holy", "death"} or {info.type}

    for _, typeName in ipairs(types) do
        local combatType = getCombatType(typeName)
        local modifier = makeModifier(stance, modType, value, PERCENT_MODIFIER, combatType)
        if modifier then
            table.insert(modifiers, modifier)
        end
    end
    return Augment(augmentName, augmentName .. " +" .. value .. "%", modifiers)
end

--- Create a damage-type augment.
-- @param info table
-- @param value number
-- @return Augment
function createDamageAugment(info, value)
    return createAugment(info, value, ATTACK_MOD, ATTACK_MODIFIER_PIERCING)
end

--- Create a protection-type augment.
-- @param info table
-- @param value number
-- @return Augment
function createProtectionAugment(info, value)
    return createAugment(info, value, DEFENSE_MOD, DEFENSE_MODIFIER_RESIST)
end

--- Create an Augment by ID.
-- @param enchantId number
-- @param value number
-- @return Augment|nil
function createAugmentFromEnchantment(enchantId, value)
    local info = ENCHANT_TYPES and ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[enchantId]
    if info then
        return createDamageAugment(info, value)
    end
    info = ENCHANT_TYPES and ENCHANT_TYPES.DEFENSIVE and ENCHANT_TYPES.DEFENSIVE[enchantId]
    if info then
        return createProtectionAugment(info, value)
    end
    return nil
end

--- Ensure item has required augments for its offensive/defensive bonuses.
-- @param item Item
function syncItemAugments(item)
    if not item then
        return
    end
    local bonuses = item:getBonusAttributes()
    if not bonuses then
        return
    end

    local existing = {}
    for _, aug in ipairs(item:getAugments() or {}) do
        existing[aug:getName()] = true
    end

    for _, bonus in ipairs(bonuses) do
        local id, val = bonus[1], bonus[2]
        local info = (ENCHANT_TYPES and ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[id]) or
                         (ENCHANT_TYPES and ENCHANT_TYPES.DEFENSIVE and ENCHANT_TYPES.DEFENSIVE[id])
        if info and not existing[info.name] then
            local augment = createAugmentFromEnchantment(id, val)
            if augment then
                item:addAugment(augment)
            end
        end
    end
end

--- Apply an augment for a given enchantment.
-- @param item Item
-- @param enchantId number
-- @param enchantValue number
function applyAugmentForEnchantment(item, enchantId, enchantValue)
    if isCombatEnchantment(enchantId) then
        local augment = createAugmentFromEnchantment(enchantId, enchantValue)
        if augment then
            item:addAugment(augment)
        end
    end
end

--- Remove all augments from an item.
-- @param item Item
function removeAllAugments(item)
    local augments = item:getAugments()
    if augments then
        for _, augment in ipairs(augments) do
            item:removeAugment(augment)
        end
    end
end
