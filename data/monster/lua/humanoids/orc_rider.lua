-- Version: 7.0
-- Monster: https://tibia.fandom.com/wiki/Orc_Rider
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc_Rider
---


local mType = Game.createMonsterType("Orc Rider")
local monster = {}

monster.description = "an orc rider"
monster.experience = 110
monster.outfit = {
	lookType = 4,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 180
monster.maxHealth = 180
monster.race = "blood"
monster.corpse = 6010
monster.speed = 130
monster.manaCost = 490

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
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
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Orc arga Huummmak!", yell = false },
	{ text = "Grrrrrrr", yell = false },
}

monster.loot = {
	{ id = 2920, chance = 980 }, -- torch
	{ id = "wolf tooth chain", chance = 10210 }, -- wolf tooth chain
	{ id = "gold coin", chance = 46000, maxCount = 81 },
	{ id = "obsidian lance", chance = 1100 },
	{ id = "orcish axe", chance = 6880 },
	{ id = "scale armor", chance = 610 },
	{ id = "battle shield", chance = 9900 },
	{ id = "meat", chance = 24000, maxCount = 3 },
	{ id = "orc tooth", chance = 2000 },
	{ id = "warwolf fur", chance = 9410 },
	{ id = "orc leather", chance = 9760 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -130 },
}

monster.defenses = {
	defense = 15,
	armor = 9,
	mitigation = 0.51,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 260},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)