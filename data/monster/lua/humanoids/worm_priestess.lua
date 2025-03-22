-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Worm_Priestess
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Worm_Priestess
---


local mType = Game.createMonsterType("Worm Priestess")
local monster = {}

monster.description = "a worm priestess"
monster.experience = 1500
monster.outfit = {
	lookType = 613,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1100
monster.maxHealth = 1100
monster.race = "blood"
monster.corpse = 23470
monster.speed = 99
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 200,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "An enemy of the worm shall become his food!", yell = false },
	{ text = "The great worm will swallow you!", yell = false },
	{ text = "From the earthy depths he comes and brings freedom!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 150 },  -- 2148
	{ id = "platinum coin", chance = 39808, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "purple robe", chance = 16009 },  -- 12429
	{ id = "strong mana potion", chance = 12252, minCount = 1, maxCount = 3 },  -- 7589
	{ id = "snakebite rod", chance = 11917 },  -- 2182
	{ id = "taurus mace", chance = 5062 },  -- 7425
	{ id = "minotaur leather", chance = 4973 },  -- 5878
	{ id = 2050, chance = 4969 },  -- torch
	{ id = "minotaur horn", chance = 2898, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "small amethyst", chance = 2627, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "small topaz", chance = 2489, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "small emerald", chance = 2444, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "small ruby", chance = 2442, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "small sapphire", chance = 2420, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "small diamond", chance = 2417, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "blue piece of cloth", chance = 1560 },  -- 5912
	{ id = "underworld rod", chance = 1505 },  -- 8910
	{ id = "red piece of cloth", chance = 1502 },  -- 5911
	{ id = "green piece of cloth", chance = 1473 },  -- 5910
	{ id = "yellow gem", chance = 517 },  -- 2154
	{ id = "red gem", chance = 470 },  -- 2156
	{ id = 7401, chance = 138 },  -- minotaur trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 50, attack = 50 },
	{ name = "combat", interval = 2000, chance = 24, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -130, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = true },
	{ name = "combat", interval = 2000, chance = 16, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -165, range = 4, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_POISONAREA, target = false },
	{ name = "worm priestess paralyze", interval = 2000, chance = 12, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -115, maxDamage = -200, range = 7, radius = 3, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -300, range = 7, radius = 4, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_HITBYPOISON, target = true },
}

monster.defenses = {
	defense = 20,
	armor = 36,
	mitigation = 1.37,
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "haste", interval = 2000, chance = 9, speedChange = 198, effect = CONST_ME_MAGIC_RED, target = false, duration = 1000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)