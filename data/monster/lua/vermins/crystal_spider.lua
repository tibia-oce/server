-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Crystal_Spider
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Crystal_Spider
---


local mType = Game.createMonsterType("Crystal Spider")
local monster = {}

monster.description = "a crystal spider"
monster.experience = 900
monster.outfit = {
	lookType = 263,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1250
monster.maxHealth = 1250
monster.race = "venom"
monster.corpse = 7344
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Screeech!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 197 },  -- 2148
	{ id = "strong mana potion", chance = 14994 },  -- 7589
	{ id = "plate armor", chance = 9899 },  -- 2463
	{ id = 7364, chance = 5908, minCount = 1, maxCount = 6 },  -- sniper arrow
	{ id = "steel helmet", chance = 5166 },  -- 2457
	{ id = 7441, chance = 4910 },  -- ice cube
	{ id = "crystal sword", chance = 2523 },  -- 7449
	{ id = "spider silk", chance = 1974 },  -- 5879
	{ id = "crystal necklace", chance = 1623 },  -- 2125
	{ id = 2124, chance = 1581 },  -- crystal ring
	{ id = 2169, chance = 1504 },  -- time ring
	{ id = "knight legs", chance = 753 },  -- 2477
	{ id = "shard", chance = 717 },  -- 7290
	{ id = "glacier mask", chance = 665 },  -- 7902
	{ id = "knight armor", chance = 549 },  -- 2476
	{ id = "sapphire hammer", chance = 140 },  -- 7437
	{ id = "platinum amulet", chance = 119 },  -- 2171
	{ id = "jewelled backpack", chance = 81 },  -- 5801
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250, condition = { type = CONDITION_POISON, totalDamage = 160, interval = 4000 } },
	{ name = "speed", interval = 2000, chance = 15, speed = -800, range = 7, radius = 6, effect = CONST_ME_POFF, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -50, maxDamage = -100, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, range = 7, shootEffect = CONST_ANI_SNOWBALL, target = true, duration = 10000 },
}

monster.defenses = {
	defense = 0,
	armor = 43,
	mitigation = 1.60,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 230},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
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