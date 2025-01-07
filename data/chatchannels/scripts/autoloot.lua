function onSpeak(player, type, message)
    local playerAccountType = player:getAccountType()
    if playerAccountType == ACCOUNT_TYPE_NORMAL then
        player:sendCancelMessage("You can not speak here.")
        return false
    end
    return type
end
