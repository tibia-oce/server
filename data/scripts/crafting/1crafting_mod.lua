local CODE_CRAFTING = 91

Crafting = {}

local fetchLimit = 10

local categories = {"alchemy", "armour", "weapons", "tools"}

local ActionEvent = Action()

function ActionEvent.onUse(player)
    player:showCrafting()
    return true
end

local LoginEvent = CreatureEvent("CraftingLogin")

function LoginEvent.onLogin(player)
    player:registerEvent("CraftingExtended")
    return true
end

local ExtendedEvent = CreatureEvent("CraftingExtended")

local function initializeAllCategory()
    -- todo(crafting): performance optimisation Needed
    -- Current implementation rebuilds the entire 'all' category on each request
    -- 1. Caching the 'all' category and invalidating only when other categories change
    -- 2. Building 'all' category once at server start and storing in memory
    -- 3. Implementing a versioning system to track if rebuild is actually needed?
    -- 4. Using a more efficient data structure for category management

    -- Clean up existing "all" from categories array
    for i = #categories, 1, -1 do
        if categories[i] == "all" then table.remove(categories, i) end
    end

    -- Clear and rebuild the all category
    Crafting.all = {}
    for _, category in ipairs(categories) do
        if Crafting[category] then
            for _, craft in ipairs(Crafting[category]) do
                table.insert(Crafting.all, craft)
            end
        end
    end

    -- Add "all" to categories list (now we know there's only one)
    table.insert(categories, 1, "all")
end

function ExtendedEvent.onExtendedOpcode(player, opcode, buffer)
    if opcode == CODE_CRAFTING then
        local status, json_data = pcall(function()
            return json.decode(buffer)
        end)

        if not status then return false end

        local action = json_data.action
        local data = json_data.data

        if action == "fetch" then
            initializeAllCategory()
            Crafting:sendMoney(player)
            for _, category in ipairs(categories) do
                Crafting:sendCrafts(player, category)
            end
        elseif action == "craft" then
            Crafting:craft(player, data.category, data.craftId)
        end
    end
    return true
end

function Crafting:sendCrafts(player, category)
    local data = {}

    for i = 1, #Crafting[category] do
        local craft = {}
        for key, value in pairs(Crafting[category][i]) do
            if key == "materials" then
                craft.materials = {}
                for indx, material in ipairs(value) do
                    local itemType = ItemType(material.id)
                    craft.materials[indx] = {
                        id = material.id,
                        count = material.count,
                        player = player:getItemCount(material.id)
                    }
                end
            else
                craft[key] = value
            end
        end

        local itemType = ItemType(craft.id)
        craft.clientId = itemType:getClientId()

        for x = 1, #craft.materials do
            craft.materials[x].id =
                ItemType(craft.materials[x].id):getClientId()
        end
        table.insert(data, craft)
    end

    if #data >= fetchLimit then
        local x = 1
        for i = 1, math.floor(#data / fetchLimit) do
            player:sendExtendedOpcode(CODE_CRAFTING, json.encode({
                action = "fetch",
                data = {
                    category = category,
                    crafts = {
                        unpack(data, x, math.min(x + fetchLimit - 1, #data))
                    }
                }
            }))
            x = x + fetchLimit
        end

        if x < #data then
            player:sendExtendedOpcode(CODE_CRAFTING, json.encode({
                action = "fetch",
                data = {category = category, crafts = {unpack(data, x, #data)}}
            }))
        end
    else
        player:sendExtendedOpcode(CODE_CRAFTING, json.encode(
                                      {
                action = "fetch",
                data = {category = category, crafts = data}
            }))
    end
end

function Crafting:craft(player, category, craftId)
    local craft = Crafting[category][craftId]

    local money = player:getTotalMoney()

    if money < craft.cost then
        player:popupFYI(string.format("You don't have enough money: " ..
                                          craft.cost .. "."))
        return
    end

    if player:getLevel() < craft.level then
        player:popupFYI(string.format("You don't have the required Level." ..
                                          craft.level .. "."))
        return
    end

    for i = 1, #craft.materials do
        local material = craft.materials[i]
        if player:getItemCount(material.id) < material.count then
            player:popupFYI(string.format("You don't have enough materials."))
            return
        end
    end

    local item = Game.createItem(craft.id, craft.count)
    if item then
        if player:addItemEx(item) then
            player:removeTotalMoney(craft.cost)

            for i = 1, #craft.materials do
                local material = craft.materials[i]
                player:removeItem(material.id, material.count)
            end

            Crafting:sendMoney(player)
            Crafting:sendMaterials(player, category)
            player:sendExtendedOpcode(CODE_CRAFTING,
                                      json.encode({action = "crafted"}))
        end
    end
end

function Crafting:sendMaterials(player, category)
    local data = {}

    for i = 1, #Crafting[category] do
        local materials = {}
        for key, value in pairs(Crafting[category][i]) do
            if key == "materials" then
                for matId, matData in ipairs(value) do
                    materials[matId] = player:getItemCount(matData.id)
                end
            end
        end
        table.insert(data, materials)
    end

    if #data >= fetchLimit then
        local x = 1
        for i = 1, math.floor(#data / fetchLimit) do
            player:sendExtendedOpcode(CODE_CRAFTING, json.encode({
                action = "materials",
                data = {
                    category = category,
                    from = x,
                    materials = {
                        unpack(data, x, math.min(x + fetchLimit - 1, #data))
                    }
                }
            }))
            x = x + fetchLimit
        end

        if x < #data then
            player:sendExtendedOpcode(CODE_CRAFTING, json.encode({
                action = "materials",
                data = {
                    category = category,
                    from = x,
                    materials = {unpack(data, x, #data)}
                }
            }))
        end
    else
        player:sendExtendedOpcode(CODE_CRAFTING, json.encode({
            action = "materials",
            data = {category = category, from = 1, materials = data}
        }))
    end
end

function Crafting:sendMoney(player)
    player:sendExtendedOpcode(CODE_CRAFTING, json.encode(
                                  {
            action = "money",
            data = player:getTotalMoney()
        }))
end

function Player:showCrafting()
    initializeAllCategory()
    Crafting:sendMoney(self)
    for _, category in ipairs(categories) do
        Crafting:sendMaterials(self, category)
    end
    self:sendExtendedOpcode(CODE_CRAFTING, json.encode({action = "show"}))
end

function Player.getTotalMoney(self)
    return self:getMoney() + self:getBankBalance()
end

function Player.removeTotalMoney(self, amount)
    local moneyCount = self:getMoney()
    local bankCount = self:getBankBalance()
    if amount <= moneyCount then
        self:removeMoney(amount)
        return true
    elseif amount <= (moneyCount + bankCount) then
        if moneyCount ~= 0 then
            self:removeMoney(moneyCount)
            local remains = amount - moneyCount
            self:setBankBalance(bankCount - remains)
            self:sendTextMessage(MESSAGE_INFO_DESCR,
                                 ("Paid %d from inventory and %d gold from bank account. Your account balance is now %d gold."):format(
                                     moneyCount, amount - moneyCount,
                                     self:getBankBalance()))
            return true
        end

        self:setBankBalance(bankCount - amount)
        self:sendTextMessage(MESSAGE_INFO_DESCR,
                             ("Paid %d gold from bank account. Your account balance is now %d gold."):format(
                                 amount, self:getBankBalance()))
        return true
    end
    return false
end

ActionEvent:aid(38820)
ActionEvent:register()
LoginEvent:type("login")
LoginEvent:register()
ExtendedEvent:type("extendedopcode")
ExtendedEvent:register()
