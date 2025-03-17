-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Hellfire_Fighter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hellfire_Fighter
---


local mType = Game.createMonsterType("Hellfire Fighter")
local monster = {}

monster.description = "a hellfire fighter"
monster.experience = 3800
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3800
monster.maxHealth = 3800
monster.race = "fire"
monster.corpse = 6323
monster.speed = 165
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
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 5,
	color = 212,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 246 },  -- 2148
	{ id = "burnt scroll", chance = 50162 },  -- 2239
	{ id = "blank rune", chance = 30076, minCount = 1, maxCount = 2 },  -- 2260
	{ id = "demonic essence", chance = 15076 },  -- 6500
	{ id = "soul orb", chance = 11794 },  -- 5944
	{ id = "fiery heart", chance = 10028 },  -- 10553
	{ id = "wand of inferno", chance = 9417 },  -- 2187
	{ id = "piece of hellfire armor", chance = 4995 },  -- 10581
	{ id = "fire sword", chance = 3984 },  -- 2392
	{ id = "emerald bangle", chance = 2075 },  -- 2127
	{ id = "small diamond", chance = 1441 },  -- 2145
	{ id = "platinum coin", chance = 936 },  -- 2152
	{ id = "magma legs", chance = 845 },  -- 7894
	{ id = 13757, chance = 536 },  -- coal
	{ id = "magma coat", chance = 483 },  -- 7899
	{ id = "fire axe", chance = 407 },  -- 2432
	{ id = 2136, chance = 241 },  -- demonbone amulet
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -520 },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -392, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -330, range = 7, radius = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "hellfire fighter soulfire", interval = 2000, chance = 15, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 62,
	mitigation = 1.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -25 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)