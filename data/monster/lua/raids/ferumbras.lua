-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Ferumbras
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ferumbras
---


local mType = Game.createMonsterType("Ferumbras")
local monster = {}

monster.description = "Ferumbras"
monster.experience = 12000
monster.outfit = {
	lookType = 229,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 90000
monster.maxHealth = 90000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	targetDistance = 2,
	runHealth = 2500,
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
		{ name = "Demon", chance = 12, interval = 3000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "NO ONE WILL STOP ME THIS TIME!", yell = true },
	{ text = "THE POWER IS MINE!", yell = true },
	{ text = "I returned from death and you dream about defeating me?", yell = false },
	{ text = "Witness the first seconds of my eternal world domination!", yell = false },
	{ text = "Even in my weakened state I will crush you all!", yell = false },
}

monster.loot = {
	{ id = "Ferumbras' hat", chance = 100000 },  -- 5903
	{ id = "gold coin", chance = 97959, minCount = 18, maxCount = 184 },  -- 2148
	{ id = "gold ingot", chance = 75510, minCount = 1, maxCount = 2 },  -- 9971
	{ id = "great shield", chance = 26531 },  -- 2522
	{ id = "spellbook of lost souls", chance = 26531 },  -- 8903
	{ id = "golden armor", chance = 24490 },  -- 2466
	{ id = "golden legs", chance = 22449 },  -- 2470
	{ id = "spellbook of mind control", chance = 22449 },  -- 8902
	{ id = "velvet mantle", chance = 22449 },  -- 8868
	{ id = "demon shield", chance = 20408 },  -- 2520
	{ id = "divine plate", chance = 20408 },  -- 8885
	{ id = "magma legs", chance = 20408 },  -- 7894
	{ id = "tempest shield", chance = 20408 },  -- 2542
	{ id = "emerald bangle", chance = 18367 },  -- 2127
	{ id = "glacier kilt", chance = 18367 },  -- 7896
	{ id = "lightning legs", chance = 18367 },  -- 7895
	{ id = "phoenix shield", chance = 18367 },  -- 2539
	{ id = "spellbook of dark mysteries", chance = 18367 },  -- 8918
	{ id = "terra legs", chance = 18367 },  -- 7885
	{ id = "emerald sword", chance = 16327 },  -- 8930
	{ id = "havoc blade", chance = 16327 },  -- 7405
	{ id = "shadow sceptre", chance = 16327 },  -- 7451
	{ id = "small emerald", chance = 16327, minCount = 1, maxCount = 100 },  -- 2149
	{ id = 7632, chance = 14286, minCount = 4, maxCount = 10 },  -- giant shimmering pearl
	{ id = "magic plate armor", chance = 14286 },  -- 2472
	{ id = "mastermind shield", chance = 14286 },  -- 2514
	{ id = "runed sword", chance = 14286 },  -- 7417
	{ id = "spellscroll of prophecies", chance = 14286 },  -- 8904
	{ id = "chaos mace", chance = 12245 },  -- 7427
	{ id = "demonwing axe", chance = 12245 },  -- 8926
	{ id = "greenwood coat", chance = 12245 },  -- 8869
	{ id = "small sapphire", chance = 12245, minCount = 17, maxCount = 98 },  -- 2146
	{ id = "white pearl", chance = 12245, minCount = 44, maxCount = 88 },  -- 2143
	{ id = "haunted blade", chance = 10204 },  -- 7407
	{ id = "hellforged axe", chance = 10204 },  -- 8924
	{ id = "obsidian truncheon", chance = 10204 },  -- 8928
	{ id = "ornamented axe", chance = 10204 },  -- 7411
	{ id = "queen's sceptre", chance = 10204 },  -- 7410
	{ id = "small amethyst", chance = 10204, minCount = 40, maxCount = 54 },  -- 2150
	{ id = "small topaz", chance = 10204, minCount = 21, maxCount = 87 },  -- 9970
	{ id = "demonrage sword", chance = 8163 },  -- 7382
	{ id = "jade hammer", chance = 8163 },  -- 7422
	{ id = "platinum coin", chance = 8163, minCount = 30, maxCount = 58 },  -- 2152
	{ id = "skullcrusher", chance = 8163 },  -- 7423
	{ id = "soul orb", chance = 8163, minCount = 8, maxCount = 9 },  -- 5944
	{ id = "vile axe", chance = 8163 },  -- 7388
	{ id = "abyss hammer", chance = 6122 },  -- 7414
	{ id = "berserker", chance = 6122 },  -- 7403
	{ id = "black pearl", chance = 6122, minCount = 10, maxCount = 83 },  -- 2144
	{ id = "bloody edge", chance = 6122 },  -- 7416
	{ id = "nightmare blade", chance = 6122 },  -- 7418
	{ id = "great axe", chance = 4082 },  -- 2415
	{ id = "impaler", chance = 4082 },  -- 7435
	{ id = "red tome", chance = 4082 },  -- 1986
	{ id = "small diamond", chance = 4082, minCount = 34, maxCount = 82 },  -- 2145
	{ id = "small ruby", chance = 4082, minCount = 87, maxCount = 92 },  -- 2147
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -500, maxDamage = -700, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -450, length = 8, spread = 0, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 21, type = COMBAT_LIFEDRAIN, minDamage = -450, maxDamage = -500, radius = 6, effect = CONST_ME_POFF, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -20, maxDamage = -40, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -900, maxDamage = -1000, range = 4, radius = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 18, minDamage = -300, maxDamage = -400, radius = 6, effect = CONST_ME_ENERGYHIT, target = false },
	-- fire
	{ name = "condition", type = CONDITION_FIRE, interval = 3000, chance = 20, minDamage = -500, maxDamage = -600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
}

monster.defenses = {
	defense = 120,
	armor = 100,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 900, maxDamage = 1500, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "invisible", interval = 4000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)