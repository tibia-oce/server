-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Killer_Caiman
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Killer_Caiman
---


local mType = Game.createMonsterType("Killer Caiman")
local monster = {}

monster.description = "a killer caiman"
monster.experience = 900
monster.outfit = {
	lookType = 358,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 10221
monster.speed = 93
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
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
	{ id = "gold coin", chance = 99998, minCount = 1, maxCount = 180 },  -- 2148
	{ id = "ham", chance = 39825 },  -- 2671
	{ id = "piece of crocodile leather", chance = 25040, minCount = 1, maxCount = 2 },  -- 11196
	{ id = "small emerald", chance = 9953, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "obsidian lance", chance = 4985 },  -- 2425
	{ id = "bunch of ripe rice", chance = 4914, minCount = 1, maxCount = 2 },  -- 11245
	{ id = "giant shimmering pearl", chance = 986 },
	{ id = "crocodile boots", chance = 499 },  -- 3982
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -180 },
}

monster.defenses = {
	defense = 35,
	armor = 40,
	mitigation = 0.38,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 186},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
