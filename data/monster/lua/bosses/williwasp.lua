-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Willi_Wasp
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Willi_Wasp
---


local mType = Game.createMonsterType("Willi Wasp")
local monster = {}

monster.description = "a wasp"
monster.experience = 250
monster.outfit = {
	lookType = 44,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 250
monster.maxHealth = 250
monster.race = "venom"
monster.corpse = 5989
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	illusionable = true,
	canPushItems = false,
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
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 42 },  -- 2148
	{ id = "honeycomb", chance = 100000, minCount = 1, maxCount = 3 },  -- 5902
	{ id = "silver amulet", chance = 9375 },  -- 2170
	{ id = "small emerald", chance = 6250 },  -- 2149
	{ id = "small topaz", chance = 3125 },  -- 9970
}

monster.attacks = {
	{ name = "melee", interval = 1500, chance = 100, skill = 30, attack = 30, condition = { type = CONDITION_POISON, totalDamage = 25, interval = 4000 } },
}

monster.defenses = {
	defense = 10,
	armor = 10,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)