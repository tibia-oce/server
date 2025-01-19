function onUse(player, item, fromPosition, target, toPosition)
    
    local vocation = player:getVocation():getId()
    local storageId = PlayerStorageKeys.playerStarterKit
    
    if player:getStorageValue(storageId) == 1 then
        doPlayerSendCancel(player, "You have already used this item.")
        return true
    end
    
    if vocation == VOCATION.ID.SORCERER or VOCATION.ID.DRUID then
        local rewards = {
            {2160, 100}, -- 100 crystal coins
            {28131, 1}, -- nepotism nimbus
            {28136, 1}, -- nepotism negator
            {2504, 1}, -- dwarven legs
            {8871, 1}, -- focus cape
            {2195, 1}, -- boh
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

        doPlayerSetSkillLevel(player, SKILL_MAGLEVEL, 80)
        player:setStorageValue(storageId, 1)
        doRemoveItem(item.uid, 1)
    else
        doPlayerSendCancel(player, "You don't have the required vocation.")
    end

    return true
end
