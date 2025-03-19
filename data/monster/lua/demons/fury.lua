-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Fury
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Fury
---


local mType = Game.createMonsterType("Fury")
local monster = {}

monster.description = "a fury"
monster.experience = 3600
monster.outfit = {
	lookType = 149,
	lookHead = 94,
	lookBody = 77,
	lookLegs = 78,
	lookFeet = 79,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 4100
monster.maxHealth = 4100
monster.race = "blood"
monster.corpse = 18118
monster.speed = 200
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
	canPushCreatures = true,
	staticAttackChance = 70,
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
	{ text = "Ahhhhrrrr!", yell = false },
	{ text = "Waaaaah!", yell = false },
	{ text = "Caaarnaaage!", yell = false },
	{ text = "Dieee!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 98798, minCount = 1, maxCount = 273 },  -- 2148
	{ id = "concentrated demonic blood", chance = 34138 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "jalapeno pepper", chance = 29838, minCount = 1, maxCount = 4 },  -- 8844
	{ id = "demonic essence", chance = 22288 },  -- 6500
	{ id = "terra rod", chance = 20150 },  -- 2181
	{ id = "soul orb", chance = 19827 },  -- 5944
	{ id = 9811, chance = 10100 },  -- rusty legs (todo: slightly rusted does not exist in items.xml)
	{ id = "great health potion", chance = 9873 },  -- 7591
	{ id = "small amethyst", chance = 8180, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "red piece of cloth", chance = 4001 },  -- 5911
	{ id = "platinum coin", chance = 2513, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "noble axe", chance = 2031 },  -- 7456
	{ id = "orichalcum pearl", chance = 1372, minCount = 1, maxCount = 4 },  -- 5022
	{ id = "assassin dagger", chance = 813 },  -- 7404
	{ id = "steel boots", chance = 781 },  -- 2645
	{ id = 2124, chance = 448 },  -- crystal ring
	{ id = "golden legs", chance = 103 },  -- 2470
	{ id = "assassin star", chance = 101 },  -- 7368
	{ id = 6300, chance = 85 },  -- death ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -510 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -300, length = 8, spread = 3, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_DEATHDAMAGE, minDamage = -120, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -120, maxDamage = -300, radius = 4, effect = CONST_ME_DRAWBLOOD, target = false },
	{ name = "fury skill reducer", interval = 2000, chance = 5, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -120, maxDamage = -300, radius = 3, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -125, maxDamage = -250, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -800, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 30000 },
}

monster.defenses = {
	defense = 20,
	armor = 35,
	mitigation = 1.32,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 400},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
