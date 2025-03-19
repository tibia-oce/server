-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Plaguesmith
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Plaguesmith
---


local mType = Game.createMonsterType("Plaguesmith")
local monster = {}

monster.description = "a plaguesmith"
monster.experience = 3800
monster.outfit = {
	lookType = 247,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 8250
monster.maxHealth = 8250
monster.race = "venom"
monster.corpse = 6515
monster.speed = 160
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 500,
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
	{ text = "You are looking a bit feverish!", yell = false },
	{ text = "You don't look that good!", yell = false },
	{ text = "Hachoo!", yell = false },
	{ text = "Cough Cough", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99731, minCount = 1, maxCount = 287 },  -- 2148
	{ id = "dirty cape", chance = 59855, minCount = 1, maxCount = 2 },  -- 2237
	{ id = "mouldy cheese", chance = 49515, minCount = 1, maxCount = 2 },  -- 2235
	{ id = "morning star", chance = 29590 },  -- 2394
	{ id = "two handed sword", chance = 20090 },  -- 2377
	{ id = "piece of iron", chance = 20052, minCount = 1, maxCount = 2 },  -- 2225
	{ id = "battle hammer", chance = 20046 },  -- 2417
	{ id = "steel shield", chance = 19932 },  -- 2509
	{ id = "soul orb", chance = 12114 },  -- 5944
	{ id = "great health potion", chance = 9843 },  -- 7591
	{ id = "demonic essence", chance = 8966 },  -- 6500
	{ id = "platinum coin", chance = 8102, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "onyx arrow", chance = 8031, minCount = 1, maxCount = 4 },  -- 7365
	{ id = 9808, chance = 7972 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "knight legs", chance = 6917 },  -- 2477
	{ id = "club ring", chance = 5093 },  -- 2209
	{ id = "small amethyst", chance = 4948, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "axe ring", chance = 4855 },  -- 2208
	{ id = "silver brooch", chance = 2022 },  -- 2134
	{ id = "war hammer", chance = 2015 },  -- 2391
	{ id = "steel boots", chance = 1213 },  -- 2645
	{ id = "piece of royal steel", chance = 981 },  -- 5887
	{ id = "piece of hell steel", chance = 975 },  -- 5888
	{ id = "piece of draconian steel", chance = 969 },  -- 5889
	{ id = "hammer of wrath", chance = 846 },  -- 2444
	{ id = "emerald bangle", chance = 373 },  -- 2127
	{ id = "war horn", chance = 102 },  -- 2079
}

monster.attacks = {
	{ name = "melee", interval = 1500, chance = 100, minDamage = 0, maxDamage = -539, condition = { type = CONDITION_POISON, totalDamage = 200, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -114, radius = 4, effect = CONST_ME_POISONAREA, target = false },
	{ name = "plaguesmith wave", interval = 2000, chance = 10, minDamage = -100, maxDamage = -350, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -800, radius = 4, effect = CONST_ME_POISONAREA, target = false, duration = 30000 },
}

monster.defenses = {
	defense = 40,
	armor = 30,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 200, maxDamage = 280, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 320},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)