-- Version: 7.1
-- Monster: https://tibia.fandom.com/wiki/Amazon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Amazon
---


local mType = Game.createMonsterType("Amazon")
local monster = {}

monster.description = "an amazon"
monster.experience = 60
monster.outfit = {
	lookType = 137,
	lookHead = 113,
	lookBody = 120,
	lookLegs = 95,
	lookFeet = 115,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 110
monster.maxHealth = 110
monster.race = "blood"
monster.corpse = 20323
monster.speed = 86
monster.manaCost = 390

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{ text = "Your head shall be mine!", yell = false },
	{ text = "Your head will be mine!", yell = false },
	{ text = "Yeeee ha!", yell = false },
}

monster.loot = {
	{ id = 2229, chance = 80013, minCount = 1, maxCount = 2 },  -- skull
	{ id = "dagger", chance = 79958 },  -- 2379
	{ id = "gold coin", chance = 40051, minCount = 1, maxCount = 20 },  -- 2148
	{ id = "brown bread", chance = 29567 },  -- 2691
	{ id = "sabre", chance = 23226 },  -- 2385
	{ id = "girlish hair decoration", chance = 9858 },  -- 12399
	{ id = "protective charm", chance = 5246 },  -- 12400
	{ id = 2050, chance = 1007 },  -- torch
	{ id = "crystal necklace", chance = 238 },  -- 2125
	{ id = "small ruby", chance = 124 },  -- 2147
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -45 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -40, range = 5, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 10,
	mitigation = 0.28,
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
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
