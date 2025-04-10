-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Quara_Constrictor
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Quara_Constrictor
---


local mType = Game.createMonsterType("Quara Constrictor")
local monster = {}

monster.description = "a quara constrictor"
monster.experience = 380
monster.outfit = {
	lookType = 46,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 450
monster.maxHealth = 450
monster.race = "blood"
monster.corpse = 6065
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 45,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 2,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Boohaa!", yell = false },
	{ text = "Tssss!", yell = false },
	{ text = "Gluh! Gluh!", yell = false },
	{ text = "Gaaahhh!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 87644, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "quara tentacle", chance = 14523 },  -- 12443
	{ id = "longsword", chance = 6833 },  -- 2397
	{ id = "shrimp", chance = 5148 },  -- 2670
	{ id = "brass armor", chance = 4832 },  -- 2465
	{ id = "small amethyst", chance = 2991 },  -- 2150
	{ id = "fish fin", chance = 492 },  -- 5895
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150, effect = CONST_ME_DRAWBLOOD, condition = { type = CONDITION_POISON, totalDamage = 20, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -90, radius = 3, effect = CONST_ME_HITAREA, target = false },
	{ name = "quara constrictor freeze", interval = 2000, chance = 10, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -40, maxDamage = -70, range = 7, radius = 4, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "quara constrictor electrify", interval = 2000, chance = 10, range = 1, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 14,
	mitigation = 0.94,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
