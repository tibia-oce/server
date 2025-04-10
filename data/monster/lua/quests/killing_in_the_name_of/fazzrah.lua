-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Fazzrah
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Fazzrah
---


local mType = Game.createMonsterType("Fazzrah")
local monster = {}

monster.description = "Fazzrah"
monster.experience = 2600
monster.outfit = {
	lookType = 343,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 2955
monster.maxHealth = 2955
monster.race = "blood"
monster.corpse = 10367
monster.speed = 145
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{ id = "gold coin", chance = 100000, minCount = 46, maxCount = 292 },  -- 2148
	{ id = "lizard leather", chance = 100000 },  -- 5876
	{ id = "lizard scale", chance = 100000 },  -- 5881
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "strong health potion", chance = 100000 },  -- 7588
	{ id = "zaogun flag", chance = 100000 },  -- 11330
	{ id = "zaogun shoulderplates", chance = 100000 },  -- 11331
	{ id = "small emerald", chance = 77778, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "great health potion", chance = 70370, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "Zaoan shoes", chance = 70370 },
	{ id = "red lantern", chance = 35185 },  -- 11206
	{ id = "Zaoan armor", chance = 11111 },
	{ id = "Zaoan legs", chance = 11111 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -320 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -220, maxDamage = -270, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 35,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 168, maxDamage = 296, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 55 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)