-- Orchestrates attribute upgrades triggered via upgrade crystals
-- Coordinates the application of attribute bonuses and upgrades
dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/magicLevelBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/meleeLevelBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/weaponAttackBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/weaponDefenseBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/extraDefenseBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/hitChanceBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/armorBonus.lua')

-- AttributeManager module
local AttributeManager = {}

--- Handles the Upgrade Crystal (+1 upgrade level attempts).
-- @param player Player Player using the crystal
-- @param crystal Item Upgrade crystal
-- @param target Item Target item
-- @return boolean Success
function AttributeManager.handleUpgrade(player, crystal, target)
    local it = ItemType(target.itemid)
    if not it:isUpgradable() then
        return false
    end

    -- Initialize the item level if it doesn't have one yet
    if target:getItemLevel() == 0 then
        local baseLevel = target:getMinReqLevel()
        target:setItemLevel(baseLevel, true)
    end

    local upg = target:getUpgradeLevel()
    if upg >= US_CONFIG.MAX_UPGRADE_LEVEL then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Maximum upgrade level reached!")
        return false
    end

    local newLevel = upg + 1

    -- Check for potential failure and destruction
    if newLevel >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
        if math.random(100) > US_CONFIG.UPGRADE_DESTROY_CHANCE[newLevel] then
            if player:getItemCount(US_CONFIG.ITEM_UPGRADE_CATALYST) > 0 then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Upgrade failed! The catalyst protected your item.")
                player:removeItem(US_CONFIG.ITEM_UPGRADE_CATALYST, 1)
                crystal:remove(1)
                player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
                return true
            end
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Item destroyed.")
            target:remove(1)
            crystal:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    else
        if math.random(100) > US_CONFIG.UPGRADE_SUCCESS_CHANCE[newLevel] then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Upgrade level -1.")

            -- Handle magic level reduction on failure
            local MagicLevelBonus = dofile('data/scripts/custom/itemupgrades/modules/bonus/magicLevelBonus.lua')
            local eligible, mlPerUpgrade = MagicLevelBonus.shouldGetMagicLevelBonus(target)

            if eligible and mlPerUpgrade > 0 then
                MagicLevelBonus.decreaseBonus(target, mlPerUpgrade)

                -- If player is wearing the item, update the applied bonus immediately
                if player:getSlotItem(target:getPosition().y) == target then
                    MagicLevelBonus.applyCondition(player, target)
                end
            end

            target:reduceUpgradeLevel()
            crystal:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    end

    -- Apply the upgrade
    target:setUpgradeLevel(newLevel)

    -- Handle special magic level bonus for wands and spellbooks
    local MagicLevelBonus = dofile('data/scripts/custom/itemupgrades/modules/bonus/magicLevelBonus.lua')
    local eligible, mlPerUpgrade = MagicLevelBonus.shouldGetMagicLevelBonus(target)

    if eligible and mlPerUpgrade > 0 then
        MagicLevelBonus.increaseBonus(target, mlPerUpgrade)

        -- If player is wearing the item, apply the bonus immediately
        if player:getSlotItem(target:getPosition().y) == target then
            MagicLevelBonus.applyCondition(player, target)
        end
    end

    crystal:remove(1)

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item upgrade level is now +" .. newLevel .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
    return true
end

--- Apply all item effects when a player equips an item.
-- @param player Player Player equipping the item
-- @param item Item Item being equipped
-- @param slot number Equipment slot
function AttributeManager.applyItemEffects(player, item, slot)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    AttributeService.applyItemEffects(player:getId(), item:getUniqueId(), slot)
end

--- Apply all magic level bonuses for a player.
-- @param player Player Player to apply bonuses to
function AttributeManager.applyMagicLevelBonuses(player)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    AttributeService.applyMagicLevelBonuses(player)
end

--- Remove all condition effects from an item on unequip.
-- @param player Player Player unequipping the item
-- @param item Item Item being unequipped
function AttributeManager.removeItemConditions(player, item)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    AttributeService.removeItemConditions(player, item)
end

--- Calculate modified damage when a creature is damaged.
-- @param creature Creature Creature being damaged
-- @param attacker Creature Attacking creature
-- @param primaryDamage number Primary damage
-- @param primaryType number Primary damage type
-- @param secondaryDamage number Secondary damage
-- @param secondaryType number Secondary damage type
-- @param origin number Origin type
-- @return number, number, number, number Modified damage values
function AttributeManager.calculateDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage,
    secondaryType, origin)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    return AttributeService.calculateDamage(creature, attacker, primaryDamage, primaryType, secondaryDamage,
        secondaryType, origin)
end

--- Process kill triggers when a player kills a creature.
-- @param player Player Player who made the kill
-- @param center Position Position where the kill occurred
-- @param target Creature Killed creature
function AttributeManager.processKillTriggers(player, center, target)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    AttributeService.processKillTriggers(player, center, target)
end

--- Check if a creature should be revived on death.
-- @param creature Creature Creature about to die
-- @return boolean True if the creature should be revived
function AttributeManager.checkReviveOnDeath(creature)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    return AttributeService.checkReviveOnDeath(creature)
end

--- Calculate modified experience gain.
-- @param player Player Player gaining experience
-- @param exp number Base experience amount
-- @return number Modified experience amount
function AttributeManager.calculateModifiedExperience(player, exp)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    return AttributeService.calculateModifiedExperience(player, exp)
end

--- Enhance the description of an item or creature.
-- @param player Player Player looking at the thing
-- @param thing Thing Thing being examined
-- @param description string Original description
-- @return string Enhanced description
function AttributeManager.enhanceItemDescription(player, thing, description)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    return AttributeService.enhanceItemDescription(player, thing, description)
end

--- Handle item movement validation and logic.
-- @param player Player Player moving the item
-- @param item Item Item being moved
-- @param fromPosition Position Source position
-- @param toPosition Position Destination position
-- @return boolean True if movement is allowed
function AttributeManager.handleItemMove(player, item, fromPosition, toPosition)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    return AttributeService.handleItemMove(player, item, fromPosition, toPosition)
end

--- Handle post-move item logic.
-- @param player Player Player who moved the item
-- @param item Item Item that was moved
-- @param fromPosition Position Source position
-- @param toPosition Position Destination position
function AttributeManager.handleItemMoved(player, item, fromPosition, toPosition)
    local AttributeService = dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
    AttributeService.handleItemMoved(player, item, fromPosition, toPosition)
end

-- Export the module
return AttributeManager
