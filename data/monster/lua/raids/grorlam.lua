-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Grorlam
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Grorlam
---


local mType = Game.createMonsterType("Grorlam")
local monster = {}

monster.description = "Grorlam"
monster.experience = 2400
monster.outfit = {
	lookType = 205,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 205,
	bossRace = RARITY_NEMESIS,
}

monster.health = 3000
monster.maxHealth = 3000
monster.race = "blood"
monster.corpse = 6005
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 3,
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

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 98 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "shiny stone", chance = 100000 },  -- 11227
	{ id = "small amethyst", chance = 75000, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "steel shield", chance = 60417 },  -- 2509
	{ id = "sulphurous stone", chance = 60417 },  -- 11232
	{ id = "power ring", chance = 50000 },  -- 2166
	{ id = "red gem", chance = 50000 },  -- 2156
	{ id = "small stone", chance = 12500, minCount = 1, maxCount = 4 },  -- 1294
	{ id = "steel boots", chance = 8333 },  -- 2645
	{ id = 2124, chance = 2083 },  -- crystal ring
	{ id = 2553, chance = 2083 },  -- pick
	{ id = "scale armor", chance = 2083 },  -- 2483
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 75, attack = 60 },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -200, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 15,
	mitigation = 1.60,
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 6, effect = CONST_ME_MAGIC_RED, speed = 240},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -1 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)