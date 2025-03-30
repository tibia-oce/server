-- data\scripts\custom\itemupgrades\core.lua
print(">> Loading upgrade system")

-- Global storage tables
US_CONDITIONS = {}
US_BUFFS = {}
local US_SUBID = {}

--- Checks if two creatures are in the same party
-- @param creature1 Creature: First creature to check
-- @param creature2 Creature: Second creature to check
-- @return boolean: True if both creatures are in the same party
function isInSameParty(creature1, creature2)
    if creature1:isPlayer() and creature1:getParty() and creature2:isPlayer() and creature2:getParty() then
        return creature1:getParty() == creature2:getParty()
    end
    return false
end

--- Process kill triggers for a player when killing a monster
-- @param player Player: The player who killed the monster
-- @param center Position: Position of the killed monster
-- @param target Creature: The killed monster
function processKillTriggers(player, center, target)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr and attr.triggerType == US_TRIGGERS.KILL then
                        attr.execute(player, value[2], center, target)
                    end
                end
            end
        end
    end
end

--- Check if player should be revived on death
-- @param creature Creature: The creature that is about to die
-- @return boolean: True if the player should be revived
function checkReviveOnDeath(creature)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = creature:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr and attr.name == "Revive on death" then
                        if math.random(100) < value[2] then
                            creature:addHealth(creature:getMaxHealth())
                            creature:addMana(creature:getMaxMana())
                            creature:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
                            creature:sendTextMessage(MESSAGE_INFO_DESCR, "You have been revived!")
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

--- Calculate modified experience based on player's equipment
-- @param player Player: The player gaining experience
-- @param exp number: The base experience amount
-- @return number: The modified experience amount
function calculateModifiedExperience(player, exp)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr and attr.name == "Experience" then
                        exp = exp + math.ceil(exp * value[2] / 100)
                    end
                end
            end
        end
    end
    return exp
end

--- Handle item movement validation and effects
-- @param player Player: The player moving the item
-- @param item Item: The item being moved
-- @param fromPosition Position: The original position
-- @param toPosition Position: The target position
-- @return boolean: True if the move is allowed
function handleItemMove(player, item, fromPosition, toPosition)
    if not item:getType():isUpgradable() and not item:getType():canHaveItemLevel() or toPosition.y == CONST_SLOT_AMMO then
        return true
    end

    if not item:getType():usesSlot(toPosition.y) then
        return true
    end

    -- Check level requirement
    if US_CONFIG.REQUIRE_LEVEL == true and isEquipPosition(toPosition) then
        if player:getLevel() < item:getItemLevel() and not item:isLimitless() then
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "You need higher level to equip that item.")
            return false
        end
    end

    -- Handle equipping effects
    if isEquipPosition(toPosition) and (fromPosition.y >= 64 or fromPosition.x ~= CONTAINER_POSITION) then
        -- Remove old item effects
        local oldItem = player:getSlotItem(toPosition.y)
        if oldItem and oldItem:getType():isUpgradable() then
            removeItemConditions(player, oldItem)
        end

        -- Apply new item effects
        if item:getType():isUpgradable() then
            local newBonuses = item:getBonusAttributes()
            if newBonuses then
                addEvent(us_onEquip, 10, player:getId(), item:getUniqueId(), toPosition.y)
            end
        end
    end

    return true
end

--- Check if a position is an equipment position
-- @param position Position: The position to check
-- @return boolean: True if the position is an equipment slot
function isEquipPosition(position)
    return position.y <= CONST_SLOT_AMMO and position.y ~= CONST_SLOT_BACKPACK
end

--- Handle when an item is moved (after the move is completed)
-- @param player Player: The player who moved the item
-- @param item Item: The item that was moved
-- @param fromPosition Position: The original position
-- @param toPosition Position: The target position
function handleItemMoved(player, item, fromPosition, toPosition)
    if not item:getType():isUpgradable() then
        return
    end

    if isEquipPosition(toPosition) then
        return
    end

    if fromPosition.y >= 64 and toPosition.y >= 64 then
        return
    end

    if fromPosition.y >= 64 and toPosition.y == CONST_SLOT_BACKPACK then
        return
    end

    removeItemConditions(player, item)
end

--- Remove all conditions applied by an item's bonuses
-- @param player Player: The player wearing the item
-- @param item Item: The item being unequipped
function removeItemConditions(player, item)
    local bonuses = item:getBonusAttributes()
    if bonuses then
        local itemId = item:getId()
        for i = 1, #bonuses do
            local value = bonuses[i]
            local bonusId = value[1]
            local bonusValue = value[2]
            local attr = US_ENCHANTMENTS[bonusId]
            if attr and attr.combatType == US_TYPES.CONDITION then
                if US_CONDITIONS[bonusId] and US_CONDITIONS[bonusId][bonusValue] and
                    US_CONDITIONS[bonusId][bonusValue][itemId] then
                    if US_CONDITIONS[bonusId][bonusValue][itemId]:getType() ~= CONDITION_MANASHIELD then
                        player:removeCondition(US_CONDITIONS[bonusId][bonusValue][itemId]:getType(), CONDITIONID_COMBAT,
                            US_CONDITIONS[bonusId][bonusValue][itemId]:getSubId())
                    else
                        player:removeCondition(US_CONDITIONS[bonusId][bonusValue][itemId]:getType(), CONDITIONID_COMBAT)
                    end
                end
            end
        end
    end
end

--- Process a corpse after a monster is killed
-- @param monsterType MonsterType: The type of monster killed
-- @param corpsePosition Position: The position of the corpse
-- @param killerId number: The ID of the killer
function us_CheckCorpse(monsterType, corpsePosition, killerId)
    local killer = Player(killerId)
    local corpse = Tile(corpsePosition):getTopDownItem()

    if not killer or not killer:isPlayer() or not corpse or not corpse:isContainer() then
        return
    end

    processAdditionalGold(killer, corpse)
    processCrystalFossilDrop(monsterType, corpse, corpsePosition)
end

--- Process additional gold from bonuses
-- @param killer Player: The player who killed the monster
-- @param corpse Container: The corpse container
function processAdditionalGold(killer, corpse)
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = killer:getSlotItem(slot)
        if item then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr and attr.name == "Additonal Gold" then
                        -- Calculate total gold in corpse
                        local cc, plat, gold = 0, 0, 0
                        for i = 0, corpse:getSize() do
                            local item = corpse:getItem(i)
                            if item then
                                if item.itemid == 2160 then
                                    gold = gold + (item:getCount() * 10000)
                                elseif item.itemid == 2152 then
                                    gold = gold + (item:getCount() * 100)
                                elseif item.itemid == 2148 then
                                    gold = gold + item:getCount()
                                end
                            end
                        end

                        -- Add bonus gold
                        gold = math.floor(gold * value[2] / 100)

                        -- Convert to appropriate coin types
                        while gold >= 10000 do
                            gold = gold / 10000
                            cc = cc + 1
                        end

                        if cc > 0 then
                            local crystalCoin = Game.createItem(2160, cc)
                            corpse:addItemEx(crystalCoin)
                        end

                        while gold >= 100 do
                            gold = gold / 100
                            plat = plat + 1
                        end

                        if plat > 0 then
                            local platinumCoin = Game.createItem(2152, plat)
                            corpse:addItemEx(platinumCoin)
                        end

                        if gold > 0 then
                            local goldCoin = Game.createItem(2148, gold)
                            corpse:addItemEx(goldCoin)
                        end
                    end
                end
            end
        end
    end
end

--- Process crystal fossil drops
-- @param monsterType MonsterType: The type of monster killed
-- @param corpse Container: The corpse container
-- @param corpsePosition Position: The position of the corpse
function processCrystalFossilDrop(monsterType, corpse, corpsePosition)
    local iLvl = monsterType:calculateItemLevel()
    if iLvl >= US_CONFIG.CRYSTAL_FOSSIL_DROP_LEVEL then
        if math.random(US_CONFIG.CRYSTAL_FOSSIL_DROP_CHANCE) == 1 then
            corpse:addItem(US_CONFIG.CRYSTAL_FOSSIL, 1)
            local specs = Game.getSpectators(corpsePosition, false, true, 9, 9, 8, 8)
            if #specs > 0 then
                for i = 1, #specs do
                    local player = specs[i]
                    player:say("Crystal Fossil!", TALKTYPE_MONSTER_SAY, false, player, corpsePosition)
                end
            end
        end
    end
end

--- Handle damage modifications from bonuses
-- @param creature Creature: The creature being damaged
-- @param attacker Creature: The creature dealing damage
-- @param primaryDamage number: Primary damage amount
-- @param primaryType number: Primary damage type
-- @param secondaryDamage number: Secondary damage amount
-- @param secondaryType number: Secondary damage type
-- @param origin number: Origin of the damage
-- @return number, number, number, number: Modified damage values
function us_onDamaged(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
        return processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    end

    if attacker:isPlayer() then
        local modifiedDamage = processAttackerModifiers(attacker, creature, primaryDamage, primaryType, secondaryDamage,
            secondaryType)
        primaryDamage = modifiedDamage.primaryDamage
        secondaryDamage = modifiedDamage.secondaryDamage
    end

    if creature:isPlayer() then
        local modifiedDamage = processDefenderModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage,
            secondaryType)
        primaryDamage = modifiedDamage.primaryDamage
        secondaryDamage = modifiedDamage.secondaryDamage
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Process healing modifiers from bonuses
-- @param creature Creature: The creature being healed
-- @param attacker Creature: The creature doing the healing
-- @param primaryDamage number: Primary healing amount
-- @param primaryType number: Primary damage type
-- @param secondaryDamage number: Secondary healing amount
-- @param secondaryType number: Secondary damage type
-- @return number, number, number, number: Modified healing values
function processHealingModifiers(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    -- Process attacker healing bonuses
    if attacker:isPlayer() then
        local primaryTotal = 0
        local secondaryTotal = 0

        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local item = attacker:getSlotItem(slot)
            if item and item:getType():usesSlot(slot) then
                local values = item:getBonusAttributes()
                if values then
                    for key, value in pairs(values) do
                        local attr = US_ENCHANTMENTS[value[1]]
                        if attr and attr.name == "Increased Healing" then
                            if primaryType == COMBAT_HEALING then
                                primaryTotal = primaryTotal + value[2]
                            end
                            if secondaryType == COMBAT_HEALING then
                                secondaryTotal = secondaryTotal + value[2]
                            end
                        end
                    end
                end
            end
        end

        if primaryType == COMBAT_HEALING and primaryTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primaryTotal / 100))
        end
        if secondaryType == COMBAT_HEALING and secondaryTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secondaryTotal / 100))
        end
    end

    -- Process target healing bonuses
    if creature:isPlayer() then
        local primaryTotal = 0
        local secondaryTotal = 0

        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local item = creature:getSlotItem(slot)
            if item and item:getType():usesSlot(slot) then
                local values = item:getBonusAttributes()
                if values then
                    for key, value in pairs(values) do
                        local attr = US_ENCHANTMENTS[value[1]]
                        if attr and attr.name == "Increased Healing" then
                            if primaryDamage > 0 then
                                primaryTotal = primaryTotal + value[2]
                            end
                            if secondaryDamage > 0 then
                                secondaryTotal = secondaryTotal + value[2]
                            end
                        end
                    end
                end
            end
        end

        if primaryTotal > 0 then
            primaryDamage = math.floor(primaryDamage + (primaryDamage * primaryTotal / 100))
        end
        if secondaryTotal > 0 then
            secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secondaryTotal / 100))
        end
    end

    return primaryDamage, primaryType, secondaryDamage, secondaryType
end

--- Process attacker damage modifiers from bonuses
-- @param attacker Creature: The creature dealing damage
-- @param target Creature: The creature being damaged
-- @param primaryDamage number: Primary damage amount
-- @param primaryType number: Primary damage type
-- @param secondaryDamage number: Secondary damage amount
-- @param secondaryType number: Secondary damage type
-- @return table: Table with modified damage values
function processAttackerModifiers(attacker, target, primaryDamage, primaryType, secondaryDamage, secondaryType)
    -- Apply damage buffs
    local pid = attacker:getId()
    if US_BUFFS[pid] and US_BUFFS[pid][1] then
        if primaryDamage ~= 0 then
            primaryDamage = primaryDamage + (primaryDamage * US_BUFFS[pid][1].value / 100)
        end
        if secondaryDamage ~= 0 then
            secondaryDamage = secondaryDamage + (secondaryDamage * US_BUFFS[pid][1].value / 100)
        end
    end

    -- Process equipment bonuses
    local doubleDamageTotal = 0
    local primaryDamageTotal = 0
    local secondaryDamageTotal = 0
    local lifeStealTotal = 0
    local manaStealTotal = 0

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = attacker:getSlotItem(slot)
        if item and item:getType():usesSlot(slot) then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr and attr.combatType and attr.combatType ~= US_TYPES.CONDITION then
                        if attr.combatType == US_TYPES.TRIGGER then
                            if attr.triggerType == US_TRIGGERS.ATTACK then
                                attr.execute(attacker, target, value[2])
                            end
                        elseif attr.name == "Double Damage" then
                            doubleDamageTotal = doubleDamageTotal + value[2]
                        else
                            if attr.combatDamage then
                                if (attr.combatDamage % (primaryType + primaryType) >= primaryType) and attr.combatType ==
                                    US_TYPES.OFFENSIVE then
                                    primaryDamageTotal = primaryDamageTotal + value[2]
                                end
                                if (attr.combatDamage % (secondaryType + secondaryType) >= secondaryType) and
                                    attr.combatType == US_TYPES.OFFENSIVE then
                                    secondaryDamageTotal = secondaryDamageTotal + value[2]
                                end
                            end

                            if attr.name == "Life Steal" then
                                lifeStealTotal = lifeStealTotal + value[2]
                            elseif attr.name == "Mana Steal" then
                                manaStealTotal = manaStealTotal + value[2]
                            end
                        end
                    end
                end
            end
        end
    end

    -- Apply double damage chance
    if doubleDamageTotal > 0 and math.random(100) < doubleDamageTotal then
        primaryDamage = primaryDamage * 2
        secondaryDamage = secondaryDamage * 2
    end

    -- Apply damage bonuses
    if primaryDamageTotal > 0 then
        primaryDamage = math.floor(primaryDamage + (primaryDamage * primaryDamageTotal / 100))
    end
    if secondaryDamageTotal > 0 then
        secondaryDamage = math.floor(secondaryDamage + (secondaryDamage * secondaryDamageTotal / 100))
    end

    -- Apply life/mana steal
    local damage = math.abs(primaryDamage + secondaryDamage)
    if lifeStealTotal > 0 then
        local lifeSteal = math.floor((damage * (lifeStealTotal / 100)))
        if lifeSteal > 0 then
            attacker:addHealth(lifeSteal)
        end
    end
    if manaStealTotal > 0 then
        local manaSteal = math.floor((damage * (manaStealTotal / 100)))
        if manaSteal > 0 then
            attacker:addMana(manaSteal)
        end
    end

    return {
        primaryDamage = primaryDamage,
        secondaryDamage = secondaryDamage
    }
end

--- Process defender damage modifiers from bonuses
-- @param defender Creature: The creature being damaged
-- @param attacker Creature: The creature dealing damage
-- @param primaryDamage number: Primary damage amount
-- @param primaryType number: Primary damage type
-- @param secondaryDamage number: Secondary damage amount
-- @param secondaryType number: Secondary damage type
-- @return table: Table with modified damage values
function processDefenderModifiers(defender, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType)
    local primaryDamageTotal = 0
    local secondaryDamageTotal = 0

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = defender:getSlotItem(slot)
        if item and item:getType():usesSlot(slot) then
            local values = item:getBonusAttributes()
            if values then
                for key, value in pairs(values) do
                    local attr = US_ENCHANTMENTS[value[1]]
                    if attr and attr.combatType and attr.combatType ~= US_TYPES.CONDITION then
                        if attr.combatType == US_TYPES.TRIGGER then
                            if attr.triggerType == US_TRIGGERS.HIT then
                                attr.execute(defender, attacker, value[2])
                            end
                        else
                            if attr.combatDamage then
                                if (attr.combatDamage % (primaryType + primaryType) >= primaryType) and attr.combatType ==
                                    US_TYPES.DEFENSIVE then
                                    primaryDamageTotal = primaryDamageTotal + value[2]
                                end
                                if (attr.combatDamage % (secondaryType + secondaryType) >= secondaryType) and
                                    attr.combatType == US_TYPES.DEFENSIVE then
                                    secondaryDamageTotal = secondaryDamageTotal + value[2]
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    -- Apply damage reduction bonuses
    if primaryDamageTotal > 0 then
        primaryDamage = math.floor(primaryDamage - (primaryDamage * primaryDamageTotal / 100))
    end
    if secondaryDamageTotal > 0 then
        secondaryDamage = math.floor(secondaryDamage - (secondaryDamage * secondaryDamageTotal / 100))
    end

    return {
        primaryDamage = primaryDamage,
        secondaryDamage = secondaryDamage
    }
end

--- Remove a buff from a player
-- @param pid number: The player ID
-- @param buffId number: The buff ID
-- @param buffName string: The name of the buff
function us_RemoveBuff(pid, buffId, buffName)
    if US_BUFFS[pid] then
        US_BUFFS[pid][buffId] = nil
        local player = Player(pid)
        if player then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, buffName .. " ended!")
        end
    end
end

--- Enhance item description with bonus and property information
-- @param player Player: The player looking at the item
-- @param thing Thing: The thing being looked at
-- @param description string: The current description
-- @return string: The enhanced description
function enhanceItemDescription(player, thing, description)
    if thing:isItem() then
        if thing.itemid == US_CONFIG.ITEM_MIND_CRYSTAL and thing:hasMemory() then
            description = enhanceMindCrystalDescription(thing, description)
        elseif thing:getType():isUpgradable() then
            description = enhanceUpgradableItemDescription(thing, description)
        elseif thing:getType():canHaveItemLevel() then
            description = enhanceItemLevelDescription(thing, description)
        end
    elseif thing:isPlayer() then
        description = enhancePlayerDescription(player, thing, description)
    end
    return description
end

--- Enhance mind crystal description with stored enchantments
-- @param crystal Item: The mind crystal
-- @param description string: The current description
-- @return string: The enhanced description
function enhanceMindCrystalDescription(crystal, description)
    for i = 4, 1, -1 do
        local enchant = crystal:getBonusAttribute(i)
        if enchant then
            local attr = US_ENCHANTMENTS[enchant[1]]
            description = description:gsub(crystal:getName() .. "%.", "%1\n" .. attr.format(enchant[2]))
        end
    end
    return description
end

--- Enhance upgradable item description with item properties and bonuses
-- @param item Item: The upgradable item
-- @param description string: The current description
-- @return string: The enhanced description
function enhanceUpgradableItemDescription(item, description)
    local upgrade = item:getUpgradeLevel()
    local itemLevel = item:getItemLevel()

    -- Add upgrade information
    if upgrade > 0 then
        description = description:gsub(item:getName(), "%1 +" .. upgrade)
    end

    -- Add item level information
    if description:find("(%)%.?)") then
        description = description:gsub("(%)%.?)", "%1\nItem Level: " .. itemLevel)
    else
        if upgrade > 0 then
            description = description:gsub("+" .. upgrade .. "%.", "%1\nItem Level: " .. itemLevel)
        else
            description = description:gsub(item:getName(), "%1\nItem Level: " .. itemLevel)
        end
    end

    -- Add rarity and unique information
    description = description:gsub(item:getName(), item:getRarity().name .. " %1")

    if item:getArticle():len() > 0 and item:getRarity().name == "epic" and item:getArticle() ~= "an" then
        description = description:gsub("You see (" .. item:getArticle() .. "%S?)", "You see an")
    end

    if item:isUnique() then
        description = description:gsub("Item Level: " .. itemLevel, item:getUniqueName() .. "\n%1")
    end

    -- Add attribute descriptions
    for i = item:getMaxAttributes(), 1, -1 do
        local enchant = item:getBonusAttribute(i)
        if enchant then
            local attr = US_ENCHANTMENTS[enchant[1]]
            description = description:gsub("Item Level: " .. itemLevel, "%1\n" .. attr.format(enchant[2]))
        end
    end

    -- Add level requirement information
    if US_CONFIG.REQUIRE_LEVEL then
        if item:isLimitless() then
            if description:find("It can only be wielded properly by") then
                description = description:gsub("It can only be wielded properly by (.-)%.",
                    "Removed required Item Level to wear.")
            else
                description = description:gsub("It weighs", "Removed required Item Level to wear.\nIt weighs")
            end
        else
            if description:find("of level (%d+) or higher") then
                for match in description:gmatch("of level (%d+) or higher") do
                    if tonumber(match) < itemLevel then
                        description = description:gsub("of level (%d+) or higher",
                            "of level " .. itemLevel .. " or higher")
                    end
                end
            elseif description:find("It can only be wielded properly by") then
                description = description:gsub("It can only be wielded properly by (.+).\n",
                    "It can only be wielded properly by %1 of level " .. itemLevel .. " or higher.\n")
            else
                if description:find("It weighs") then
                    description = description:gsub("It weighs",
                        "It can only be wielded properly by players of level " .. itemLevel .. " or higher.\nIt weighs")
                else
                    description =
                        description .. "\nIt can only be wielded properly by players of level " .. itemLevel ..
                            " or higher."
                end
            end
        end
    end

    -- Add mirrored information
    if item:isMirrored() then
        if description:find("It weighs") then
            description = description:gsub("oz.(.+)", "oz.%1\nMirrored")
        else
            description = description .. "\nMirrored"
        end
    end

    return description
end

--- Enhance description for items with item level
-- @param item Item: The item with item level
-- @param description string: The current description
-- @return string: The enhanced description
function enhanceItemLevelDescription(item, description)
    local itemLevel = item:getItemLevel()
    if description:find("(%)%.?)") then
        description = description:gsub("(%)%.?)", "%1\nItem Level: " .. itemLevel)
    end
    return description
end

--- Enhance player description with total item level
-- @param observer Player: The player observing
-- @param player Player: The player being observed
-- @param description string: The current description
-- @return string: The enhanced description
function enhancePlayerDescription(observer, player, description)
    local totalItemLevel = 0
    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            totalItemLevel = totalItemLevel + item:getItemLevel()
        end
    end
    description = description .. "\nTotal Item Level: " .. totalItemLevel
    return description
end

--- Apply item conditions on equip
-- @param cid number: Player ID
-- @param iuid number: Item unique ID
-- @param slot number: Equipment slot
function us_onEquip(cid, iuid, slot)
    local player = Player(cid)
    if not player:getSlotItem(slot) then
        return
    end

    iuid = iuid + 1
    local slotUid = player:getSlotItem(slot):getUniqueId()
    if iuid ~= slotUid then
        return
    end

    local item = Item(iuid)
    if not player or not item then
        return
    end

    local maxHP = player:getMaxHealth()
    local maxMP = player:getMaxMana()
    local newBonuses = item:getBonusAttributes()

    if not newBonuses then
        return
    end

    for i = 1, #newBonuses do
        local value = newBonuses[i]
        local bonusId = value[1]
        local bonusValue = value[2]
        local attr = US_ENCHANTMENTS[bonusId]

        if attr and attr.combatType == US_TYPES.CONDITION then
            applyConditionBonus(player, item, bonusId, bonusValue, attr, slot, i, maxHP, maxMP)
        end
    end
end

--- Apply a condition bonus from an item to a player
-- @param player Player: The player to receive the condition
-- @param item Item: The item providing the condition
-- @param bonusId number: The bonus ID
-- @param bonusValue number: The bonus value
-- @param attr table: The attribute information
-- @param slot number: The equipment slot
-- @param index number: The bonus index
-- @param maxHP number: The player's max HP
-- @param maxMP number: The player's max MP
function applyConditionBonus(player, item, bonusId, bonusValue, attr, slot, index, maxHP, maxMP)
    if not US_CONDITIONS[bonusId] then
        US_CONDITIONS[bonusId] = {}
    end

    local itemId = item:getId()

    if not US_CONDITIONS[bonusId][bonusValue] then
        US_CONDITIONS[bonusId][bonusValue] = {}
    end

    if not US_CONDITIONS[bonusId][bonusValue][itemId] then
        US_CONDITIONS[bonusId][bonusValue][itemId] = Condition(attr.condition)

        if attr.condition ~= CONDITION_MANASHIELD then
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_SUBID,
                1000 + player:getNextSubId(slot, index))
                
            -- Handle percentage-based attributes differently
            if attr.percentage then
                -- For percentage attributes, we add to 100 (base value)
                US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(attr.param, 100 + bonusValue)
            else
                -- For flat values, use the value directly
                US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(attr.param, bonusValue)
            end
            
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, -1)
        else
            US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_TICKS, 86400000)
        end

        US_CONDITIONS[bonusId][bonusValue][itemId]:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])

        if attr.param == CONDITION_PARAM_STAT_MAXHITPOINTS or attr.param == CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT and player:getHealth() == maxHP then
            player:addHealth(player:getMaxHealth())
        end

        if attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTS or attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT and player:getMana() == maxMP then
            player:addMana(player:getMaxMana())
        end
    else
        player:addCondition(US_CONDITIONS[bonusId][bonusValue][itemId])

        if attr.param == CONDITION_PARAM_STAT_MAXHITPOINTS or attr.param == CONDITION_PARAM_STAT_MAXHITPOINTSPERCENT and player:getHealth() == maxHP then
            player:addHealth(player:getMaxHealth())
        end

        if attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTS or attr.param == CONDITION_PARAM_STAT_MAXMANAPOINTSPERCENT and player:getMana() == maxMP then
            player:addMana(player:getMaxMana())
        end
    end
end

--- Initialize a player's bonuses on login
-- @param player Player: The player logging in
function us_onLogin(player)
    player:registerEvent("UpgradeSystemKill")
    player:registerEvent("UpgradeSystemHealth")
    player:registerEvent("UpgradeSystemMana")
    player:registerEvent("UpgradeSystemPD")

    local maxHP = player:getMaxHealth()
    local maxMP = player:getMaxMana()

    for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
        local item = player:getSlotItem(slot)
        if item then
            local newBonuses = item:getBonusAttributes()
            if newBonuses then
                local itemId = item:getId()
                for i = 1, #newBonuses do
                    local value = newBonuses[i]
                    local bonusId = value[1]
                    local bonusValue = value[2]
                    local attr = US_ENCHANTMENTS[bonusId]

                    if attr and attr.combatType == US_TYPES.CONDITION then
                        applyConditionBonus(player, item, bonusId, bonusValue, attr, slot, i, maxHP, maxMP)
                    end
                end
            end
        end
    end
end

--- Get the next subid for a condition
-- @param player Player: The player
-- @param itemSlot number: The equipment slot
-- @param attrSlot number: The attribute slot
-- @return number: The next subid
function Player.getNextSubId(self, itemSlot, attrSlot)
    local cid = self:getId()
    if not US_SUBID[cid] then
        US_SUBID[cid] = {
            current = 0
        }
    end

    local subId = US_SUBID[cid]
    subId.current = subId.current + 1

    if not subId[itemSlot] then
        subId[itemSlot] = {}
    end

    subId[itemSlot][attrSlot] = subId.current

    return subId.current
end

--- Check if an item is unidentified (always returns false now)
-- @param self Item: The item to check
-- @return boolean: Always false as items are no longer unidentified
function Item.isUnidentified(self)
    return false
end

-- Register events
local TargetCombatEvent = EventCallback
TargetCombatEvent.onTargetCombat = function(creature, target)
    target:registerEvent("UpgradeSystemHealth")
    target:registerEvent("UpgradeSystemDeath")
    return RETURNVALUE_NOERROR
end
TargetCombatEvent:register()

-- Register login event
local LoginEvent = CreatureEvent("UpgradeSystemLogin")
function LoginEvent.onLogin(player)
    us_onLogin(player)
    return true
end
LoginEvent:type("login")
LoginEvent:register()

-- Register health change event
local HealthChangeEvent = CreatureEvent("UpgradeSystemHealth")
function HealthChangeEvent.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
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

-- Register mana change event
local ManaChangeEvent = CreatureEvent("UpgradeSystemMana")
function ManaChangeEvent.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if isInSameParty(creature, attacker) then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end

    if primaryType == COMBAT_LIFEDRAIN or secondaryType == COMBAT_LIFEDRAIN or
       primaryType == COMBAT_MANADRAIN or secondaryType == COMBAT_MANADRAIN then
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

-- Register death event
local DeathEvent = CreatureEvent("UpgradeSystemDeath")
function DeathEvent.onDeath(creature, corpse, lasthitkiller, mostdamagekiller, lasthitunjustified, mostdamageunjustified)
    if not lasthitkiller or not creature:isMonster() or not corpse or corpse.itemid == 0 or not corpse:isContainer() then
        return true
    end
    if not lasthitkiller:isPlayer() and not lasthitkiller:getMaster() then
        return true
    end
    return true
end
DeathEvent:type("death")
DeathEvent:register()

-- Register kill event
local KillEvent = CreatureEvent("UpgradeSystemKill")
function KillEvent.onKill(player, target, lastHit)
    if not player or not player:isPlayer() or not target or not target:isMonster() then
        return
    end
    
    local center = target:getPosition()
    processKillTriggers(player, center, target)
end
KillEvent:type("kill")
KillEvent:register()

-- Register prepare death event
local PrepareDeathEvent = CreatureEvent("UpgradeSystemPD")
function PrepareDeathEvent.onPrepareDeath(creature, killer)
    if creature:isPlayer() then
        if checkReviveOnDeath(creature) then
            return false -- Prevent death
        end
    end
    return true
end
PrepareDeathEvent:type("preparedeath")
PrepareDeathEvent:register()

-- Register gain experience event
local GainExperienceEvent = EventCallback
GainExperienceEvent.onGainExperience = function(player, source, exp, rawExp)
    return calculateModifiedExperience(player, exp)
end
GainExperienceEvent:register()

-- Register move item event
local MoveItemEvent = EventCallback
MoveItemEvent.onMoveItem = function(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    return handleItemMove(player, item, fromPosition, toPosition)
end
MoveItemEvent:register()

-- Register item moved event
local ItemMovedEvent = EventCallback
ItemMovedEvent.onItemMoved = function(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    handleItemMoved(player, item, fromPosition, toPosition)
end
ItemMovedEvent:register()

-- Register look event
local LookEvent = EventCallback
LookEvent.onLook = function(player, thing, position, distance, description)
    return enhanceItemDescription(player, thing, description)
end
LookEvent:register(10)
