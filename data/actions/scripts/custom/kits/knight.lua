function onUse(player, item, fromPosition, target, toPosition)
    
    local vocation = player:getVocation():getId()
    local storageId = PlayerStorageKeys.playerStarterKit
    
    if player:getStorageValue(storageId) == 1 then
        doPlayerSendCancel(player, "You have already used this item.")
        return true
    end
    
    if vocation == VOCATION.ID.KNIGHT then
        local rewards = {
            {2160, 100}, -- 100 crystal coins
            {28134, 1}, -- bug-buster battleaxe
            {28135, 1}, -- debugging defender
            {2504, 1}, -- dwarven legs
            {2472, 1}, -- magic plate armor
            {2195, 1}, -- boots of haste
            {2493, 1}, -- demon helmet
        }

        local totalWeight = 0
        for _, reward in ipairs(rewards) do
            totalWeight = totalWeight + getItemWeight(reward[1]) * reward[2]
        end

        local freeCap = getPlayerFreeCap(player)
        if freeCap < totalWeight then
            local neededCap = totalWeight - freeCap
            doPlayerSendTextMessage(player, MESSAGE_STATUS_CONSOLE_BLUE, "You need " .. neededCap .. " more capacity to receive your rewards.")
            return true
        end

        for _, reward in ipairs(rewards) do
            doPlayerAddItem(player, reward[1], reward[2])
        end

        doPlayerSetSkillLevel(player, SKILL_CLUB, 70)
        doPlayerSetSkillLevel(player, SKILL_SWORD, 70)
        doPlayerSetSkillLevel(player, SKILL_AXE, 70)
        doPlayerSetSkillLevel(player, SKILL_MAGLEVEL, 6)
        player:setStorageValue(storageId, 1)
        doRemoveItem(item.uid, 1)
    else
        doPlayerSendCancel(player, "You don't have the required vocation.")
    end

    return true
end
