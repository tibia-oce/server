-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Morgaroth
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Morgaroth
---


local mType = Game.createMonsterType("Morgaroth")
local monster = {}

monster.description = "Morgaroth"
monster.experience = 15000
monster.outfit = {
	lookType = 12,
	lookHead = 2,
	lookBody = 94,
	lookLegs = 78,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 55000
monster.maxHealth = 55000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 305
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
	runHealth = 100,
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
	maxSummons = 6,
	summons = {
		{ name = "Demon", chance = 33, interval = 4000, count = 6 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!", yell = true },
	{ text = "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", yell = true },
	{ text = "ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!", yell = true },
	{ text = "THE TRIANGLE OF TERROR WILL RISE!", yell = true },
}

monster.loot = {
	{ id = "demonic essence", chance = 95455 },  -- 6500
	{ id = "platinum coin", chance = 95455, minCount = 17, maxCount = 74 },  -- 2152
	{ id = "green gem", chance = 50000 },  -- 2155
	{ id = "great mana potion", chance = 45455 },  -- 7590
	{ id = "small amethyst", chance = 36364, minCount = 1, maxCount = 18 },  -- 2150
	{ id = "the devileye", chance = 36364 },  -- 8852
	{ id = "red tome", chance = 27273 },  -- 1986
	{ id = "small emerald", chance = 27273, minCount = 2, maxCount = 6 },  -- 2149
	{ id = "small sapphire", chance = 27273, minCount = 2, maxCount = 8 },  -- 2146
	{ id = "ultimate health potion", chance = 27273 },  -- 8473
	{ id = "chain bolter", chance = 22727 },  -- 8850
	{ id = "dark lord's cape", chance = 22727 },  -- 8865
	{ id = 6300, chance = 22727 },  -- death ring
	{ id = "demon horn", chance = 22727, minCount = 1, maxCount = 2 },  -- 5954
	{ id = "ring of healing", chance = 22727 },  -- 2214
	{ id = "talon", chance = 22727, minCount = 1, maxCount = 7 },  -- 2151
	{ id = "the ironworker", chance = 22727 },  -- 8853
	{ id = "double axe", chance = 18182 },  -- 2387
	{ id = "fireborn giant armor", chance = 18182 },  -- 8881
	{ id = "great spirit potion", chance = 18182 },  -- 8472
	{ id = "magic plate armor", chance = 18182 },  -- 2472
	{ id = "might ring", chance = 18182 },  -- 2164
	{ id = "mind stone", chance = 18182 },  -- 2178
	{ id = "royal crossbow", chance = 18182 },  -- 8851
	{ id = "stealth ring", chance = 18182 },  -- 2165
	{ id = "teddy bear", chance = 18182 },  -- 2112
	{ id = "assassin star", chance = 13636, minCount = 16, maxCount = 28 },  -- 7368
	{ id = "black pearl", chance = 13636, minCount = 8, maxCount = 15 },  -- 2144
	{ id = "demonbone", chance = 13636 },  -- 7431
	{ id = "golden mug", chance = 13636 },  -- 2033
	{ id = "Morgaroth's heart", chance = 13636 },  -- 5943
	{ id = "obsidian truncheon", chance = 13636 },  -- 8928
	{ id = "the stomper", chance = 13636 },  -- 8929
	{ id = "white pearl", chance = 13636, minCount = 2, maxCount = 13 },  -- 2143
	{ id = "blue gem", chance = 9091 },  -- 2158
	{ id = "demon shield", chance = 9091 },  -- 2520
	{ id = "energy ring", chance = 9091 },  -- 2167
	{ id = "giant sword", chance = 9091 },  -- 2393
	{ id = "gold ring", chance = 9091 },  -- 2179
	{ id = "golden legs", chance = 9091 },  -- 2470
	{ id = "life crystal", chance = 9091 },  -- 2177
	{ id = 2162, chance = 9091 },  -- magic light wand
	{ id = "orb", chance = 9091 },  -- 2176
	{ id = "steel boots", chance = 9091 },  -- 2645
	{ id = "strange symbol", chance = 9091 },  -- 2174
	{ id = "thunder hammer", chance = 9091 },  -- 2421
	{ id = 2124, chance = 4545 },  -- crystal ring
	{ id = "dragon robe", chance = 4545 },  -- 8867
	{ id = "fire axe", chance = 4545 },  -- 2432
	{ id = "great health potion", chance = 4545 },  -- 7591
	{ id = "mastermind shield", chance = 4545 },  -- 2514
	{ id = "molten plate", chance = 4545 },  -- 8886
	{ id = "small diamond", chance = 4545, maxCount = 5 },  -- 2145
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -2250 },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -1210, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1800, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -580, range = 7, radius = 5, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -1450, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -480, range = 7, radius = 5, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -500, range = 7, radius = 13, effect = CONST_ME_SOUND_RED, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -450, radius = 14, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -200, range = 7, radius = 3, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -400, range = 7, effect = CONST_ME_SOUND_RED, target = false, duration = 20000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -70, maxDamage = -320, radius = 3, effect = CONST_ME_HITAREA, target = true },
	{ name = "dark torturer skill reducer", interval = 2000, chance = 5, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 130,
	--	mitigation = ???,
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 9000, chance = 15, type = COMBAT_HEALING, minDamage = 3800, maxDamage = 4000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 4000, chance = 80, effect = CONST_ME_MAGIC_RED, speed = 610},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)