-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Mutated_Tiger
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mutated_Tiger
---


local mType = Game.createMonsterType("Mutated Tiger")
local monster = {}

monster.description = "a mutated tiger"
monster.experience = 750
monster.outfit = {
	lookType = 318,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1100
monster.maxHealth = 1100
monster.race = "blood"
monster.corpse = 9913
monster.speed = 100
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 100,
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
	{ text = "GRAAARRRRRR", yell = true },
	{ text = "CHHHHHHHHHHH", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 176 },  -- 2148
	{ id = "meat", chance = 29942, minCount = 1, maxCount = 2 },  -- 2666
	{ id = "striped fur", chance = 20595 },  -- 11210
	{ id = "sabretooth", chance = 11148 },  -- 11228
	{ id = "strong health potion", chance = 6016, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "life ring", chance = 5937, minCount = 1, maxCount = 2 },  -- 2168
	{ id = "glorious axe", chance = 1001 },  -- 7454
	{ id = "silky tapestry", chance = 930 },  -- 9959
	{ id = "guardian shield", chance = 459 },  -- 2515
	{ id = "angelic axe", chance = 438 },  -- 7436
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, length = 5, spread = 3, effect = CONST_ME_BLOCKHIT, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	mitigation = 0.99,
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 150, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)