-- Event registrations (login, item move, etc.)
-- Handles all TFS events for the item upgrade system
dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
dofile('data/scripts/custom/itemupgrades/managers/EnchantmentManager.lua')

-- Login Event
local LoginEvent = CreatureEvent("UpgradeSystemLogin")

--- Called when a player logs in.
-- @param player Player Player logging in
-- @return boolean Success
function LoginEvent.onLogin(player)
    player:registerEvent("UpgradeSystemKill")
    player:registerEvent("UpgradeSystemHealth")
    player:registerEvent("UpgradeSystemMana")
    player:registerEvent("UpgradeSystemPD")

    local maxHP = player:getMaxHealth()
    local maxMP = player:getMaxMana()

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local it = player:getSlotItem(slot)
        if it then
            local newBonuses = it:getBonusAttributes()
            if newBonuses then
                for i = 1, #newBonuses do
                    local bId = newBonuses[i][1]
                    local bVal = newBonuses[i][2]
                    local attr = US_ENCHANTMENTS[bId]
                    if attr and attr.combatType == US_TYPES.CONDITION then
                        local Enchantment = dofile('data/scripts/custom/itemupgrades/domain/Enchantment.lua')
                        Enchantment.applyConditionBonus(player, it, bId, bVal, attr, slot, i, maxHP, maxMP)
                    end
                end

                local Augments = dofile('data/scripts/custom/itemupgrades/modules/augments.lua')
                Augments.syncItemAugments(it)
            end
        end
    end

    local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
    AttributeManager.applyMagicLevelBonuses(player)
    return true
end
LoginEvent:type("login")
LoginEvent:register()

-- Health Change Event
local HealthChangeEvent = CreatureEvent("UpgradeSystemHealth")

--- Called when a creature's health changes.
-- @param creature Creature Creature whose health changed
-- @param attacker Creature Attacker
-- @param primaryDamage number Primary damage
-- @param primaryType number Primary damage type
-- @param secondaryDamage number Secondary damage
-- @param secondaryType number Secondary damage type
-- @param origin number Origin type
function HealthChangeEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage,
    secondaryType, origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if isInSameParty(creature, attacker) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if creature == attacker and primaryType ~= COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if origin == ORIGIN_CONDITION then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
    return AttributeManager.calculateDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage,
        secondaryType, origin)
end
HealthChangeEvent:type("healthchange")
HealthChangeEvent:register()

-- Mana Change Event
local ManaChangeEvent = CreatureEvent("UpgradeSystemMana")

--- Called when a creature's mana changes.
-- @param creature Creature Creature whose mana changed
-- @param attacker Creature Attacker
-- @param primaryDamage number Primary damage
-- @param primaryType number Primary damage type
-- @param secondaryDamage number Secondary damage
-- @param secondaryType number Secondary damage type
-- @param origin number Origin type
function ManaChangeEvent.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType,
    origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if isInSameParty(creature, attacker) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if (primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN or primaryType == COMBAT_MANADRAIN or
        secondaryType == COMBAT_MANADRAIN) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if creature == attacker and primaryType ~= COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    if origin == ORIGIN_CONDITION then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
    return AttributeManager.calculateDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage,
        secondaryType, origin)
end
ManaChangeEvent:type("manachange")
ManaChangeEvent:register()

-- Death Event
local DeathEvent = CreatureEvent("UpgradeSystemDeath")

--- Called on creature's death.
-- @param creature Creature Creature that died
-- @param corpse Item Corpse
-- @param lasthitkiller Creature Last hit killer
-- @param mostdamagekiller Creature Most damage killer
-- @param lasthitunjustified boolean Last hit unjustified
-- @param mostdamageunjustified boolean Most damage unjustified
-- @return boolean Success
function DeathEvent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    -- Currently no special logic
    return true
end
DeathEvent:type("death")
DeathEvent:register()

-- Kill Event
local KillEvent = CreatureEvent("UpgradeSystemKill")

--- Called when a player kills a creature.
-- @param player Player Player who killed
-- @param target Creature Target that was killed
-- @param lastHit boolean Last hit
function KillEvent.onKill(player, target, lastHit)
    if player and player:isPlayer() and target and target:isMonster() then
        local center = target:getPosition()
        local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
        AttributeManager.processKillTriggers(player, center, target)
    end
end
KillEvent:type("kill")
KillEvent:register()

-- Prepare Death Event
local PrepareDeathEvent = CreatureEvent("UpgradeSystemPD")

--- Called when a player is about to die (preparedeath).
-- @param creature Creature Creature about to die
-- @param killer Creature Killer
-- @return boolean True to allow death, false to prevent
function PrepareDeathEvent.onPrepareDeath(creature, killer)
    if creature:isPlayer() then
        local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
        if AttributeManager.checkReviveOnDeath(creature) then
            return false
        end
    end
    return true
end
PrepareDeathEvent:type("preparedeath")
PrepareDeathEvent:register()

-- Logout Event
local LogoutEvent = CreatureEvent("MagicLevelLogout")

--- Called when a player logs out.
-- @param player Player Player logging out
-- @return boolean Success
function LogoutEvent.onLogout(player)
    local MagicLevelBonus = dofile('data/scripts/custom/itemupgrades/modules/bonus/magicLevelBonus.lua')
    MagicLevelBonus.cleanupOnLogout(player:getId())
    return true
end
LogoutEvent:type("logout")
LogoutEvent:register()

-- Gain Experience Event
local GainExperienceEvent = EventCallback

--- Called when a player gains experience.
-- @param player Player Player gaining experience
-- @param source Creature|Item Source of experience
-- @param exp number Experience amount
-- @param rawExp number Raw experience amount
function GainExperienceEvent.onGainExperience(player, source, exp, rawExp)
    local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
    return AttributeManager.calculateModifiedExperience(player, exp)
end
GainExperienceEvent:register()

-- Move Item Event
local MoveItemEvent = EventCallback

--- Called when an item is about to be moved.
-- @param player Player Player moving the item
-- @param item Item Item being moved
-- @param count number Count
-- @param fromPosition Position From position
-- @param toPosition Position To position
-- @param fromCylinder Cylinder From cylinder
-- @param toCylinder Cylinder To cylinder
-- @return boolean True if allowed
function MoveItemEvent.onMoveItem(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
    return AttributeManager.handleItemMove(player, item, fromPosition, toPosition)
end
MoveItemEvent:register()

-- Item Moved Event
local ItemMovedEvent = EventCallback

--- Called after an item move completes.
-- @param player Player Player who moved the item
-- @param item Item Item that was moved
-- @param count number Count
-- @param fromPosition Position From position
-- @param toPosition Position To position
-- @param fromCylinder Cylinder From cylinder
-- @param toCylinder Cylinder To cylinder
function ItemMovedEvent.onItemMoved(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    if isEquipPosition(toPosition) then
        local ml = item:getCustomAttribute("bonus_magiclevel")
        if ml and ml > 0 then
            addEvent(function()
                local p = Player(player:getId())
                if p then
                    local c = Condition(CONDITION_ATTRIBUTES)
                    c:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, ml)
                    c:setParameter(CONDITION_PARAM_TICKS, -1)
                    c:setParameter(CONDITION_PARAM_SUBID, 70000 + p:getId() % 1000)
                    c:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
                    p:addCondition(c)
                end
            end, 100)
        end
    end

    local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
    AttributeManager.handleItemMoved(player, item, fromPosition, toPosition)
end
ItemMovedEvent:register()

-- Look Event
local LookEvent = EventCallback

--- Called when a player looks at an item/creature.
-- @param player Player Player looking
-- @param thing Thing Thing being looked at
-- @param position Position Position
-- @param distance number Distance
-- @param description string Description
function LookEvent.onLook(player, thing, position, distance, description)
    -- Enhance the description with custom item attributes
    if thing:isItem() then
        if thing.itemid == US_CONFIG.ITEM_MIND_CRYSTAL and thing:hasMemory() then
            local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
            local enhancedDesc = AttributeService.enhanceMindCrystalDescription(thing, description)
            return enhancedDesc
        elseif thing:getType():isUpgradable() then
            local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')

            -- First, enhance the item name with rarity, upgrade level, etc.
            local nameDesc = AttributeService.enhanceItemName(thing, description)

            -- Then, add attributes section
            local attributesSection = AttributeService.buildAttributesSection(thing)

            -- Add enchantments section if needed
            local enchantmentsSection = AttributeService.buildEnchantmentsSection(thing)

            -- Add sections to description if not already present
            if not nameDesc:find("%[ Attributes %]") and attributesSection then
                nameDesc = nameDesc .. "\n\n" .. attributesSection
            end

            if not nameDesc:find("%[ Enchantments %]") and enchantmentsSection then
                nameDesc = nameDesc .. "\n\n" .. enchantmentsSection
            end

            -- Add mirrored status if applicable
            if thing:isMirrored() and not nameDesc:find("Mirrored") then
                nameDesc = nameDesc .. "\nMirrored"
            end

            -- Fix formatting and level requirements
            nameDesc = AttributeService.overrideRequiredLevelText(nameDesc, thing)
            nameDesc = nameDesc:gsub("([^%s])%(", "%1 (")

            return nameDesc
        elseif thing:getType():canHaveItemLevel() then
            local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
            local enhancedDesc = AttributeService.enhanceItemLevelDescription(thing, description, distance)
            return enhancedDesc
        end
    elseif thing:isPlayer() then
        local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
        local enhancedDesc = AttributeService.enhancePlayerDescription(player, thing, description)
        return enhancedDesc
    end

    return description
end
LookEvent:register(10)
