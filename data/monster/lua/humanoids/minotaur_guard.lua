-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Minotaur_Guard
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur_Guard
---


local mType = Game.createMonsterType("Minotaur Guard")
local monster = {}

monster.description = "a minotaur guard"
monster.experience = 160
monster.outfit = {
	lookType = 29,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 185
monster.maxHealth = 185
monster.race = "blood"
monster.corpse = 5983
monster.speed = 95
monster.manaCost = 550

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 20,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
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
	{ text = "Kirrl Karrrl!", yell = false },
	{ text = "Kaplar", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 59732, minCount = 1, maxCount = 20 },  -- 2148
	{ id = "minotaur horn", chance = 8176, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "piece of warrior armor", chance = 4986 },  -- 12438
	{ id = "brass armor", chance = 4141 },  -- 2465
	{ id = "chain armor", chance = 3010 },  -- 2464
	{ id = "battle shield", chance = 2096 },  -- 2513
	{ id = "minotaur leather", chance = 947 },  -- 5878
	{ id = "fishing rod", chance = 473 },  -- 2580
	{ id = "double axe", chance = 431 },  -- 2387
	{ id = "health potion", chance = 412 },  -- 7618
	{ id = 7401, chance = 98 },  -- minotaur trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
}

monster.defenses = {
	defense = 20,
	armor = 15,
	mitigation = 0.83,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)