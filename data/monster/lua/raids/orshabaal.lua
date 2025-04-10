-- Version: 7.4
-- Monster: https://tibia.fandom.com/wiki/Orshabaal
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orshabaal
---


local mType = Game.createMonsterType("Orshabaal")
local monster = {}

monster.description = "Orshabaal"
monster.experience = 10000
monster.outfit = {
	lookType = 201,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 22500
monster.maxHealth = 22500
monster.race = "fire"
monster.corpse = 2916
monster.speed = 270
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 2500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "demon", chance = 10, interval = 1000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!", yell = true },
	{ text = "YOU ARE DOOMED!", yell = true },
	{ text = "ORSHABAAL IS BACK!", yell = true },
	{ text = "Be prepared for the day my masters will come for you!", yell = false },
	{ text = "SOULS FOR ORSHABAAL!", yell = true },
}

monster.loot = {
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 72 },  -- 2152
	{ id = "demonic essence", chance = 94444 },  -- 6500
	{ id = 6300, chance = 55556 },  -- death ring
	{ id = "demon horn", chance = 50000, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "great mana potion", chance = 33333 },  -- 7590
	{ id = "small sapphire", chance = 33333, minCount = 3, maxCount = 8 },  -- 2146
	{ id = "white pearl", chance = 33333, minCount = 2, maxCount = 15 },  -- 2143
	{ id = "black pearl", chance = 27778, minCount = 12, maxCount = 15 },  -- 2144
	{ id = "devil helmet", chance = 27778 },  -- 2462
	{ id = "great health potion", chance = 27778, minCount = 1, maxCount = 5 },  -- 7591
	{ id = "ring of healing", chance = 27778 },  -- 2214
	{ id = "ultimate health potion", chance = 27778 },  -- 8473
	{ id = "blue gem", chance = 22222 },  -- 2158
	{ id = "demon shield", chance = 22222 },  -- 2520
	{ id = "giant sword", chance = 22222 },  -- 2393
	{ id = "mind stone", chance = 22222 },  -- 2178
	{ id = "small diamond", chance = 22222, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "small emerald", chance = 22222, minCount = 2, maxCount = 7 },  -- 2149
	{ id = "assassin star", chance = 16667, minCount = 36, maxCount = 42 },  -- 7368
	{ id = "boots of haste", chance = 16667 },  -- 2195
	{ id = "crystal necklace", chance = 16667 },  -- 2125
	{ id = "protection amulet", chance = 16667 },  -- 2200
	{ id = "purple tome", chance = 16667 },  -- 1982
	{ id = "silver amulet", chance = 16667 },  -- 2170
	{ id = "small amethyst", chance = 16667, minCount = 6, maxCount = 17 },  -- 2150
	{ id = "strange symbol", chance = 16667 },  -- 2174
	{ id = "talon", chance = 16667, minCount = 2, maxCount = 3 },  -- 2151
	{ id = "two handed sword", chance = 16667 },  -- 2377
	{ id = "fire axe", chance = 11111 },  -- 2432
	{ id = "golden legs", chance = 11111 },  -- 2470
	{ id = "golden mug", chance = 11111 },  -- 2033
	{ id = "great spirit potion", chance = 11111 },  -- 8472
	{ id = "life crystal", chance = 11111 },  -- 2177
	{ id = "mastermind shield", chance = 11111 },  -- 2514
	{ id = "orb", chance = 11111 },  -- 2176
	{ id = "platinum amulet", chance = 11111 },  -- 2171
	{ id = "stone skin amulet", chance = 11111 },  -- 2197
	{ id = 2142, chance = 5556 },  -- ancient amulet
	{ id = "dragon hammer", chance = 5556 },  -- 2434
	{ id = "gold ingot", chance = 5556 },  -- 9971
	{ id = "golden sickle", chance = 5556 },  -- 2418
	{ id = "green gem", chance = 5556 },  -- 2155
	{ id = 2162, chance = 5556 },  -- magic light wand
	{ id = "magic plate armor", chance = 5556 },  -- 2472
	{ id = "might ring", chance = 5556 },  -- 2164
	{ id = "onyx arrow", chance = 5556, maxCount = 50 },  -- 7365
	{ id = "Orshabaal's brain", chance = 5556 },  -- 5808
	{ id = "silver dagger", chance = 5556 },  -- 2402
	{ id = "teddy bear", chance = 5556 },  -- 2112
	{ id = "thunder hammer", chance = 5556 },  -- 2421
	{ id = 2322, chance = 5556 },  -- voodoo doll

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1990 },
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_MANADRAIN, minDamage = -300, maxDamage = -600, range = 7, target = false },
	{ name = "combat", interval = 1000, chance = 6, type = COMBAT_MANADRAIN, minDamage = -150, maxDamage = -350, radius = 5, effect = CONST_ME_POISONAREA, target = false },
	{ name = "effect", interval = 1000, chance = 6, radius = 5, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -310, maxDamage = -600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 1000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -850, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 111,
	armor = 90,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 9, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 2500, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 17, type = COMBAT_HEALING, minDamage = 600, maxDamage = 1000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 5, effect = CONST_ME_MAGIC_RED, speed = 540},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -1 },
	{ type = COMBAT_HOLYDAMAGE, percent = -1 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)