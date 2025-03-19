-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Midnight_Asura
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Midnight_Asura
---


local mType = Game.createMonsterType("Midnight Asura")
local monster = {}

monster.description = "a midnight asura"
monster.experience = 4100
monster.outfit = {
	lookType = 150,
	lookHead = 0,
	lookBody = 114,
	lookLegs = 90,
	lookFeet = 90,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 3100
monster.maxHealth = 3100
monster.race = "blood"
monster.corpse = 21988
monster.speed = 120
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
	{ text = "Death and Darkness!", yell = false },
	{ text = "Embrace the night!", yell = false },
	{ text = "May night fall upon you!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "concentrated demonic blood", chance = 20053 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "soul orb", chance = 19947 },  -- 5944
	{ id = "golden lotus brooch", chance = 18190 },  -- 24630
	{ id = "peacock feather fan", chance = 15947 },  -- 24631
	{ id = "demonic essence", chance = 15055 },  -- 6500
	{ id = "great health potion", chance = 12062, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "assassin star", chance = 9837, minCount = 1, maxCount = 5 },  -- 7368
	{ id = "white pearl", chance = 8530, minCount = 1, maxCount = 2 },  -- 2143
	{ id = "small diamond", chance = 7965, minCount = 1, maxCount = 3 },  -- 2145
	{ id = "small sapphire", chance = 7815, minCount = 1, maxCount = 3 },  -- 2146
	{ id = "silver brooch", chance = 5104 },  -- 2134
	{ id = "black pearl", chance = 4689, minCount = 1, maxCount = 2 },  -- 2144
	{ id = "small topaz", chance = 4530, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "small emerald", chance = 4389, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "small ruby", chance = 4371, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "necrotic rod", chance = 3735 },  -- 2185
	{ id = "tribal mask", chance = 2887 },  -- 3967
	{ id = "silver amulet", chance = 1731 },  -- 2170
	{ id = "yellow gem", chance = 1157 },  -- 2154
	{ id = "underworld rod", chance = 1113 },  -- 8910
	{ id = "blue robe", chance = 812 },  -- 2656
	{ id = "assassin dagger", chance = 600 },  -- 7404
	{ id = "oriental shoes", chance = 574 },  -- 24637
	{ id = 2124, chance = 486 },  -- crystal ring
	{ id = "blue gem", chance = 327 },  -- 2158
	{ id = "skullcracker armor", chance = 265 },  -- 8889
	{ id = "gold ingot", chance = 221 },  -- 9971
	{ id = "spellbook of mind control", chance = 168 },  -- 8902
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -387 },
	{ name = "combat", interval = 3300, chance = 10, type = COMBAT_MANADRAIN, minDamage = 0, maxDamage = -70, range = 7, target = true },
	{ name = "combat", interval = 3700, chance = 17, type = COMBAT_ENERGYDAMAGE, minDamage = -150, maxDamage = -200, length = 5, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 4100, chance = 27, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2700, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -50, maxDamage = -200, range = 5, shootEffect = CONST_ANI_SUDDENDEATH, target = true },
	{ name = "combat", interval = 3100, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -50, maxDamage = -100, range = 1, shootEffect = CONST_ANI_ENERGY, target = true },
	{ name = "speed", interval = 2000, chance = 20, speed = -800, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 55,
	armor = 55,
	mitigation = 1.60,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 240},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)