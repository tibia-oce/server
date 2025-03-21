-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Brutus_Bloodbeard
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Brutus_Bloodbeard
---


local mType = Game.createMonsterType("Brutus Bloodbeard")
local monster = {}

monster.description = "Brutus Bloodbeard"
monster.experience = 795
monster.outfit = {
	lookType = 98,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1555
monster.maxHealth = 1555
monster.race = "blood"
monster.corpse = 18197
monster.speed = 120
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
}

monster.loot = {
	{ id = 6099, chance = 100000 },  -- brutus bloodbeard's hat
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 154 },  -- 2148
	{ id = 2229, chance = 69231, minCount = 1, maxCount = 2 },  -- skull
	{ id = "plate armor", chance = 46154 },  -- 2463
	{ id = "meat", chance = 30769 },  -- 2666
	{ id = "small diamond", chance = 23077 },  -- 2145
	{ id = "great health potion", chance = 15385 },  -- 7591
	{ id = "knight armor", chance = 15385 },  -- 2476
	{ id = "very old piece of paper", chance = 15385 },  -- 10103
	{ id = "dagger", chance = 7692 },  -- 2379
	{ id = "pirate backpack", chance = 7692 },  -- 5926
	{ id = "protection amulet", chance = 7692 },  -- 2200
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -175 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -175, range = 7, shootEffect = CONST_ANI_THROWINGSTAR, target = false },
	{ name = "drunk", interval = 2000, chance = 10, length = 3, spread = 2, effect = CONST_ME_POFF, target = false, duration = 5000 },
}

monster.defenses = {
	defense = 50,
	armor = 35,
	mitigation = 1.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -1 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -1 },
	{ type = COMBAT_HOLYDAMAGE, percent = 1 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)