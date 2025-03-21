-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Ghazbaran
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ghazbaran
---


local mType = Game.createMonsterType("Ghazbaran")
local monster = {}

monster.description = "Ghazbaran"
monster.experience = 15000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 85,
	lookLegs = 78,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 77000
monster.maxHealth = 77000
monster.race = "undead"
monster.corpse = 6068
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20,
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
	staticAttackChance = 98,
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

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Deathslicer", chance = 20, interval = 4000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "COME AND GIVE ME SOME AMUSEMENT", yell = true },
	{ text = "IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?", yell = true },
	{ text = "I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL.", yell = true },
	{ text = "FLAWLESS VICTORY!", yell = true },
}

monster.loot = {
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "platinum coin", chance = 100000, minCount = 3, maxCount = 69 },  -- 2152
	{ id = "demon horn", chance = 32609, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "small diamond", chance = 30435, minCount = 1, maxCount = 5 },  -- 2145
	{ id = 6300, chance = 28261 },  -- death ring
	{ id = "great health potion", chance = 26087 },  -- 7591
	{ id = "great spirit potion", chance = 26087 },  -- 8472
	{ id = "spellscroll of prophecies", chance = 26087 },  -- 8904
	{ id = "ultimate health potion", chance = 26087 },  -- 8473
	{ id = "white pearl", chance = 26087, minCount = 1, maxCount = 15 },  -- 2143
	{ id = "mind stone", chance = 23913 },  -- 2178
	{ id = "ring of healing", chance = 23913 },  -- 2214
	{ id = "small amethyst", chance = 23913, minCount = 2, maxCount = 17 },  -- 2150
	{ id = "small emerald", chance = 23913, minCount = 2, maxCount = 10 },  -- 2149
	{ id = "blue tome", chance = 21739 },  -- 1984
	{ id = "great mana potion", chance = 21739 },  -- 7590
	{ id = "green gem", chance = 21739 },  -- 2155
	{ id = "orb", chance = 21739 },  -- 2176
	{ id = "small sapphire", chance = 21739, minCount = 1, maxCount = 10 },  -- 2146
	{ id = "spellbook of dark mysteries", chance = 21739 },  -- 8918
	{ id = "spellbook of warding", chance = 21739 },  -- 8901
	{ id = "gold ring", chance = 19565 },  -- 2179
	{ id = "havoc blade", chance = 17391 },  -- 7405
	{ id = "oceanborn leviathan armor", chance = 17391 },  -- 8884
	{ id = "spellbook of lost souls", chance = 17391 },  -- 8903
	{ id = "assassin star", chance = 15217, minCount = 5, maxCount = 44 },  -- 7368
	{ id = "blue gem", chance = 15217 },  -- 2158
	{ id = "ravenwing", chance = 15217 },  -- 7433
	{ id = "ruthless axe", chance = 15217 },  -- 6553
	{ id = "teddy bear", chance = 15217 },  -- 2112
	{ id = "demon shield", chance = 13043 },  -- 2520
	{ id = "life crystal", chance = 13043 },  -- 2177
	{ id = "might ring", chance = 13043 },  -- 2164
	{ id = "stealth ring", chance = 13043 },  -- 2165
	{ id = "talon", chance = 13043, minCount = 1, maxCount = 7 },  -- 2151
	{ id = "black pearl", chance = 10870, minCount = 3, maxCount = 14 },  -- 2144
	{ id = 2124, chance = 10870 },  -- crystal ring
	{ id = "glacier kilt", chance = 10870 },  -- 7896
	{ id = "spellbook of mind control", chance = 10870 },  -- 8902
	{ id = "strange symbol", chance = 10870 },  -- 2174
	{ id = "twin axe", chance = 10870 },  -- 2447
	{ id = "frozen plate", chance = 8696 },  -- 8887
	{ id = "golden armor", chance = 8696 },  -- 2466
	{ id = "golden boots", chance = 8696 },  -- 2646
	{ id = "magic plate armor", chance = 8696 },  -- 2472
	{ id = "robe of the ice queen", chance = 8696 },  -- 8866
	{ id = "bonebreaker", chance = 6522 },  -- 7428
	{ id = "crystalline armor", chance = 6522 },  -- 8878
	{ id = "glorious axe", chance = 6522 },  -- 7454
	{ id = "gold ingot", chance = 6522 },  -- 9971
	{ id = "golden legs", chance = 6522 },  -- 2470
	{ id = "golden mug", chance = 6522 },  -- 2033
	{ id = 2162, chance = 6522 },  -- magic light wand
	{ id = "mythril axe", chance = 6522 },  -- 7455
	{ id = 2192, chance = 4348 },  -- crystal ball
	{ id = "energy ring", chance = 4348 },  -- 2167
	{ id = "giant sword", chance = 4348 },  -- 2393
	{ id = "ring of the sky", chance = 4348 },  -- 2123
	{ id = "mastermind shield", chance = 2174 },  -- 2514
	{ id = "onyx arrow", chance = 2174, maxCount = 30 },  -- 7365
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2191 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -500, range = 7, radius = 6, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -120, maxDamage = -500, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = true },
	{ name = "combat", interval = 4000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -800, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -480, range = 14, radius = 5, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -650, range = 7, radius = 13, effect = CONST_ME_BLOCKHIT, target = false },
	{ name = "combat", interval = 4000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -600, radius = 14, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -750, range = 7, radius = 4, effect = CONST_ME_ENERGYAREA, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 55,
	--	mitigation = ???,
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 300, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 4000, chance = 80, effect = CONST_ME_MAGIC_RED, speed = 400},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 1 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)