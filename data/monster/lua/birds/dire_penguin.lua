-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Dire_Penguin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dire_Penguin
---


local mType = Game.createMonsterType("Dire Penguin")
local monster = {}

monster.description = "a dire penguin"
monster.experience = 119
monster.outfit = {
	lookType = 250,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 173
monster.maxHealth = 173
monster.race = "blood"
monster.corpse = 7334
monster.speed = 87
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 95,
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
	{ text = "Grrrrrr", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 64706, minCount = 1, maxCount = 10 },  -- 2148
	{ id = 2667 , chance = 9804, minCount = 1, maxCount = 4 },  -- fish
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -35, range = 7, radius = 1, shootEffect = CONST_ANI_SMALLSTONE, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "speed", interval = 2000, chance = 10, speed = -600, range = 7, radius = 4, effect = CONST_ME_POFF, target = false, duration = 9000 },
}

monster.defenses = {
	defense = 16,
	armor = 16,
	mitigation = 0.59,
	{ name = "speed", interval = 2000, chance = 15, range = 7, effect = CONST_ME_MAGIC_RED, speed = 174},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
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