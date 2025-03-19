-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Lizard_Zaogun
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lizard_Zaogun
---


local mType = Game.createMonsterType("Lizard Zaogun")
local monster = {}

monster.description = "a lizard zaogun"
monster.experience = 1700
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
monster.speed = 138
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Hissss!", yell = false },
	{ text = "Cowardzz!", yell = false },
	{ text = "Softzzkinzz from zze zzouzz!", yell = false },
	{ text = "Zztand and fight!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 94182, minCount = 1, maxCount = 268 },  -- 2148
	{ id = "platinum coin", chance = 49751, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "zaogun shoulderplates", chance = 15017 },  -- 11331
	{ id = "lizard leather", chance = 14683 },  -- 5876
	{ id = "lizard scale", chance = 12063 },  -- 5881
	{ id = "zaogun flag", chance = 8357 },  -- 11330
	{ id = "great health potion", chance = 7150, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "small emerald", chance = 5025, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "red lantern", chance = 2107 },  -- 11206
	{ id = "strong health potion", chance = 1991 },  -- 7588
	{ id = "Zaoan shoes", chance = 1127 },
	{ id = "tower shield", chance = 1011 },  -- 2528
	{ id = "Zaoan legs", chance = 918 },
	{ id = "Zaoan armor", chance = 535 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -349 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -220, maxDamage = -375, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
}

monster.defenses = {
	defense = 40,
	armor = 42,
	mitigation = 1.37,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 175, maxDamage = 275, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 45 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
