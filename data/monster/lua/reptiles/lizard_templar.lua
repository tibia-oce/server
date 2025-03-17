-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Lizard_Templar
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lizard_Templar
---


local mType = Game.createMonsterType("Lizard Templar")
local monster = {}

monster.description = "a lizard templar"
monster.experience = 155
monster.outfit = {
	lookType = 113,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 410
monster.maxHealth = 410
monster.race = "blood"
monster.corpse = 4239
monster.speed = 87
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{ text = "Hissss!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 83791, minCount = 1, maxCount = 60 },  -- 2148
	{ id = "short sword", chance = 9925 },  -- 2406
	{ id = 2376, chance = 4948 },  -- sword
	{ id = "steel helmet", chance = 1957 },  -- 2457
	{ id = "morning star", chance = 1929 },  -- 2394
	{ id = "plate armor", chance = 1043 },  -- 2463
	{ id = "lizard scale", chance = 967 },  -- 5881
	{ id = "lizard leather", chance = 943 },  -- 5876
	{ id = "health potion", chance = 861 },  -- 7618
	{ id = "templar scytheblade", chance = 536 },  -- 3963
	{ id = "small emerald", chance = 263 },  -- 2149
	{ id = "salamander shield", chance = 110 },  -- 3975
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },
}

monster.defenses = {
	defense = 20,
	armor = 26,
	mitigation = 0.51,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
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
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)