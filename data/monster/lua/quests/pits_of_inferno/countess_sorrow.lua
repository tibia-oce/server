-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Countess_Sorrow
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Countess_Sorrow
---


local mType = Game.createMonsterType("Countess Sorrow")
local monster = {}

monster.description = "Countess Sorrow"
monster.experience = 13000
monster.outfit = {
	lookType = 241,
	lookHead = 20,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 6500
monster.maxHealth = 6500
monster.race = "undead"
monster.corpse = 6343
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 540,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 203,
}

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Phantasm", chance = 7, interval = 2000, count = 3 },
		{ name = "Phantasm Summon", chance = 7, interval = 2000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I'm so sorry ... for youuu!", yell = false },
	{ text = "You won't rest in peace! Never ever!", yell = false },
	{ text = "Sleep ... for eternity!", yell = false },
	{ text = "Dreams can come true. As my dream of killing you.", yell = false },
	{ text = "You are lost pathetic mortal.", yell = false },
}

monster.loot = {
	{ id = "Countess Sorrow's frozen tear", chance = 100000 },  -- 6536
	{ id = "soul orb", chance = 89362 },  -- 5944
	{ id = "gold coin", chance = 87234, minCount = 3, maxCount = 169 },  -- 2148
	{ id = "platinum coin", chance = 61702, minCount = 1, maxCount = 4 },  -- 2152
	{ id = 2238, chance = 46809 },  -- worn leather boots
	{ id = "demonic essence", chance = 42553 },  -- 6500
	{ id = "protection amulet", chance = 29787 },  -- 2200
	{ id = "blue robe", chance = 27660 },  -- 2656
	{ id = "silver mace", chance = 19149 },  -- 2424
	{ id = "plate legs", chance = 17021 },  -- 2647
	{ id = "stealth ring", chance = 8511 },  -- 2165
	{ id = "cape", chance = 2128 },  -- 2654
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 156, attack = 100, condition = { type = CONDITION_POISON, totalDamage = 920, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -420, maxDamage = -980, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_MANADRAIN, minDamage = -45, maxDamage = -90, radius = 3, effect = CONST_ME_YELLOW_RINGS, target = false },
	{ name = "phantasm drown", interval = 2000, chance = 20, target = false },
	{ name = "drunk", interval = 2000, chance = 15, range = 7, radius = 6, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000 },
}

monster.defenses = {
	defense = 20,
	armor = 25,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 26, type = COMBAT_HEALING, minDamage = 415, maxDamage = 625, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_POFF },
	{ name = "speed", interval = 2000, chance = 11, effect = CONST_ME_MAGIC_RED, speed = 400},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)