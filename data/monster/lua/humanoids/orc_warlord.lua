-- Version: 7.0
-- Monster: https://tibia.fandom.com/wiki/Orc_Warlord
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc_Warlord
---


local mType = Game.createMonsterType("Orc Warlord")
local monster = {}

monster.description = "an orc warlord"
monster.experience = 670
monster.outfit = {
	lookType = 2,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 950
monster.maxHealth = 950
monster.race = "blood"
monster.corpse = 6008
monster.speed = 117
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 15,
	damage = 15,
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
	staticAttackChance = 90,
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
	{ text = "Ikem rambo zambo!", yell = false },
	{ text = "Orc buta bana!", yell = false },
	{ text = "Ranat Ulderek!", yell = false },
	{ text = "Futchi maruk buta!", yell = false },
}

monster.loot = {
	{ id = "broken helmet", chance = 25455 },  -- 12409
	{ id = "orc leather", chance = 20225 },  -- 12435
	{ id = "gold coin", chance = 19061, minCount = 1, maxCount = 45 },  -- 2148
	{ id = "throwing star", chance = 14687, minCount = 1, maxCount = 18 },  -- 2399
	{ id = "fish", chance = 10554, minCount = 1, maxCount = 2 },  -- 2667
	{ id = "orc tooth", chance = 9898 },  -- 11113
	{ id = "plate armor", chance = 5618 },  -- 2463
	{ id = "orcish axe", chance = 5190 },  -- 2428
	{ id = "skull belt", chance = 5016 },  -- 12436
	{ id = "hunting spear", chance = 4922 },  -- 3965
	{ id = "plate legs", chance = 3812 },  -- 2647
	{ id = 2419, chance = 3143 },  -- scimitar
	{ id = "two handed sword", chance = 1926 },  -- 2377
	{ id = "protection amulet", chance = 1806 },  -- 2200
	{ id = "dark helmet", chance = 1378 },  -- 2490
	{ id = "brass armor", chance = 896 },  -- 2465
	{ id = "health potion", chance = 348 },  -- 7618
	{ id = "crusader helmet", chance = 294 },  -- 2497
	{ id = "dragon hammer", chance = 241 },  -- 2434
	{ id = "magma boots", chance = 201 },  -- 7891
	{ id = 7395, chance = 147 },  -- orc trophy
	{ id = "stealth ring", chance = 134 },  -- 2165
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_THROWINGSTAR, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 28,
	mitigation = 1.46,
	{ name = "invisible", interval = 2000, chance = 5, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
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