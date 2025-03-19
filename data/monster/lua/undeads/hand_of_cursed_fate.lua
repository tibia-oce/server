-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Hand_of_Cursed_Fate
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hand_of_Cursed_Fate
---


local mType = Game.createMonsterType("Hand of Cursed Fate")
local monster = {}

monster.description = "a hand of cursed fate"
monster.experience = 5000
monster.outfit = {
	lookType = 230,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 6600
monster.maxHealth = 6600
monster.race = "blood"
monster.corpse = 6311
monster.speed = 130
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
	staticAttackChance = 20,
	targetDistance = 1,
	runHealth = 3500,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 4, maxCount = 267 },  -- 2148
	{ id = "platinum coin", chance = 98517, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "soul orb", chance = 30422 },  -- 5944
	{ id = "concentrated demonic blood", chance = 29900 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "great mana potion", chance = 19400, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "ultimate health potion", chance = 19222 },  -- 8473
	{ id = "mind stone", chance = 15425 },  -- 2178
	{ id = "assassin star", chance = 15223, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "small sapphire", chance = 14333, minCount = 1, maxCount = 4 },  -- 2146
	{ id = "demonic essence", chance = 11664 },  -- 6500
	{ id = "protection amulet", chance = 10133 },  -- 2200
	{ id = "yellow gem", chance = 5826 },  -- 2154
	{ id = "emerald bangle", chance = 5150 },  -- 2127
	{ id = "wand of inferno", chance = 4782 },  -- 2187
	{ id = "sudden death rune", chance = 4509, minCount = 1, maxCount = 8 },  -- 2268
	{ id = "knight armor", chance = 3904 },  -- 2476
	{ id = "energy ring", chance = 2278 },  -- 2167
	{ id = "blue gem", chance = 1709 },  -- 2158
	{ id = 6300, chance = 1281 },  -- death ring
	{ id = "platinum amulet", chance = 1092 },  -- 2171
	{ id = "violet gem", chance = 1020 },  -- 2153
	{ id = "skull staff", chance = 985 },  -- 2436
	{ id = 1950, chance = 890 },  -- book (orange)
	{ id = "crown armor", chance = 854 },  -- 2487
	{ id = "gold ingot", chance = 605 },  -- 9971
	{ id = "boots of haste", chance = 166 },  -- 2195
	{ id = "mysterious voodoo skull", chance = 95 },  -- 5669
	{ id = "abyss hammer", chance = 59 },  -- 7414
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -520, condition = { type = CONDITION_POISON, totalDamage = 380, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -620, range = 1, target = false },
	{ name = "drunk", interval = 2000, chance = 10, radius = 4, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 3000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -220, maxDamage = -880, range = 1, effect = CONST_ME_SMALLCLOUDS, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 53,
	mitigation = 1.88,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 260},
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)