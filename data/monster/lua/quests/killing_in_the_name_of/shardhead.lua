-- Version: 8.50
-- Monster: https://tibia.fandom.com/wiki/Shardhead
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Shardhead
---


local mType = Game.createMonsterType("Shardhead")
local monster = {}

monster.description = "Shardhead"
monster.experience = 650
monster.outfit = {
	lookType = 261,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 800
monster.maxHealth = 800
monster.race = "undead"
monster.corpse = 7282
monster.speed = 97
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
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
	{ id = "gold coin", chance = 89815, minCount = 5, maxCount = 198 },  -- 2148
	{ id = "platinum coin", chance = 73148, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "strong health potion", chance = 73148 },  -- 7588
	{ id = "small sapphire", chance = 65741, minCount = 1, maxCount = 5 },  -- 2146
	{ id = "small diamond", chance = 63889, minCount = 1, maxCount = 4 },  -- 2145
	{ id = "frosty heart", chance = 56481 },  -- 10578
	{ id = 7441, chance = 50000, minCount = 1, maxCount = 2 },  -- ice cube
	{ id = "shard", chance = 32407 },  -- 7290
	{ id = "black pearl", chance = 1852 },  -- 2144
	{ id = "glacier mask", chance = 926 },  -- 7902
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -271 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -90, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEATTACK, target = true },
	{ name = "speed", interval = 2000, chance = 12, speed = -360, length = 8, spread = 3, effect = CONST_ME_ICEAREA, target = false, duration = 5000 },
}

monster.defenses = {
	defense = 26,
	armor = 25,
	mitigation = 0.90,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)