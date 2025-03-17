-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Destroyer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Destroyer
---


local mType = Game.createMonsterType("Destroyer")
local monster = {}

monster.description = "a destroyer"
monster.experience = 2500
monster.outfit = {
	lookType = 236,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3700
monster.maxHealth = 3700
monster.race = "undead"
monster.corpse = 6319
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "COME HERE AND DIE!", yell = true },
	{ text = "Destructiooooon!", yell = false },
	{ text = "It's a good day to destroy!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99528, minCount = 1, maxCount = 341 },  -- 2148
	{ id = "meat", chance = 54751 },  -- 2666
	{ id = "demonic essence", chance = 18942 },  -- 6500
	{ id = "crowbar", chance = 14871 },  -- 2416
	{ id = 2546, chance = 11031, minCount = 1, maxCount = 12 },  -- burst arrow
	{ id = "dark armor", chance = 10177 },  -- 2489
	{ id = "small amethyst", chance = 7497, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "soul orb", chance = 6921 },  -- 5944
	{ id = "metal spike", chance = 6887 },  -- 11215
	{ id = 2553, chance = 6067 },  -- pick
	{ id = "plate armor", chance = 4922 },  -- 2463
	{ id = "platinum coin", chance = 3881, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "giant sword", chance = 1492 },  -- 2393
	{ id = "great health potion", chance = 1065 },  -- 7591
	{ id = "chaos mace", chance = 856 },  -- 7427
	{ id = "steel boots", chance = 834 },  -- 2645
	{ id = "dreaded cleaver", chance = 803 },  -- 7419
	{ id = "mind stone", chance = 600 },  -- 2178
	{ id = "crystal necklace", chance = 554 },  -- 2125
	{ id = 6300, chance = 123 },  -- death ring
	{ id = "skull helmet", chance = 123 },  -- 5741
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 35,
	mitigation = 1.74,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 300},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -15 },
	{ type = COMBAT_HOLYDAMAGE, percent = -3 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)