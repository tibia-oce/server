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
                -- Apply item level to eligible items
                if itemType:canHaveItemLevel() then
                    local calculatedLevel = math.min(US_CONFIG.MAX_ITEM_LEVEL, math.random(math.max(1, iLvl - 5), iLvl))
                    item:setItemLevel(calculatedLevel, true)
                end

                -- Apply rarity and bonuses to upgradable items
                if itemType:isUpgradable() then
                    -- First determine rarity
                    item:rollRarity()

                    -- Then roll attributes matching rarity's maxBonus exactly
                    item:rollAttribute(nil, itemType, itemType:getWeaponType(), true)

                    -- Mark as unidentified
                    item:unidentify()
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
