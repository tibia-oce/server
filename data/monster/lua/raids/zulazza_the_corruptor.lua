-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Zulazza_the_Corruptor
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zulazza_the_Corruptor
---


local mType = Game.createMonsterType("Zulazza the Corruptor")
local monster = {}

monster.description = "Zulazza the Corruptor"
monster.experience = 10000
monster.outfit = {
	lookType = 334,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 628,
	bossRace = RARITY_NEMESIS,
}

monster.health = 46500
monster.maxHealth = 46500
monster.race = "blood"
monster.corpse = 10190
monster.speed = 145
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 1500,
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
	{ text = "I'm Zulazza, and you won't forget me that fazzt.", yell = false },
	{ text = "Oh, HE will take revenge on zzizz azzault when you zztep in front of HIZZ fazze!", yell = false },
	{ text = "Zzaion is our last zztand! I will not leave wizzout a fight!", yell = false },
	{ text = "Behind zze Great Gate liezz your doom!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 73964, minCount = 1, maxCount = 30 },  -- 2152
	{ id = 9808, chance = 62722 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "gold ingot", chance = 60947, minCount = 1, maxCount = 4 },  -- 9971
	{ id = 7632, chance = 42012, minCount = 1, maxCount = 2 },  -- giant shimmering pearl
	{ id = "red gem", chance = 23077 },  -- 2156
	{ id = "yellow gem", chance = 22485 },  -- 2154
	{ id = "viper star", chance = 21893, minCount = 2, maxCount = 69 },  -- 7366
	{ id = "violet gem", chance = 20710 },  -- 2153
	{ id = "emerald bangle", chance = 18343 },  -- 2127
	{ id = "blue gem", chance = 17160 },  -- 2158
	{ id = "green gem", chance = 16568 },  -- 2155
	{ id = "soul orb", chance = 16568, minCount = 1, maxCount = 5 },  -- 5944
	{ id = "great health potion", chance = 15976 },  -- 7591
	{ id = "mastermind potion", chance = 15976 },  -- 7440
	{ id = "ultimate health potion", chance = 15385 },  -- 8473
	{ id = "great mana potion", chance = 13018 },  -- 7590
	{ id = "great spirit potion", chance = 13018 },  -- 8472
	{ id = "guardian shield", chance = 11243 },  -- 2515
	{ id = "paladin armor", chance = 10059 },  -- 8891
	{ id = "mastermind shield", chance = 8284 },  -- 2514
	{ id = "tower shield", chance = 8284 },  -- 2528
	{ id = "dragon scale boots", chance = 1775 },  -- 11118
	{ id = "earthborn titan armor", chance = 1183 },  -- 8882
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 200, attack = 200 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -800, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -300, maxDamage = -800, radius = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -50, maxDamage = -130, range = 7, effect = CONST_ME_MAGIC_GREEN, target = true },
	{ name = "speed", interval = 2000, chance = 20, speed = -500, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 119,
	armor = 96,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 70 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)