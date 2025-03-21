-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Juggernaut
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Juggernaut
---


local mType = Game.createMonsterType("Juggernaut")
local monster = {}

monster.description = "a juggernaut"
monster.experience = 11200
monster.outfit = {
	lookType = 244,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 18000
monster.maxHealth = 18000
monster.race = "blood"
monster.corpse = 6335
monster.speed = 170
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
	staticAttackChance = 60,
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
	{ text = "RAAARRR!", yell = true },
	{ text = "GRRRRRR!", yell = true },
	{ text = "WAHHHH!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 5, maxCount = 199 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 15 },  -- 2152
	{ id = "ham", chance = 69383 },  -- 2671
	{ id = "demonic essence", chance = 45250 },  -- 6500
	{ id = "great mana potion", chance = 33474, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "soul orb", chance = 32813 },  -- 5944
	{ id = "great health potion", chance = 32390, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "concentrated demonic blood", chance = 28605 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "assassin star", chance = 24477, minCount = 1, maxCount = 10 },  -- 7368
	{ id = "small diamond", chance = 20640, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "small ruby", chance = 19555, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "small emerald", chance = 18841, minCount = 1, maxCount = 5 },  -- 2149
	{ id = "small amethyst", chance = 18497, minCount = 1, maxCount = 5 },  -- 2150
	{ id = "small topaz", chance = 18418, minCount = 1, maxCount = 5 },  -- 9970
	{ id = "onyx arrow", chance = 15374, minCount = 1, maxCount = 15 },  -- 7365
	{ id = "red gem", chance = 14845 },  -- 2156
	{ id = 7632, chance = 8918 },
	{ id = "titan axe", chance = 8018 },  -- 7413
	{ id = "gold ingot", chance = 7674, minCount = 1, maxCount = 2 },  -- 9971
	{ id = "knight armor", chance = 6060 },  -- 2476
	{ id = "spiked squelcher", chance = 5769 },  -- 7452
	{ id = "war axe", chance = 2646 },  -- 2454
	{ id = "green gem", chance = 2329 },  -- 2155
	{ id = "violet gem", chance = 1508 },  -- 2153
	{ id = "golden armor", chance = 635 },  -- 2466
	{ id = "mastermind shield", chance = 582 },  -- 2514
	{ id = "closed trap", chance = 450 },  -- 2578
	{ id = 2136, chance = 423 },  -- demonbone amulet
	{ id = "heavy mace", chance = 212 },  -- 2452
	{ id = 7632, chance = 79 },  -- giant shimmering pearl
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1470 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -780, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}

monster.defenses = {
	defense = 60,
	armor = 70,
	mitigation = 1.74,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 340},
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 400, maxDamage = 900, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)