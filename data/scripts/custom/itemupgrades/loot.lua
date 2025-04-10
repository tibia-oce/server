-- Global loot handling logic
-- Manages the registration of crystal items as loot
-- Check if global loot system is loaded
if not _G["registerGlobalLoot"] then
    dofile("data/lib/custom/globalloot.lua")
end

-- Crystal global loot table
local crystalGlobalLoot = {{
    itemId = US_CONFIG[1][ITEM_UPGRADE_CRYSTAL],
    chance = 50000,
    maxCount = 2,
    requiredLvl = 10
}, {
    itemId = US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL],
    chance = 50000,
    maxCount = 3,
    requiredLvl = 20
}, {
    itemId = US_CONFIG[1][ITEM_ALTER_CRYSTAL],
    chance = 50000,
    maxCount = 3,
    requiredLvl = 20
}, {
    itemId = US_CONFIG[1][ITEM_SCOURING_CRYSTAL],
    chance = 50000,
    maxCount = 2,
    requiredLvl = 30
}, {
    itemId = US_CONFIG[1][ITEM_EXALT_CRYSTAL],
    chance = 50000,
    maxCount = 2,
    requiredLvl = 30
}, {
    itemId = US_CONFIG[1][ITEM_CHAOS_CRYSTAL],
    chance = 50000,
    maxCount = 2,
    requiredLvl = 30
}, {
    itemId = US_CONFIG.ITEM_ANNULMENT_CRYSTAL,
    chance = 25000,
    maxCount = 1,
    requiredLvl = 20
}, {
    itemId = US_CONFIG.ITEM_DIVINE_CRYSTAL,
    chance = 25000,
    maxCount = 1,
    requiredLvl = 20
}, {
    itemId = US_CONFIG.ITEM_UPGRADE_CATALYST,
    chance = 25000,
    maxCount = 1,
    requiredLvl = 20
}, {
    itemId = US_CONFIG.ITEM_MIND_CRYSTAL,
    chance = 50,
    maxCount = 1,
    requiredLvl = 20
}, {
    itemId = US_CONFIG.ITEM_MIRRORED_CRYSTAL,
    chance = 50,
    maxCount = 1,
    requiredLvl = 20
}}

-- Register crystal loot entries
if _G["registerGlobalLoot"] then
    registerGlobalLoot(crystalGlobalLoot)
end
