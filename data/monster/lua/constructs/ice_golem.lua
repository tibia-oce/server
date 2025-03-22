-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Ice_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ice_Golem
---


local mType = Game.createMonsterType("Ice Golem")
local monster = {}

monster.description = "an ice golem"
monster.experience = 295
monster.outfit = {
	lookType = 261,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 385
monster.maxHealth = 385
monster.race = "undead"
monster.corpse = 7282
monster.speed = 95
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	{ text = "Chrrr.", yell = false },
	{ text = "Crrrrk.", yell = false },
	{ text = "Gnarr.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 120 },  -- 2148
	{ id = "frosty heart", chance = 14238 },  -- 10578
	{ id = 7441, chance = 5087 },  -- ice cube
	{ id = "strong mana potion", chance = 3029 },  -- 7589
	{ id = "strong health potion", chance = 2455 },  -- 7588
	{ id = "black pearl", chance = 1482 },  -- 2144
	{ id = "small diamond", chance = 746 },  -- 2145
	{ id = "crystal sword", chance = 572 },  -- 7449
	{ id = "small sapphire", chance = 569 },  -- 2146
	{ id = "strange helmet", chance = 346 },  -- 2479
	{ id = "ice rapier", chance = 322 },  -- 2396
	{ id = "shard", chance = 193 },  -- 7290
	{ id = "glacier mask", chance = 188 },  -- 7902
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -220 },
	{ name = "speed", interval = 1000, chance = 13, speed = -800, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT, target = false, duration = 20000 },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -50, maxDamage = -85, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "ice golem skill reducer", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 26,
	armor = 47,
	mitigation = 0.70,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
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