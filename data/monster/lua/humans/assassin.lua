-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Assassin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Assassin
---


local mType = Game.createMonsterType("Assassin")
local monster = {}

monster.description = "an assassin"
monster.experience = 105
monster.outfit = {
	lookType = 152,
	lookHead = 95,
	lookBody = 95,
	lookLegs = 95,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 0,
}


monster.health = 175
monster.maxHealth = 175
monster.race = "blood"
monster.corpse = 18046
monster.speed = 112
monster.manaCost = 450

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
	damage = 10,
}

monster.flags = {
	summonable = false,
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
	{ text = "You are on my deathlist!", yell = false },
	{ text = "Die!", yell = false },
	{ text = "Feel the hand of death!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 83123, minCount = 1, maxCount = 50 },  -- 2148
	{ id = 2050, chance = 30145, minCount = 1, maxCount = 2 },  -- torch
	{ id = "knife", chance = 9983 },  -- 2403
	{ id = "throwing star", chance = 7028, minCount = 1, maxCount = 14 },  -- 2399
	{ id = "viper star", chance = 4108, minCount = 1, maxCount = 7 },  -- 7366
	{ id = "combat knife", chance = 4015 },  -- 2404
	{ id = "steel helmet", chance = 3031 },  -- 2457
	{ id = "plate shield", chance = 1892 },  -- 2510
	{ id = "battle shield", chance = 1673 },  -- 2513
	{ id = "steel shield", chance = 966 },  -- 2509
	{ id = "leopard armor", chance = 467 },  -- 3968
	{ id = "horseman helmet", chance = 231 },  -- 3969
	{ id = "small diamond", chance = 231 },  -- 2145
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -120 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -40, range = 7, shootEffect = CONST_ANI_THROWINGSTAR, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -120, maxDamage = -160, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 17,
	mitigation = 1.04,
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
