-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Weeper
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Weeper
---


local mType = Game.createMonsterType("Weeper")
local monster = {}

monster.description = "a weeper"
monster.experience = 5800
monster.outfit = {
	lookType = 489,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 6800
monster.maxHealth = 6800
monster.race = "fire"
monster.corpse = 15907
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 5,
	color = 157,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Moooaaan", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 199 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "eye of a weeper", chance = 15426 },  -- 18426
	{ id = "ultimate health potion", chance = 15129, minCount = 1, maxCount = 2 },  -- 8473
	{ id = "blazing bone", chance = 15117 },  -- 18425
	{ id = "small ruby", chance = 15106, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "great mana potion", chance = 14568, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "fiery heart", chance = 13116 },  -- 10553
	{ id = "magma clump", chance = 12579 },  -- 18424
	{ id = "brown crystal splinter", chance = 12396, minCount = 1, maxCount = 2 },  -- 18417
	{ id = "prismatic bolt", chance = 11641, minCount = 1, maxCount = 5 },  -- 18435
	{ id = "red crystal fragment", chance = 9091 },  -- 18420
	{ id = "violet crystal shard", chance = 5432 },  -- 18414
	{ id = "fire sword", chance = 3248 },  -- 2392
	{ id = "fire axe", chance = 2184 },  -- 2432
	{ id = "wand of everblazing", chance = 1464 },  -- 18409
	{ id = 13757, chance = 1281 },  -- coal
	{ id = "magma legs", chance = 800 },  -- 7894
	{ id = "magma coat", chance = 720 },  -- 7899
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -400, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 3000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -80, maxDamage = -250, radius = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -600, length = 5, spread = 0, effect = CONST_ME_BLOCKHIT, target = false, duration = 30000 },
}

monster.defenses = {
	defense = 50,
	armor = 76,
	mitigation = 2.19,
	{ name = "invisible", interval = 2000, chance = 5, effect = CONST_ME_MAGIC_RED },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)