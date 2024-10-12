local Repository = {}

function Repository.getPoints(player)
    local points = 0
    local resultId = db.storeQuery("SELECT `premium_points` FROM `accounts` WHERE `id` = " .. player:getAccountId())
    if resultId ~= false then
        points = result.getDataInt(resultId, "premium_points")
        result.free(resultId)
    end
    return points
end

function Repository.updatePoints(player, points)
    local accountId = player:getAccountId()
    return db.query("UPDATE `accounts` SET `premium_points` = `premium_points` - " .. points .. " WHERE `id` = " .. accountId)
end

function Repository.logPurchase(player, offer)
    local accountId = player:getAccountId()
    local playerId = player:getGuid()
    local title = db.escapeString(offer['title'])
    local cost = db.escapeString(offer['cost'])
    local details = db.escapeString(json.encode(offer))

    return db.asyncQuery(
        "INSERT INTO `shop_history` (`account`, `player`, `date`, `title`, `cost`, `details`) " ..
        "VALUES ('" .. accountId .. "', '" .. playerId .. "', NOW(), " .. title .. ", " .. cost .. ", " .. details .. ")"
    )
end

return Repository
