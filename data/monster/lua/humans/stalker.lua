-- Version: 6.4
-- Monster: https://tibia.fandom.com/wiki/Stalker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Stalker
---


local mType = Game.createMonsterType("Stalker")
local monster = {}

monster.description = "a stalker"
monster.experience = 90
monster.outfit = {
	lookType = 128,
	lookHead = 97,
	lookBody = 116,
	lookLegs = 95,
	lookFeet = 95,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 120
monster.maxHealth = 120
monster.race = "blood"
monster.corpse = 18230
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 60,
	random = 40,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 13146, minCount = 1, maxCount = 8 },  -- 2148
	{ id = "throwing knife", chance = 11140, minCount = 1, maxCount = 2 },  -- 2410
	{ id = "blank rune", chance = 8811 },  -- 2260
	{ id = "brass shield", chance = 5648 },  -- 2511
	{ id = "brass legs", chance = 3530 },  -- 2478
	{ id = "miraculum", chance = 1538 },  -- 12430
	{ id = "obsidian lance", chance = 1178 },  -- 2425
	{ id = "katana", chance = 520 },  -- 2412
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -20, maxDamage = -30, range = 1, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 14,
	{ name = "invisible", interval = 2000, chance = 40, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
