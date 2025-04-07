-- data/scripts/custom/itemupgrades/events.lua
local LoginEvent = CreatureEvent("UpgradeSystemLogin")
local HealthChangeEvent = CreatureEvent("UpgradeSystemHealth")
local ManaChangeEvent = CreatureEvent("UpgradeSystemMana")
local DeathEvent = CreatureEvent("UpgradeSystemDeath")
local KillEvent = CreatureEvent("UpgradeSystemKill")
local PrepareDeathEvent = CreatureEvent("UpgradeSystemPD")
local LogoutEvent = CreatureEvent("MagicLevelLogout")
local GainExperienceEvent = EventCallback
local MoveItemEvent = EventCallback
local ItemMovedEvent = EventCallback
local LookEvent = EventCallback

--- Called when a player logs in.
-- @param player Player
-- @return boolean
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
                        applyConditionBonus(player, it, bId, bVal, attr, slot, i, maxHP, maxMP)
                    end
                end
                syncItemAugments(it)
            end
        end
    end
    applyMagicLevelBonuses(player)
    return true
end
LoginEvent:type("login")
LoginEvent:register()

--- Called when a creature's health changes.
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @param origin number
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
    return us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end
HealthChangeEvent:type("healthchange")
HealthChangeEvent:register()

--- Called when a creature's mana changes.
-- @param creature Creature
-- @param attacker Creature
-- @param primaryDamage number
-- @param primaryType number
-- @param secondaryDamage number
-- @param secondaryType number
-- @param origin number
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
    return us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
end
ManaChangeEvent:type("manachange")
ManaChangeEvent:register()

--- Called on creature's death.
-- @param creature Creature
-- @param corpse Item
-- @param lasthitkiller Creature
-- @param mostdamagekiller Creature
-- @return boolean
function DeathEvent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    -- Currently no special logic
    return true
end
DeathEvent:type("death")
DeathEvent:register()

--- Called when a player kills a creature.
-- @param player Player
-- @param target Creature
-- @param lastHit bool
function KillEvent.onKill(player, target, lastHit)
    if player and player:isPlayer() and target and target:isMonster() then
        local center = target:getPosition()
        processKillTriggers(player, center, target)
    end
end
KillEvent:type("kill")
KillEvent:register()

--- Called when a player is about to die (preparedeath).
-- @param creature Creature
-- @param killer Creature
-- @return boolean
function PrepareDeathEvent.onPrepareDeath(creature, killer)
    if creature:isPlayer() then
        if checkReviveOnDeath(creature) then
            return false
        end
    end
    return true
end
PrepareDeathEvent:type("preparedeath")
PrepareDeathEvent:register()

--- Called when a player gains experience.
-- @param player Player
-- @param source Creature|Item
-- @param exp number
-- @param rawExp number
function GainExperienceEvent.onGainExperience(player, source, exp, rawExp)
    return calculateModifiedExperience(player, exp)
end
GainExperienceEvent:register()

--- Called when an item is about to be moved.
-- @param player Player
-- @param item Item
-- @param count number
-- @param fromPosition Position
-- @param toPosition Position
-- @param fromCylinder Cylinder
-- @param toCylinder Cylinder
-- @return boolean
function MoveItemEvent.onMoveItem(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    return handleItemMove(player, item, fromPosition, toPosition)
end
MoveItemEvent:register()

--- Called after an item move completes.
-- @param player Player
-- @param item Item
-- @param count number
-- @param fromPosition Position
-- @param toPosition Position
-- @param fromCylinder Cylinder
-- @param toCylinder Cylinder
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
    handleItemMoved(player, item, fromPosition, toPosition)
end
ItemMovedEvent:register()

--- Called when a player looks at an item/creature.
-- @param player Player
-- @param thing Thing
-- @param position Position
-- @param distance number
-- @param description string
function LookEvent.onLook(player, thing, position, distance, description)
    return enhanceItemDescription(player, thing, description)
end
LookEvent:register(10)

--- Called when a player logs out.
-- @param player Player
-- @return boolean
function LogoutEvent.onLogout(player)
    MAGICLEVEL.cleanupOnLogout(player:getId())
    return true
end
LogoutEvent:type("logout")
LogoutEvent:register()
