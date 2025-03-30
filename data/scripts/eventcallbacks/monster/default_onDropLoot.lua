-- data\scripts\eventcallbacks\monster\default_onDropLoot.lua
--- Process monster loot drops with upgrade system integration
-- @param self Monster: The monster dropping loot
-- @param corpse Container: The corpse container
local ec = EventCallback
ec.onDropLoot = function(self, corpse)
    -- Skip if loot rate is disabled
    if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
        return
    end

    local player = Player(corpse:getCorpseOwner())
    local mType = self:getType()

    -- Process loot drops based on player stamina
    if not player or player:getStamina() > 840 then
        -- Create loot items from monster loot table
        local monsterLoot = mType:getLoot()
        for i = 1, #monsterLoot do
            local item = corpse:createLootItem(monsterLoot[i])
            if not item then
                print('[Warning] DropLoot:', 'Could not add loot item to corpse.')
            end
        end

        -- Process items in corpse for the upgrade system
        -- This happens before auto-looting, so items will have their correct status
        local iLvl = mType:calculateItemLevel()
        processCorpseItems(corpse, iLvl)

        -- Send loot message to player or party
        if player then
            sendLootMessage(player, mType, corpse, false)
        end
    else
        -- Player has low stamina, no loot
        if player then
            sendLootMessage(player, mType, corpse, true)
        end
    end

    -- Schedule additional upgrade system processing after auto-looting
    addEvent(us_CheckCorpse, 10, mType, corpse:getPosition(), player and player:getId() or 0)
end
ec:register()

--- Process items in a corpse to apply item level and rarity
-- @param corpse Container: The corpse container
-- @param iLvl number: The calculated item level for dropped items
function processCorpseItems(corpse, iLvl)
    for i = 0, corpse:getCapacity() do
        local item = corpse:getItem(i)
        if item then
            local itemType = item:getType()
            if itemType then
                -- Check if item is upgradable
                if itemType:isUpgradable() then
                    -- First determine rarity
                    item:rollRarity()

                    -- IMPORTANT: Set the base item level before any attribute modifications
                    local calculatedLevel = math.min(US_CONFIG.MAX_ITEM_LEVEL, math.random(math.max(1, iLvl - 5), iLvl))

                    -- Store the original item stats before any changes
                    local origAttack = itemType:getAttack()
                    local origDefense = itemType:getDefense()
                    local origArmor = itemType:getArmor()
                    local origHitChance = itemType:getHitChance()
                    local origExtraDefense = itemType:getExtraDefense()

                    -- Calculate appropriate upgrade level based on rarity
                    local rarity = item:getRarityId()
                    local upgradeLevel = 0

                    -- Assign upgrade levels based on rarity
                    if rarity == RARE then
                        upgradeLevel = math.random(1, 3) -- Rare items get +1 to +3
                    elseif rarity == EPIC then
                        upgradeLevel = math.random(3, 6) -- Epic items get +3 to +6
                    elseif rarity == LEGENDARY then
                        upgradeLevel = math.random(6, 9) -- Legendary items get +6 to +9
                    end

                    -- First set the item level directly without using setItemLevel
                    -- This prevents automatic attribute scaling
                    item:setCustomAttribute("item_level", calculatedLevel)

                    -- Then manually apply the upgrade-related stats
                    if upgradeLevel > 0 then
                        -- Apply the stats based on the upgrade level
                        if origAttack > 0 then
                            item:setAttribute(ITEM_ATTRIBUTE_ATTACK,
                                origAttack + (upgradeLevel * US_CONFIG.ATTACK_PER_UPGRADE))
                        end
                        if origDefense > 0 then
                            item:setAttribute(ITEM_ATTRIBUTE_DEFENSE,
                                origDefense + (upgradeLevel * US_CONFIG.DEFENSE_PER_UPGRADE))
                        end
                        if origExtraDefense > 0 then
                            item:setAttribute(ITEM_ATTRIBUTE_EXTRADEFENSE,
                                origExtraDefense + (upgradeLevel * US_CONFIG.EXTRADEFENSE_PER_UPGRADE))
                        end
                        if origArmor > 0 then
                            item:setAttribute(ITEM_ATTRIBUTE_ARMOR,
                                origArmor + (upgradeLevel * US_CONFIG.ARMOR_PER_UPGRADE))
                        end
                        if origHitChance > 0 then
                            item:setAttribute(ITEM_ATTRIBUTE_HITCHANCE,
                                origHitChance + (upgradeLevel * US_CONFIG.HITCHANCE_PER_UPGRADE))
                        end

                        -- Set the upgrade level (without calling setUpgradeLevel to avoid duplicate stat boosts)
                        item:setCustomAttribute("upgrade", upgradeLevel)
                    end

                    -- Roll attributes matching rarity's maxBonus exactly
                    item:rollAttribute(nil, itemType, itemType:getWeaponType(), true)
                    -- Apply item level to other eligible items that aren't upgradable
                elseif itemType:canHaveItemLevel() then
                    local calculatedLevel = math.min(US_CONFIG.MAX_ITEM_LEVEL, math.random(math.max(1, iLvl - 5), iLvl))
                    item:setItemLevel(calculatedLevel, true)
                end
            end
        end
    end
end

--- Send a loot message to a player or party
-- @param player Player: The player who killed the monster
-- @param mType MonsterType: The type of monster killed
-- @param corpse Container: The corpse container
-- @param lowStamina boolean: True if player has low stamina
function sendLootMessage(player, mType, corpse, lowStamina)
    local text

    if lowStamina then
        text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
    else
        text = ("Loot of %s: %s"):format(mType:getNameDescription(), corpse:getContentDescription())
    end

    local party = player:getParty()
    if party then
        party:broadcastPartyLoot(text)
    else
        player:sendTextMessage(MESSAGE_LOOT, text)
    end
end
