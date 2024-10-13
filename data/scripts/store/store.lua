-- data/scripts/store/game_store.lua

local repository = require("data/scripts/store/repository")
local events = require("data/scripts/store/events")
local callbacks = require("data/scripts/store/callbacks")
local offers = require("data/scripts/store/offers")

local DONATION_URL = "https://myaac.mythbound.dev/"
local CODE_GAMESTORE = 102
local GAME_STORE = nil

local LoginEvent = CreatureEvent("GameStoreLogin")

function LoginEvent.onLogin(player)
    player:registerEvent("GameStoreExtended")
    return true
end

function gameStoreInitialize()
    GAME_STORE = {
        categories = {},
        offers = {}
    }

    -- Items
    offers.addCategory(GAME_STORE, "Items", "Tools, Dolls & Boxes.", "item", 2331)
    offers.addItem(GAME_STORE, "Items", "VIP Medal (30 days)", "Earn 10% more exp, Access To Gambling\nAnd Gold Dump(Obtainable ingame)", 10135, 1, 200)
    offers.addItem(GAME_STORE, "Items", "Outfit Doll", "Use this to obtain one outfit with full Addons.", 8982, 1, 300)
    offers.addItem(GAME_STORE, "Items", "Gender Doll", "Can be used to change your gender.", 13581, 1, 200)
    offers.addItem(GAME_STORE, "Items", "Name Doll", "Can be used to change your name.", 12666, 1, 400)
    offers.addItem(GAME_STORE, "Items", "Frag Remover", "Use this to remove your frags & Red/Black Skull.", 16105, 1, 500)
    offers.addItem(GAME_STORE, "Items", "Stamina Refiller", "Can be used to fully recharge your stamina.", 21705, 1, 400)
    offers.addItem(GAME_STORE, "Items", "Squeezing Gear of Girlpower", "Multitool", 10513, 1, 200)

    -- Mounts
    offers.addCategory(GAME_STORE, "Mounts", "Giddy up", "mount", 426)
	offers.addMount(GAME_STORE, "Mounts", "Blackpelt", "Wont be taking any damage with that armor..", 58, 651, 400)
    offers.addMount(GAME_STORE, "Mounts", "Doombringer", "Shall curse your enemies with doom.", 53, 644, 350)
    offers.addMount(GAME_STORE, "Mounts", "Walker", "Mechanical experiment.", 43, 606, 300)
    offers.addMount(GAME_STORE, "Mounts", "Ladybug", "Lets out a mighty roar.", 27, 447, 300)

    -- Equipment
	offers.addCategory(GAME_STORE, "Equipment", "Beginner Item Sets.", "item", 2331)
	offers.addItem(GAME_STORE, "Equipment", "Mage Starter Box", "Contains a full mage beginner set.", 29223, 1, 500)
	offers.addItem(GAME_STORE, "Equipment", "Paladin Starter Box", "Contains a full paladin beginner set.", 29224, 1, 500)
	offers.addItem(GAME_STORE, "Equipment", "Knight Starter Box", "Contains a full knight beginner set.", 29227, 1, 500)

    -- Outfits
    offers.addCategory(GAME_STORE, "Outfits", "Contains all addons.", "outfit", {
        mount = 0,
        type = 577,
        addons = 3,
        head = 9,
        body = 126,
        legs = 124,
        feet = 116
    })
    offers.addOutfit(GAME_STORE, "Outfits", "Dream Warden Outfit", "Dream Warden", {
        mount = 0,
        type = 577,
        addons = 3,
        head = 9,
        body = 126,
        legs = 124,
        feet = 116
    }, {
        mount = 0,
        type = 578,
        addons = 3,
        head = 9,
        body = 126,
        legs = 124,
        feet = 116
    }, 400)
end

local ExtendedEvent = CreatureEvent("GameStoreExtended")

function ExtendedEvent.onExtendedOpcode(player, opcode, buffer)
    if opcode == CODE_GAMESTORE then
        if not GAME_STORE then
            gameStoreInitialize()
            events.refreshPlayersPoints(CODE_GAMESTORE)
        end

        local status, json_data = pcall(function()
            return json.decode(buffer)
        end)
        if not status then
            return
        end

        local action = json_data.action
        local data = json_data.data
        if not action or not data then
            return
        end

        if action == "fetch" then
            gameStoreFetch(player)
        elseif action == "purchase" then
            gameStorePurchase(player, data)
        elseif action == "gift" then
            gameStorePurchaseGift(player, data)
        end
    end
end

function gameStoreFetch(player)
    local sex = player:getSex()

    player:sendExtendedOpcode(CODE_GAMESTORE, json.encode({
        action = "fetchBase",
        data = {
            categories = GAME_STORE.categories,
            url = DONATION_URL
        }
    }))

    for category, offersTable in pairs(GAME_STORE.offers) do
        local offers = {}

        for i = 1, #offersTable do
            local offer = offersTable[i]
            local data = {
                type = offer.type,
                title = offer.title,
                description = offer.description,
                price = offer.price
            }

            if offer.count then
                data.count = offer.count
            end
            if offer.clientId then
                data.clientId = offer.clientId
            end
            if sex == PLAYERSEX_MALE then
                if offer.outfitMale then
                    data.outfit = offer.outfitMale
                end
            else
                if offer.outfitFemale then
                    data.outfit = offer.outfitFemale
                end
            end
            if offer.data then
                data.data = offer.data
            end
            table.insert(offers, data)
        end
        player:sendExtendedOpcode(CODE_GAMESTORE, json.encode({
            action = "fetchOffers",
            data = {
                category = category,
                offers = offers
            }
        }))
    end

    events.gameStoreUpdatePoints(player, CODE_GAMESTORE)
    events.gameStoreUpdateHistory(player, CODE_GAMESTORE)
end

function gameStorePurchase(player, offer)
    local offers = GAME_STORE.offers[offer.category]
    if not offers then
        return errorMsg(player, "Something went wrong, try again or contact server admin [#1]!")
    end
    for i = 1, #offers do
        if offers[i].title == offer.title and offers[i].price == offer.price then
            local callback = offers[i].callback
            if not callback then
                return errorMsg(player, "Something went wrong, try again or contact server admin [#2]!")
            end

            local points = repository.getPoints(player)
            if offers[i].price > points then
                return errorMsg(player, "You don't have enough points!")
            end

            local status = callback(player, offers[i])
            if status ~= true then
                return errorMsg(player, status)
            end

            repository.updatePremiumPoints(player, offers[i].price)
            repository.insertShopHistory(player, offers[i])
            addEvent(events.gameStoreUpdateHistory, 1000, player:getId(), CODE_GAMESTORE)
            addEvent(events.gameStoreUpdatePoints, 1000, player:getId(), CODE_GAMESTORE)

            return infoMsg(player, "You've bought " .. offers[i].title .. "!", true)
        end
    end
    return errorMsg(player, "Something went wrong, try again or contact server admin [#4]!")
end

function gameStorePurchaseGift(player, offer)
    local offers = GAME_STORE.offers[offer.category]
    if not offers then
        return errorMsg(player, "Something went wrong, try again or contact server admin [#1]!")
    end
    if not offer.target then
        return errorMsg(player, "Target player not found!")
    end
    for i = 1, #offers do
        if offers[i].title == offer.title and offers[i].price == offer.price then
            local callback = offers[i].callback
            if not callback then
                return errorMsg(player, "Something went wrong, try again or contact server admin [#2]!")
            end

            local points = repository.getPoints(player)
            if offers[i].price > points then
                return errorMsg(player, "You don't have enough points!")
            end

            local targetPlayer = Player(offer.target)
            if not targetPlayer then
                return errorMsg(player, "Target player not found!")
            end

            local status = callback(targetPlayer, offers[i])
            if status ~= true then
                return errorMsg(player, status)
            end

            repository.updatePremiumPoints(player, offers[i].price)
            repository.insertShopHistory(player, offers[i])
            addEvent(events.gameStoreUpdateHistory, 1000, player:getId(), CODE_GAMESTORE)
            addEvent(events.gameStoreUpdatePoints, 1000, player:getId(), CODE_GAMESTORE)

            return
                infoMsg(player, "You've bought " .. offers[i].title .. " for " .. targetPlayer:getName() .. "!", true)
        end
    end
    return errorMsg(player, "Something went wrong, try again or contact server admin [#4]!")
end

function errorMsg(player, msg)
    player:sendExtendedOpcode(CODE_GAMESTORE, json.encode({
        action = "msg",
        data = {
            type = "error",
            msg = msg
        }
    }))
end

function infoMsg(player, msg, close)
    if not close then
        close = false
    end
    player:sendExtendedOpcode(CODE_GAMESTORE, json.encode({
        action = "msg",
        data = {
            type = "info",
            msg = msg,
            close = close
        }
    }))
end

LoginEvent:type("login")
LoginEvent:register()
ExtendedEvent:type("extendedopcode")
ExtendedEvent:register()
