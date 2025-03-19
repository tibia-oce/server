-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Pirate_Corsair
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Pirate_Corsair
---


local mType = Game.createMonsterType("Pirate Corsair")
local monster = {}

monster.description = "a pirate corsair"
monster.experience = 350
monster.outfit = {
	lookType = 98,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 675
monster.maxHealth = 675
monster.race = "blood"
monster.corpse = 18194
monster.speed = 119
monster.manaCost = 775

monster.changeTarget = {
	interval = 4000,
	chance = 15,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 40,
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
	{ text = "Hiyaa!", yell = false },
	{ text = "Give up!", yell = false },
	{ text = "Plundeeeeer!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 55414, minCount = 1, maxCount = 86 },  -- 2148
	{ id = "compass", chance = 10040 },  -- 11219
	{ id = "sabre", chance = 9859 },  -- 2385
	{ id = "throwing star", chance = 8040, minCount = 1, maxCount = 12 },  -- 2399
	{ id = "dark armor", chance = 1879 },  -- 2489
	{ id = "dark shield", chance = 1091 },  -- 2521
	{ id = "pirate hat", chance = 1061 },  -- 6096
	{ id = "pirate backpack", chance = 980 },  -- 5926
	{ id = "strong health potion", chance = 828 },  -- 7588
	{ id = "hook", chance = 556 },  -- 6097
	{ id = "peg leg", chance = 535 },  -- 6126
	{ id = "eye patch", chance = 505 },  -- 6098
	{ id = "pirate boots", chance = 313 },  -- 5462
	{ id = "rum flask", chance = 121 },  -- 5553
	{ id = 5813, chance = 121 },  -- skull candle
	{ id = "piggy bank", chance = 81 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -170 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -150, range = 3, shootEffect = CONST_ANI_THROWINGSTAR, target = false },
	{ name = "pirate corsair skill reducer", interval = 2000, chance = 5, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 20,
	mitigation = 1.46,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)