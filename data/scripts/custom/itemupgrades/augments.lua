-- data/scripts/custom/itemupgrades/augments.lua
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
ENCHANT_TYPES = {
    OFFENSIVE = {
        [8] = {
            name = "Physical Damage",
            type = "physical"
        },
        [9] = {
            name = "Energy Damage",
            type = "energy"
        },
        [10] = {
            name = "Earth Damage",
            type = "earth"
        },
        [11] = {
            name = "Fire Damage",
            type = "fire"
        },
        [12] = {
            name = "Ice Damage",
            type = "ice"
        },
        [13] = {
            name = "Holy Damage",
            type = "holy"
        },
        [14] = {
            name = "Death Damage",
            type = "death"
        },
        [15] = {
            name = "Elemental Damage",
            type = "elemental"
        }
    },
    DEFENSIVE = {
        [16] = {
            name = "Physical Protection",
            type = "physical"
        },
        [17] = {
            name = "Energy Protection",
            type = "energy"
        },
        [18] = {
            name = "Earth Protection",
            type = "earth"
        },
        [19] = {
            name = "Fire Protection",
            type = "fire"
        },
        [20] = {
            name = "Ice Protection",
            type = "ice"
        },
        [21] = {
            name = "Holy Protection",
            type = "holy"
        },
        [22] = {
            name = "Death Protection",
            type = "death"
        },
        [23] = {
            name = "Elemental Protection",
            type = "elemental"
        }
    }
}

--- Convert damage type name to combat type ID
-- @param typeName string: The damage type name (e.g., "energy", "fire")
-- @return number: Corresponding combat type constant
function getCombatType(typeName)
    local types = {
        physical = COMBAT_PHYSICALDAMAGE,
        energy = COMBAT_ENERGYDAMAGE,
        earth = COMBAT_EARTHDAMAGE,
        fire = COMBAT_FIREDAMAGE,
        ice = COMBAT_ICEDAMAGE,
        holy = COMBAT_HOLYDAMAGE,
        death = COMBAT_DEATHDAMAGE
    }
    return types[typeName] or COMBAT_NONE
end

--- Check if an enchantment ID corresponds to a combat enchantment
-- @param id number: Enchantment ID
-- @return boolean: True if it's a combat enchantment
function isCombatEnchantment(id)
    return ENCHANT_TYPES.OFFENSIVE[id] or ENCHANT_TYPES.DEFENSIVE[id]
end

--- Create a DamageModifier instance with safe defaults
-- @param stance number: ATTACK_MOD or DEFENSE_MOD
-- @param modType number: Modifier type ID
-- @param value number: Modifier strength
-- @param factor number: PERCENT_MODIFIER or FLAT_MODIFIER
-- @param combatType number: Combat type constant (optional)
-- @return DamageModifier|nil: The created modifier or nil on failure
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

--- Create a generic augment based on stance and modifier type
-- @param info table: Enchantment definition (with `name` and `type`)
-- @param value number: Modifier value
-- @param stance number: ATTACK_MOD or DEFENSE_MOD
-- @param modType number: Modifier type constant
-- @return Augment: The created augment
local function createAugment(info, value, stance, modType)
    local modifiers = {}
    local augmentName = info.name
    -- If type is a multi-type (elemental), loop over all elemental damage types else just return the type as is
    local types = info.type == "elemental" and {"energy", "earth", "fire", "ice", "holy", "death"} or {info.type}

    for _, typeName in ipairs(types) do
        local combatType = getCombatType(typeName)
        local modifier = makeModifier(stance, modType, value, PERCENT_MODIFIER, combatType)
        if modifier then
            table.insert(modifiers, modifier)
        end
    end

    local augment = Augment(augmentName, augmentName .. " +" .. value .. "%", modifiers)
    return augment
end

--- Create a damage-type augment
-- @param info table: Enchantment info
-- @param value number: Modifier percentage
-- @return Augment
function createDamageAugment(info, value)
    return createAugment(info, value, ATTACK_MOD, ATTACK_MODIFIER_PIERCING)
end

--- Create a protection-type augment
-- @param info table: Enchantment info
-- @param value number: Modifier percentage
-- @return Augment
function createProtectionAugment(info, value)
    return createAugment(info, value, DEFENSE_MOD, DEFENSE_MODIFIER_RESIST)
end

--- Create an augment based on enchantment ID
-- @param enchantId number: The enchantment ID
-- @param value number: Modifier strength
-- @return Augment|nil: The created augment or nil if not applicable
function createAugmentFromEnchantment(enchantId, value)
    local info = ENCHANT_TYPES.OFFENSIVE[enchantId]
    if info then
        return createDamageAugment(info, value)
    end
    info = ENCHANT_TYPES.DEFENSIVE[enchantId]
    if info then
        return createProtectionAugment(info, value)
    end
    return nil
end

--- Ensure an item has augments for all its combat enchantments
-- @param item Item: The item to synchronize
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
        local info = ENCHANT_TYPES.OFFENSIVE[id] or ENCHANT_TYPES.DEFENSIVE[id]
        if info and not existing[info.name] then
            local augment = createAugmentFromEnchantment(id, val)
            if augment then
                item:addAugment(augment)
            end
        end
    end
end

--- Apply a new augment based on a single enchantment
-- @param item Item: The item to apply to
-- @param enchantId number: Enchantment ID
-- @param enchantValue number: Enchantment value
function applyAugmentForEnchantment(item, enchantId, enchantValue)
    if isCombatEnchantment(enchantId) then
        local augment = createAugmentFromEnchantment(enchantId, enchantValue)
        if augment then
            item:addAugment(augment)
        end
    end
end

--- Remove all augments from the item
-- @param item Item: The item to clear
function removeAllAugments(item)
    local augments = item:getAugments()
    if augments then
        for _, augment in ipairs(augments) do
            item:removeAugment(augment)
        end
    end
end
