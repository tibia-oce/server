-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Orc_Berserker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc_Berserker
---


local mType = Game.createMonsterType("Orc Berserker")
local monster = {}

monster.description = "an orc berserker"
monster.experience = 195
monster.outfit = {
	lookType = 8,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 210
monster.maxHealth = 210
monster.race = "blood"
monster.corpse = 5980
monster.speed = 125
monster.manaCost = 590

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 40,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
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
	{ text = "KRAK ORRRRRRK!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 54845, minCount = 1, maxCount = 25 },  -- 2148
	{ id = "orcish gear", chance = 10263 },  -- 12433
	{ id = "ham", chance = 9831 },  -- 2671
	{ id = 2381, chance = 6973 },  -- halberd
	{ id = "battle axe", chance = 5790 },  -- 2378
	{ id = "hunting spear", chance = 4835 },  -- 3965
	{ id = "orc leather", chance = 4210 },  -- 12435
	{ id = "orc tooth", chance = 2805 },  -- 11113
	{ id = "chain armor", chance = 969 },  -- 2464
	{ id = 2044, chance = 822 },  -- lamp
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -200 },
}

monster.defenses = {
	defense = 15,
	armor = 12,
	mitigation = 0.30,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 250},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
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
