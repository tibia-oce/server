-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Hairman_the_Huge
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hairman_the_Huge
---


local mType = Game.createMonsterType("Hairman the Huge")
local monster = {}

monster.description = "Hairman the Huge"
monster.experience = 335
monster.outfit = {
	lookType = 116,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 425,
	bossRace = RARITY_NEMESIS,
}

monster.health = 600
monster.maxHealth = 600
monster.race = "blood"
monster.corpse = 6043
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 14,
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
	canPushCreatures = true,
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
	{ text = "Hugah!", yell = false },
	{ text = "Huaauaauaauaa!", yell = false },
	{ text = "Ungh! Ungh!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 92308, minCount = 10, maxCount = 75 },  -- 2148
	{ id = "banana", chance = 30769, minCount = 1, maxCount = 2 },  -- 2676
	{ id = "ape fur", chance = 15385 },  -- 5883
	{ id = "club ring", chance = 15385 },  -- 2209
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 45, attack = 40 },
}

monster.defenses = {
	defense = 25,
	armor = 20,
	--	mitigation = ???,
	{ name = "speed", interval = 1000, chance = 7, effect = CONST_ME_MAGIC_RED, speed = 230},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 1 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -1 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -1 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)