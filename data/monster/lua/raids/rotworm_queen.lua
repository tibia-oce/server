-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Rotworm_Queen
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Rotworm_Queen
---


local mType = Game.createMonsterType("Rotworm Queen")
local monster = {}

monster.description = "rotworm queen"
monster.experience = 75
monster.outfit = {
	lookType = 295,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 105
monster.maxHealth = 105
monster.race = "blood"
monster.corpse = 8119
monster.speed = 63
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0,
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
	canPushCreatures = false,
	staticAttackChance = 50,
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
}

monster.loot = {
	{ id = "gold coin", chance = 76712, minCount = 3, maxCount = 110 },  -- 2148
	{ id = "worm", chance = 49315, minCount = 3, maxCount = 50 },  -- 3976
	{ id = "legion helmet", chance = 17808 },  -- 2480
	{ id = "gland", chance = 13699 },  -- 8971
	{ id = 13757, chance = 1370 },  -- coal
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -5, maxDamage = -80 },
}

monster.defenses = {
	defense = 15,
	armor = 10,
	mitigation = 0.58,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
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