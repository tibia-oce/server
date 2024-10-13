local common_items = {
    2460, -- brass helmet
    2465, -- brass armor
    2478, -- brass legs
    2643, -- leather boots
    1988, -- backpack
    2160, -- cc
    2120, -- rope
    2554, -- shovel
    6119, -- temple scroll
}

local vocation_items = {
    [0] = {}, -- No vocation
    [1] = {2175, 2190}, -- Sorcerer
    [2] = {2175, 2182}, -- Druid
    [3] = {2525, 2389}, -- Paladin
    [4] = {2525, 2428, 2383, 2439}  -- Knight
}

function onLogin(player)
    if player:getLastLoginSaved() == 0 then
        local vocation = player:getVocation():getId()

        for _, item in ipairs(common_items) do
            player:addItem(item, 1)
        end

        local items = vocation_items[vocation]
        if items then
            for _, item in ipairs(items) do
                player:addItem(item, 1)
            end
        end
    end
    return true
end
