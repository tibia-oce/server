-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Ghoulish_Hyaena
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ghoulish_Hyaena
---


local mType = Game.createMonsterType("Ghoulish Hyaena")
local monster = {}

monster.description = "a ghoulish hyaena"
monster.experience = 195
monster.outfit = {
	lookType = 94,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 400
monster.maxHealth = 400
monster.race = "blood"
monster.corpse = 6026
monster.speed = 102
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
	pushable = true,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 30,
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
	{ text = "Grawrrr!!", yell = false },
	{ text = "Hoouu!", yell = false },
}

monster.loot = {
	{ id = "small ruby", chance = 2700, maxCount = 2 },
	{ id = "gold coin", chance = 89000, maxCount = 40 },
	{ id = "meat", chance = 51060, maxCount = 3 },
	{ id = "worm", chance = 65000, maxCount = 7 },
	{ id = "health potion", chance = 19840 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -112, condition = { type = CONDITION_POISON, totalDamage = 10, interval = 4000 } }, -- poison
	{ name = "ghoulish hyaena wave", interval = 2000, chance = 15, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 21,
	mitigation = 0.80,
	{ name = "speed", interval = 2000, chance = 15, speed = 204},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 60 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
