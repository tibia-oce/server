

local mType = Game.createMonsterType("Hide")
local monster = {}

monster.description = "Hide"
monster.experience = 240
monster.outfit = {
	lookType = 219,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 500
monster.maxHealth = 500
monster.race = "venom"
monster.corpse = 6060
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
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
	{ id = "platinum coin", chance = 100000, maxCount = 5 }, -- platinum coin
	{ id = "steel helmet", chance = 50000 }, -- steel helmet
	{ id = "spider silk", chance = 50000 }, -- spider silk
	{ id = 830, chance = 50000 }, -- terra hood
	{ id = 3371, chance = 50000 }, -- knight legs
	{ id = 3053, chance = 33333 }, -- time ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -140 },
	{ name = "melee", interval = 2000, chance = 100, skill = 60, attack = 40, condition = { type = CONDITION_POISON, totalDamage = 80, interval = 4000 } },
}

monster.defenses = {
	defense = 40,
	armor = 25,
	mitigation = 0.71,
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_RED, speed = 280},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 40 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)