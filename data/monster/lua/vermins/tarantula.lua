-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Tarantula
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Tarantula
---


local mType = Game.createMonsterType("Tarantula")
local monster = {}

monster.description = "a tarantula"
monster.experience = 120
monster.outfit = {
	lookType = 219,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 225
monster.maxHealth = 225
monster.race = "venom"
monster.corpse = 6060
monster.speed = 107
monster.manaCost = 485

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 79070, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "tarantula egg", chance = 9985 },  -- 11198
	{ id = "spider fangs", chance = 4834 },  -- 8859
	{ id = "brass legs", chance = 3025 },  -- 2478
	{ id = "plate shield", chance = 1941 },  -- 2510
	{ id = "steel helmet", chance = 917 },  -- 2457
	{ id = 2169, chance = 109 },  -- time ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90, condition = { type = CONDITION_POISON, totalDamage = 40, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, range = 1, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_CARNIPHILA, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 20,
	mitigation = 0.51,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 214},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
