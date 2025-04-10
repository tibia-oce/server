-- Logic for creating/handling augments (enchantments)
-- Provides functionality for damage/protection augments
-- Augments module
local Augments = {}

--- Convert a string-based damage type to its constant.
-- @param typeName string Damage type name
-- @return number Combat type constant
function Augments.getCombatType(typeName)
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
-- @param id number Enchantment ID
-- @return boolean True if combat enchantment
function Augments.isCombatEnchantment(id)
    return ENCHANT_TYPES and
               (ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[id] or ENCHANT_TYPES.DEFENSIVE and
                   ENCHANT_TYPES.DEFENSIVE[id])
end

--- Create a DamageModifier instance.
-- @param stance number Stance type
-- @param modType number Modifier type
-- @param value number Value
-- @param factor number Factor
-- @param combatType number Combat type
-- @return DamageModifier|nil Damage modifier
function Augments.makeModifier(stance, modType, value, factor, combatType)
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
-- @param info table Enchantment info
-- @param value number Value
-- @param stance number Stance type
-- @param modType number Modifier type
-- @return Augment Created augment
function Augments.createAugment(info, value, stance, modType)
    local modifiers = {}
    local augmentName = info.name
    local types = (info.type == "elemental") and {"energy", "earth", "fire", "ice", "holy", "death"} or {info.type}

    for _, typeName in ipairs(types) do
        local combatType = Augments.getCombatType(typeName)
        local modifier = Augments.makeModifier(stance, modType, value, PERCENT_MODIFIER, combatType)
        if modifier then
            table.insert(modifiers, modifier)
        end
    end
    return Augment(augmentName, augmentName .. " +" .. value .. "%", modifiers)
end

--- Create a damage-type augment.
-- @param info table Enchantment info
-- @param value number Value
-- @return Augment Created damage augment
function Augments.createDamageAugment(info, value)
    return Augments.createAugment(info, value, ATTACK_MOD, ATTACK_MODIFIER_PIERCING)
end

--- Create a protection-type augment.
-- @param info table Enchantment info
-- @param value number Value
-- @return Augment Created protection augment
function Augments.createProtectionAugment(info, value)
    return Augments.createAugment(info, value, DEFENSE_MOD, DEFENSE_MODIFIER_RESIST)
end

--- Create an Augment by ID.
-- @param enchantId number Enchantment ID
-- @param value number Value
-- @return Augment|nil Created augment
function Augments.createAugmentFromEnchantment(enchantId, value)
    local info = ENCHANT_TYPES and ENCHANT_TYPES.OFFENSIVE and ENCHANT_TYPES.OFFENSIVE[enchantId]
    if info then
        return Augments.createDamageAugment(info, value)
    end
    info = ENCHANT_TYPES and ENCHANT_TYPES.DEFENSIVE and ENCHANT_TYPES.DEFENSIVE[enchantId]
    if info then
        return Augments.createProtectionAugment(info, value)
    end
    return nil
end

--- Ensure item has required augments for its offensive/defensive bonuses.
-- @param item Item Item to synchronize
function Augments.syncItemAugments(item)
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
            local augment = Augments.createAugmentFromEnchantment(id, val)
            if augment then
                item:addAugment(augment)
            end
        end
    end
end

--- Apply an augment for a given enchantment.
-- @param item Item Item to apply augment to
-- @param enchantId number Enchantment ID
-- @param enchantValue number Enchantment value
function Augments.applyAugmentForEnchantment(item, enchantId, enchantValue)
    if Augments.isCombatEnchantment(enchantId) then
        local augment = Augments.createAugmentFromEnchantment(enchantId, enchantValue)
        if augment then
            item:addAugment(augment)
        end
    end
end

--- Remove all augments from an item.
-- @param item Item Item to remove augments from
function Augments.removeAllAugments(item)
    local augments = item:getAugments()
    if augments then
        for _, augment in ipairs(augments) do
            item:removeAugment(augment)
        end
    end
end

--- Create description string for an enchantment
-- @param enchantId number Enchantment ID
-- @param value number Enchantment value
-- @return string Formatted description
function Augments.getDescription(enchantId, value)
    local enchant = US_ENCHANTMENTS[enchantId]
    if enchant and enchant.format then
        return enchant.format(value)
    end
    return "Unknown enchantment"
end

return Augments
