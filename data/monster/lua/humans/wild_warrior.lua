-- Version: 5.0
-- Monster: https://tibia.fandom.com/wiki/Wild_Warrior
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Wild_Warrior
---


local mType = Game.createMonsterType("Wild Warrior")
local monster = {}

monster.description = "a wild warrior"
monster.experience = 60
monster.outfit = {
	lookType = 131,
	lookHead = 38,
	lookBody = 38,
	lookLegs = 38,
	lookFeet = 38,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 135
monster.maxHealth = 135
monster.race = "blood"
monster.corpse = 18250
monster.speed = 95
monster.manaCost = 420

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
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
	{ text = "Gimme your money!", yell = false },
	{ text = "An enemy!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 65761, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "axe", chance = 21120 },  -- 2386
	{ id = "brass shield", chance = 17516 },  -- 2511
	{ id = "mace", chance = 13277 },  -- 2398
	{ id = "egg", chance = 12705, minCount = 1, maxCount = 2 },  -- 2695
	{ id = "chain helmet", chance = 5262 },  -- 2458
	{ id = "brass armor", chance = 2817 },  -- 2465
	{ id = "steel shield", chance = 1251 },  -- 2509
	{ id = "iron helmet", chance = 1001 },  -- 2459
	{ id = 2110, chance = 551 },  -- doll
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },
}

monster.defenses = {
	defense = 20,
	armor = 8,
	mitigation = 0.46,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 190},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
