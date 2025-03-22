-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Juvenile_Cyclops
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Juvenile_Cyclops
---


local mType = Game.createMonsterType("Juvenile Cyclops")
local monster = {}

monster.description = "a juvenile cyclops"
monster.experience = 130
monster.outfit = {
	lookType = 22,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 260
monster.maxHealth = 260
monster.race = "blood"
monster.corpse = 5962
monster.speed = 80
monster.manaCost = 490

monster.changeTarget = {
	interval = 2000,
	chance = 5,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = false,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 25 },  -- 2148
	{ id = "meat", chance = 22244 },  -- 2666
	{ id = "mace", chance = 20842 },  -- 2398
	{ id = "hatchet", chance = 20240 },  -- 2388
	{ id = 2376, chance = 17836 },  -- sword
	{ id = "studded legs", chance = 12425 },  -- 2468
	{ id = "chain armor", chance = 12024 },  -- 2464
	{ id = "chain helmet", chance = 8818 },  -- 2458
	{ id = "plate shield", chance = 2405 },  -- 2510
	{ id = "health potion", chance = 1002 },  -- 7618
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 20, attack = 30 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -20, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 22,
	armor = 11,
	mitigation = 0.62,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
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