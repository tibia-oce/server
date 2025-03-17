-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Frost_Giant
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Frost_Giant
---


local mType = Game.createMonsterType("Frost Giant")
local monster = {}

monster.description = "a frost giant"
monster.experience = 150
monster.outfit = {
	lookType = 257,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 270
monster.maxHealth = 270
monster.race = "blood"
monster.corpse = 7330
monster.speed = 95
monster.manaCost = 490

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
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
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{ text = "Hmm Humansoup!", yell = false },
	{ text = "Stand still ya tasy snack!", yell = false },
	{ text = "Joh Thun!", yell = false },
	{ text = "Hörre Sjan Flan!", yell = false },
	{ text = "Bröre Smöde!", yell = false },
	{ text = "Forle Bramma", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 82000, maxCount = 40 },
	{ id = "club ring", chance = 130 }, -- club ring
	{ id = 2381, chance = 560 },
	{ id = "short sword", chance = 8140 },
	{ id = "dark helmet", chance = 180 },
	{ id = "battle shield", chance = 1350 },
	{ id = "meat", chance = 4970, maxCount = 2 },
	{ id = "shard", chance = 60 },
	{ id = "ice cube", chance = 2180 }, -- ice cube
	{ id = "norse shield", chance = 250 },
	{ id = "health potion", chance = 819 },
	{ id = "frost giant pelt", chance = 5000 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -90, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 22,
	mitigation = 0.46,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 190},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
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