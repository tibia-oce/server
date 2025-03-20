-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Dark_Torturer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dark_Torturer
---


local mType = Game.createMonsterType("Dark Torturer")
local monster = {}

monster.description = "a dark torturer"
monster.experience = 4650
monster.outfit = {
	lookType = 234,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 7350
monster.maxHealth = 7350
monster.race = "undead"
monster.corpse = 6327
monster.speed = 185
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
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
	{ text = "You like it, don't you?", yell = false },
	{ text = "IahaEhheAie!", yell = false },
	{ text = "It's party time!", yell = false },
	{ text = "Harrr, Harrr!", yell = false },
	{ text = "The torturer is in!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99997, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "ham", chance = 64985 },  -- 2671
	{ id = "platinum coin", chance = 57000, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "concentrated demonic blood", chance = 35000 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "soul orb", chance = 24317, minCount = 1, maxCount = 2 },  -- 5944
	{ id = "great mana potion", chance = 15294, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "great health potion", chance = 10108, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "demonic essence", chance = 8985 },  -- 6500
	{ id = "steel boots", chance = 5149 },  -- 2645
	{ id = 2558, chance = 5026 },  -- saw
	{ id = "gold ingot", chance = 2869 },  -- 9971
	{ id = "orichalcum pearl", chance = 2668, minCount = 1, maxCount = 2 },  -- 5022
	{ id = "cat's paw", chance = 1972 },  -- 5480
	{ id = "assassin star", chance = 1943, minCount = 1, maxCount = 5 },  -- 7368
	{ id = 6300, chance = 1936 },  -- death ring
	{ id = "jewelled backpack", chance = 879 },  -- 5801
	{ id = "butcher's axe", chance = 655 },  -- 7412
	{ id = "vile axe", chance = 394 },  -- 7388
	{ id = "golden legs", chance = 67 },  -- 2470
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -781, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
	{ name = "dark torturer skill reducer", interval = 2000, chance = 5, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 45,
	mitigation = 1.74,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)