-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/The_Old_Widow
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Old_Widow
---


local mType = Game.createMonsterType("The Old Widow")
local monster = {}

monster.description = "The Old Widow"
monster.experience = 4200
monster.outfit = {
	lookType = 208,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 3200
monster.maxHealth = 3200
monster.race = "blood"
monster.corpse = 5977
monster.speed = 219
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "giant spider", chance = 13, interval = 1000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 99519, minCount = 5, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 99038, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "spider silk", chance = 87981 },  -- 5879
	{ id = "steel helmet", chance = 76442 },  -- 2457
	{ id = "great health potion", chance = 66346, minCount = 1, maxCount = 4 },  -- 7591
	{ id = "knight armor", chance = 43269 },  -- 2476
	{ id = "energy ring", chance = 33173 },  -- 2167
	{ id = "stealth ring", chance = 32212 },  -- 2165
	{ id = 2169, chance = 32212 },  -- time ring
	{ id = "knight legs", chance = 25481 },  -- 2477
	{ id = "sweet smelling bait", chance = 22115 },  -- 13307
	{ id = "platinum amulet", chance = 21154 },  -- 2171
	{ id = "spool of yarn", chance = 9615 },  -- 5886
	{ id = "dreaded cleaver", chance = 3365 },  -- 7419
	{ id = "bloody edge", chance = 962 },  -- 7416
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -100, maxDamage = -500 },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -300, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 1000, chance = 20, speed = -850, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false, duration = 25000 },
	{ name = "poisonfield", interval = 1000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 21,
	armor = 45,
	--	mitigation = 1.54,
	{ name = "combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 225, maxDamage = 275, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 8, effect = CONST_ME_MAGIC_RED, speed = 438},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)