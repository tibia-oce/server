local teleportScroll = Action()

function teleportScroll.onUse(player, item, fromPos, target, toPos, isHotkey)
    local playerPos = player:getPosition()
    local tile = Tile(playerPos)
    if not tile or not tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("You can use only in pz.")
        return true
    end

    local town = player:getTown()
    local templePos = town and town:getTemplePosition() or Town(1):getTemplePosition()
    playerPos:sendMagicEffect(CONST_ME_POFF)
    player:teleportTo(templePos)
    templePos:sendMagicEffect(CONST_ME_TELEPORT)
    item:transform(item:getId(), item:getCharges() -1)
    return true
end

teleportScroll:id(6119)
teleportScroll:register()
