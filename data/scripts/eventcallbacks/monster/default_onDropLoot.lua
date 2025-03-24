-- data\scripts\eventcallbacks\monster\default_onDropLoot.lua
local ec = EventCallback
ec.onDropLoot = function(self, corpse)
    if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
        return
    end

    local player = Player(corpse:getCorpseOwner())
    local mType = self:getType()

    if not player or player:getStamina() > 840 then
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
        for i = 0, corpse:getCapacity() do
            local item = corpse:getItem(i)
            if item then
                local itemType = item:getType()
                if itemType then
                    if itemType:canHaveItemLevel() then
                        item:setItemLevel(math.min(US_CONFIG.MAX_ITEM_LEVEL, math.random(math.max(1, iLvl - 5), iLvl)),
                            true)
                    end
                    if itemType:isUpgradable() then
                        if math.random(US_CONFIG.UNIDENTIFIED_DROP_CHANCE) == 1 then
                            item:unidentify()
                        else
                            item:rollRarity()
                        end
                    end
                end
            end
        end

        if player then
            local text = ("Loot of %s: %s"):format(mType:getNameDescription(), corpse:getContentDescription())
            local party = player:getParty()
            if party then
                party:broadcastPartyLoot(text)
            else
                player:sendTextMessage(MESSAGE_LOOT, text)
            end
        end
    else
        local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
        local party = player:getParty()
        if party then
            party:broadcastPartyLoot(text)
        else
            player:sendTextMessage(MESSAGE_LOOT, text)
        end
    end

    -- Schedule the rest of the processing for other upgrade system features
    -- like "Additional Gold" effect after auto-looting
    addEvent(us_CheckCorpse, 10, mType, corpse:getPosition(), player and player:getId() or 0)
end
ec:register()
