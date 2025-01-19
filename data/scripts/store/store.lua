local handlers = require("data/scripts/store/handlers")
local events = require("data/scripts/store/events")
local offers = require("data/scripts/store/offers")

local DONATION_URL = os.getenv("DONATION_URL") or "https://myaac.mythbound.dev/"
local CODE_GAMESTORE = 102
local GAME_STORE = nil

local LoginEvent = CreatureEvent("GameStoreLogin")
local ExtendedEvent = CreatureEvent("GameStoreExtended")

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
    offers.addItem(GAME_STORE, "Items", "Outfit Doll", "Use this to obtain one outfit with full Addons.", 8982, 1, 300)
    offers.addItem(GAME_STORE, "Items", "Gender Doll", "Can be used to change your gender.", 13581, 1, 200)
    offers.addItem(GAME_STORE, "Items", "Name Doll", "Can be used to change your name.", 12666, 1, 400)
    offers.addItem(GAME_STORE, "Items", "Frag Remover", "Use this to remove your frags & Red/Black Skull.", 16105, 1, 500)
    offers.addItem(GAME_STORE, "Items", "Stamina Refiller", "Can be used to fully recharge your stamina.", 21705, 1, 400)
    offers.addItem(GAME_STORE, "Items", "Squeezing Gear of Girlpower", "Multitool", 10513, 1, 200)

    -- Mounts
    offers.addCategory(GAME_STORE, "Mounts", "Giddy up", "mount", 426)
	offers.addMount(GAME_STORE, "Mounts", "Moo Moo", "Did somebody say Moo?.", 148, 1127, 1000)
	offers.addMount(GAME_STORE, "Mounts", "Rainbow Pixel", "We're going to candy mountain!!", 103, 919, 1000)
	offers.addMount(GAME_STORE, "Mounts", "Krakoloss", "Did somebody say tentacles?", 166, 1377, 900)
	offers.addMount(GAME_STORE, "Mounts", "Santa", "Ride on santa's shoulders just like you wished when you were a kid!", 107, 929, 900)
	offers.addMount(GAME_STORE, "Mounts", "Singeing Steed", "Fire spreads wherever it gallops.", 174, 1439, 800)
	offers.addMount(GAME_STORE, "Mounts", "Phantasmal Jade", "My little pony, my little pony.", 167, 1385, 800)
	offers.addMount(GAME_STORE, "Mounts", "Coocoo", "Cutest lil bird you'll ever lay your hands on!", 104, 923, 750)
	offers.addMount(GAME_STORE, "Mounts", "Ice Flaming Lupos", "Ice or Fire?", 160, 1194, 700)
	offers.addMount(GAME_STORE, "Mounts", "Bareback Hound", "This wild beast will attack anything on sight!!", 173, 1410, 700)
	offers.addMount(GAME_STORE, "Mounts", "Phant", "Protected with golden armor.!", 175, 1459, 700)
	offers.addMount(GAME_STORE, "Mounts", "Cunning Hyaena", "Might hurt your butt to sit on it.", 169, 1390, 650)
	offers.addMount(GAME_STORE, "Mounts", "Benevolent Eventide Nandu", "Comes with a feathery seat.", 164, 1372, 600)
	offers.addMount(GAME_STORE, "Mounts", "Gold Sphinx", "Raised by Sol.", 115, 969, 600)
	offers.addMount(GAME_STORE, "Mounts", "Festive Snowman", "Will it melt?.", 142, 1105, 500)
	offers.addMount(GAME_STORE, "Mounts", "Jousting Eagle", "Armored bird, too heavy to fly.", 108, 955, 450)
	offers.addMount(GAME_STORE, "Mounts", "Ember Saurian", "Lizardy creature from the lagoons.", 111, 965, 450)
	offers.addMount(GAME_STORE, "Mounts", "Stone Rhino", "Hard as a Rock.", 116, 975, 450)
	offers.addMount(GAME_STORE, "Mounts", "Frogger", "Jumping ahead.", 105, 924, 400)
	offers.addMount(GAME_STORE, "Mounts", "Neon Sparkid", "Luminescent shining moth.", 98, 889, 400)
	offers.addMount(GAME_STORE, "Mounts", "Mole", "Dig dig dig.", 125, 1031, 400)
	offers.addMount(GAME_STORE, "Mounts", "Blackpelt", "Wont be taking any damage with that armor..", 58, 651, 400)
	offers.addMount(GAME_STORE, "Mounts", "Toxic Toad", "Hypnotoad deluxe edition.", 123, 1027, 400)
	offers.addMount(GAME_STORE, "Mounts", "Doombringer", "Shall curse your enemies with doom.", 53, 644, 350)
	offers.addMount(GAME_STORE, "Mounts", "Walker", "Mechanical experiment.", 43, 606, 300)
	offers.addMount(GAME_STORE, "Mounts", "Ladybug", "Lets out a mighty roar.", 27, 447, 300)

    -- Equipment
    offers.addCategory(GAME_STORE, "Equipment", "Item Sets", "item", 2331)
    offers.addItem(GAME_STORE, "Equipment", "Mage Starter Box", "Contains a full mage beginner set.", 28129, 1, 500)
    offers.addItem(GAME_STORE, "Equipment", "Paladin Starter Box", "Contains a full paladin beginner set.", 28128, 1, 500)
    offers.addItem(GAME_STORE, "Equipment", "Knight Starter Box", "Contains a full knight beginner set.", 28130, 1, 500)

    -- Outfits
    offers.addCategory(GAME_STORE, "Outfits", "Contains all addons.", "outfit", { mount = 0, type = 577, addons = 3, head = 9, body = 126, legs = 124, feet = 116 })
    offers.addOutfit(GAME_STORE, "Outfits", "Beggar Outfit", "Beggar", {mount = 0, type = 153, addons = 3, head = 9, body = 126, legs = 124, feet = 116}, {mount = 0, type = 157, addons = 3, head = 9, body = 126, legs = 124, feet = 116}, 400)
    offers.addOutfit(GAME_STORE, "Outfits", "Golden Outfit", "Golden outfit", {mount = 0, type = 957, addons = 3, head = 114, body = 114, legs = 114, feet = 114}, {mount = 0, type = 958, addons = 3, head = 114, body = 114, legs = 114, feet = 114}, 1500)
    offers.addOutfit(GAME_STORE, "Outfits", "Glire Suit Outfit", "Glire Suit", {mount = 0, type = 1263, addons = 3, head = 85, body = 91, legs = 114, feet = 85}, {mount = 0, type = 1262, addons = 3, head = 85, body = 91, legs = 114, feet = 85}, 1000)
    offers.addOutfit(GAME_STORE, "Outfits", "Alienist Outfit", "Alienist", {mount = 0, type = 1265, addons = 3, head = 68, body = 117, legs = 29, feet = 101}, {mount = 0, type = 1264, addons = 3, head = 68, body = 117, legs = 29, feet = 101}, 1000)
    offers.addOutfit(GAME_STORE, "Outfits", "Revenant Outfit", "Revenant", {mount = 0, type = 1348, addons = 3, head = 86, body = 114, legs = 114, feet = 86}, {mount = 0, type = 1349, addons = 3, head = 86, body = 114, legs = 114, feet = 86}, 800)
    offers.addOutfit(GAME_STORE, "Outfits", "Mercenary Outfit", "Mercenary", {mount = 0, type = 1025, addons = 3, head = 78, body = 78, legs = 77, feet = 96}, {mount = 0, type = 1024, addons = 3, head = 78, body = 78, legs = 77, feet = 96}, 700)
    offers.addOutfit(GAME_STORE, "Outfits", "Rascoohan Outfit", "Rascoohan", {mount = 0, type = 1354, addons = 3, head = 64, body = 79, legs = 64, feet = 64}, {mount = 0, type = 1355, addons = 3, head = 64, body = 79, legs = 64, feet = 64}, 700)
    offers.addOutfit(GAME_STORE, "Outfits", "Dragon Slayer Outfit", "Dragon Slayer", {mount = 0, type = 1344, addons = 3, head = 120, body = 120, legs = 120, feet = 120}, {mount = 0, type = 1345, addons = 3, head = 120, body = 120, legs = 120, feet = 120}, 700)
    offers.addOutfit(GAME_STORE, "Outfits", "Jouster Outfit", "Jouster", {mount = 0, type = 1350, addons = 3, head = 108, body = 111, legs = 74, feet = 69}, {mount = 0, type = 1351, addons = 3, head = 108, body = 111, legs = 74, feet = 69}, 650)
    offers.addOutfit(GAME_STORE, "Outfits", "Discoverer Outfit", "Discoverer", {mount = 0, type = 1002, addons = 3, head = 114, body = 94, legs = 95, feet = 95}, {mount = 0, type = 1001, addons = 3, head = 114, body = 94, legs = 95, feet = 95}, 600)
    offers.addOutfit(GAME_STORE, "Outfits", "Poltergeist Outfit", "Poltergeist", {mount = 0, type = 1180, addons = 3, head = 114, body = 114, legs = 128, feet = 113}, {mount = 0, type = 1179, addons = 3, head = 114, body = 114, legs = 128, feet = 113}, 550)
    offers.addOutfit(GAME_STORE, "Outfits", "Tomb Assassin Outfit", "Tomb Assassin", {mount = 0, type = 1184, addons = 3, head = 98, body = 115, legs = 77, feet = 114}, {mount = 0, type = 1183, addons = 3, head = 98, body = 115, legs = 77, feet = 114}, 550)
    offers.addOutfit(GAME_STORE, "Outfits", "Forest Warden Outfit", "Forest Warden", {mount = 0, type = 1458, addons = 3, head = 114, body = 87, legs = 22, feet = 3}, {mount = 0, type = 1457, addons = 3, head = 114, body = 87, legs = 22, feet = 3}, 500)
    offers.addOutfit(GAME_STORE, "Outfits", "Retro Hunter Outfit", "Retro Hunter", {mount = 0, type = 951, addons = 3, head = 95, body = 75, legs = 20, feet = 114}, {mount = 0, type = 950, addons = 3, head = 95, body = 75, legs = 20, feet = 114}, 450)
    offers.addOutfit(GAME_STORE, "Outfits", "Retro Knight Outfit", "Retro Knight", {mount = 0, type = 939, addons = 3, head = 83, body = 91, legs = 87, feet = 0}, {mount = 0, type = 938, addons = 3, head = 83, body = 91, legs = 87, feet = 0}, 450)
    offers.addOutfit(GAME_STORE, "Outfits", "Retro Mage Outfit", "Retro Mage", {mount = 0, type = 941, addons = 3, head = 114, body = 70, legs = 94, feet = 94}, {mount = 0, type = 940, addons = 3, head = 114, body = 70, legs = 94, feet = 94}, 450)
    offers.addOutfit(GAME_STORE, "Outfits", "Retro Noblewoman Outfit", "Retro Noblewoman", {mount = 0, type = 943, addons = 3, head = 0, body = 82, legs = 0, feet = 0}, {mount = 0, type = 942, addons = 3, head = 0, body = 82, legs = 0, feet = 0}, 450)
    offers.addOutfit(GAME_STORE, "Outfits", "Retro Summoner Outfit", "Retro Summoner", {mount = 0, type = 945, addons = 3, head = 94, body = 114, legs = 128, feet = 79}, {mount = 0, type = 944, addons = 3, head = 94, body = 114, legs = 128, feet = 79}, 450)
    offers.addOutfit(GAME_STORE, "Outfits", "Retro Warrior Outfit", "Retro Warrior", {mount = 0, type = 947, addons = 3, head = 0, body = 76, legs = 124, feet = 0}, {mount = 0, type = 946, addons = 3, head = 0, body = 76, legs = 124, feet = 0}, 450)
    offers.addOutfit(GAME_STORE, "Outfits", "Sun priest Outfit", "Sun Priest", {mount = 0, type = 1054, addons = 3, head = 114, body = 94, legs = 101, feet = 114}, {mount = 0, type = 1053, addons = 3, head = 114, body = 94, legs = 101, feet = 114}, 450)
    offers.addOutfit(GAME_STORE, "Outfits", "Dream Warden Outfit", "Dream Warden", {mount = 0, type = 577, addons = 3, head = 9, body = 126, legs = 124, feet = 116}, {mount = 0, type = 578, addons = 3, head = 9, body = 126, legs = 124, feet = 116}, 400)
    offers.addOutfit(GAME_STORE, "Outfits", "Dream Warrior Outfit", "Dream Warrior", {mount = 0, type = 1087, addons = 3, head = 0, body = 0, legs = 97, feet = 114}, {mount = 0, type = 1088, addons = 3, head = 0, body = 0, legs = 97, feet = 114}, 350)
end

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
            handlers.gameStoreFetch(player, GAME_STORE, DONATION_URL, CODE_GAMESTORE)
        elseif action == "purchase" then
            handlers.gameStorePurchase(player, data, GAME_STORE, CODE_GAMESTORE)
        elseif action == "gift" then
            handlers.gameStorePurchaseGift(player, data, GAME_STORE, CODE_GAMESTORE)
        end
    end
end

LoginEvent:type("login")
LoginEvent:register()
ExtendedEvent:type("extendedopcode")
ExtendedEvent:register()
