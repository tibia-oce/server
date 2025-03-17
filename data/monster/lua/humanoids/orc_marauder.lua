-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Orc_Marauder
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc_Marauder
---


local mType = Game.createMonsterType("Orc Marauder")
local monster = {}

monster.description = "an orc marauder"
monster.experience = 205
monster.outfit = {
	lookType = 342,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 235
monster.maxHealth = 235
monster.race = "blood"
monster.corpse = 10334
monster.speed = 195
monster.manaCost = 490

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
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{ id = "gold coin", chance = 55000, maxCount = 90 },
	{ id = "obsidian lance", chance = 1110 },
	{ id = "orcish axe", chance = 1320 },
	{ id = "crossbow", chance = 440 },
	{ id = "bow", chance = 5210 },
	{ id = "meat", chance = 24600 },
	{ id = "silkweaver bow", chance = 70 },
	{ id = "orc tooth", chance = 3890 },
	{ id = "shaggy tail", chance = 10090 },
	{ id = "broken crossbow", chance = 4830 },
	{ id = "orc leather", chance = 3800 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -100, range = 7, shootEffect = CONST_ANI_ONYXARROW, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 16,
	mitigation = 0.83,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 390},
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
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
