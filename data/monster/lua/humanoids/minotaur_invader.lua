-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Minotaur_Invader
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur_Invader
---


local mType = Game.createMonsterType("Minotaur Invader")
local monster = {}

monster.description = "a minotaur invader"
monster.experience = 1600
monster.outfit = {
	lookType = 29,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1850
monster.maxHealth = 1850
monster.race = "blood"
monster.corpse = 5983
monster.speed = 120
monster.manaCost = 0

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
	convinceable = false,
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
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "For the victory!", yell = false },
	{ text = "We will crush the enemy!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 59640, maxCount = 160 }, -- gold coin
	{ id = 11472, chance = 8330, maxCount = 2 }, -- minotaur horn
	{ id = "piece of warrior armor", chance = 5040 }, -- piece of warrior armor
	{ id = "minotaur leather", chance = 1000 }, -- minotaur leather
	{ id = "minotaur trophy", chance = 90 }, -- minotaur trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350 },
}

monster.defenses = {
	defense = 20,
	armor = 40,
	mitigation = 1.76,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)