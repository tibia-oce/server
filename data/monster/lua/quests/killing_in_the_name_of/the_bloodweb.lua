-- Version: 9.20
-- Monster: https://tibia.fandom.com/wiki/The_Bloodweb
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Bloodweb
---


local mType = Game.createMonsterType("The Bloodweb")
local monster = {}

monster.description = "The Bloodweb"
monster.experience = 1450
monster.outfit = {
	lookType = 263,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1750
monster.maxHealth = 1750
monster.race = "undead"
monster.corpse = 7344
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 8,
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
	canPushCreatures = false,
	staticAttackChance = 60,
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
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 9 },  -- 2152
	{ id = 7441, chance = 99242 },  -- ice cube
	{ id = "strong mana potion", chance = 71212 },  -- 7589
	{ id = "spider silk", chance = 65909 },  -- 5879
	{ id = "glacier mask", chance = 28788 },  -- 7902
	{ id = "glacier kilt", chance = 25758 },  -- 7896
	{ id = "sai", chance = 21212 },  -- 11306
	{ id = "sapphire hammer", chance = 12121 },  -- 7437
	{ id = "knight armor", chance = 8333 },  -- 2476
	{ id = "jewelled backpack", chance = 5303 },  -- 5801
	{ id = "knight legs", chance = 5303 },  -- 2477
	{ id = "shard", chance = 1515 },  -- 7290
	{ id = 2169, chance = 1515 },  -- time ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -280 },
	{ name = "melee", interval = 2000, chance = 100, skill = 40, attack = 100, condition = { type = CONDITION_POISON, totalDamage = 8, interval = 4000 } },
	{ name = "speed", interval = 2000, chance = 20, speed = -850, range = 7, radius = 7, effect = CONST_ME_POFF, target = false, duration = 8000 },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -150, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = true },
}

monster.defenses = {
	defense = 20,
	armor = 25,
	mitigation = 1.80,
	{ name = "speed", interval = 3000, chance = 40, effect = CONST_ME_MAGIC_RED, speed = 340},
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