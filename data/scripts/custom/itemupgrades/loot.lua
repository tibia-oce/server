-- Registers crystal loot items for the upgrade/crystal system.
-- Drop chance is expressed on a scale of 1 to 100000 (100000 == 100%),
-- and each entry has a minimum required monster/item level to prevent abuse
dofile("data/lib/custom/globalloot.lua")

local crystalGlobalLoot = {
    { itemId = US_CONFIG[1][ITEM_UPGRADE_CRYSTAL], chance = 50000, maxCount = 2, requiredLvl = 10 },
    { itemId = US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL], chance = 50000,  maxCount = 3, requiredLvl = 20 },
    { itemId = US_CONFIG[1][ITEM_ALTER_CRYSTAL], chance = 50000,  maxCount = 3, requiredLvl = 20 },
    { itemId = US_CONFIG[1][ITEM_SCOURING_CRYSTAL], chance = 50000,  maxCount = 2, requiredLvl = 30 },
    { itemId = US_CONFIG[1][ITEM_EXALT_CRYSTAL], chance = 50000,  maxCount = 2, requiredLvl = 30 },
    { itemId = US_CONFIG[1][ITEM_CHAOS_CRYSTAL], chance = 50000,  maxCount = 2, requiredLvl = 30 },
    { itemId = US_CONFIG.ITEM_ANNULMENT_CRYSTAL, chance = 25000,  maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_DIVINE_CRYSTAL, chance = 25000,  maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_UPGRADE_CATALYST, chance = 25000, maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_MIND_CRYSTAL, chance = 50,  maxCount = 1, requiredLvl = 20 },
    { itemId = US_CONFIG.ITEM_MIRRORED_CRYSTAL, chance = 50,  maxCount = 1, requiredLvl = 20 },
}

--- Registers crystal loot entries into the global loot table.
-- @param lootEntries table: A table of crystal loot entry tables.
registerGlobalLoot(crystalGlobalLoot)