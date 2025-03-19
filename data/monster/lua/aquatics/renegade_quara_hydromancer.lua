-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Renegade_Quara_Hydromancer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Renegade_Quara_Hydromancer
---


local mType = Game.createMonsterType("Renegade Quara Hydromancer")
local monster = {}

monster.description = "a renegade quara hydromancer"
monster.experience = 1800
monster.outfit = {
	lookType = 47,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2000
monster.maxHealth = 2000
monster.race = "blood"
monster.corpse = 6066
monster.speed = 245
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 0,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 2,
	color = 35,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "platinum coin", chance = 80268, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "quara eye", chance = 18463 },  -- 12444
	{ id = "mind stone", chance = 10467 },  -- 2178
	{ id = "shrimp", chance = 7207 },  -- 2670
	{ id = "small emerald", chance = 7207, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "small topaz", chance = 6383, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "great mana potion", chance = 5491, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "great health potion", chance = 5079, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "spirit cloak", chance = 4976 },  -- 8870
	{ id = "green crystal shard", chance = 2986 },  -- 18415
	{ id = "green piece of cloth", chance = 2951 },  -- 5910
	{ id = "yellow piece of cloth", chance = 2505 },  -- 5914
	{ id = "life ring", chance = 1887 },  -- 2168
	{ id = "fish fin", chance = 1407 },  -- 5895
	{ id = "giant shimmering pearl", chance = 1270 },
	{ id = "wand of cosmic energy", chance = 927 },  -- 2189
	{ id = "knight armor", chance = 686 },  -- 2476
	{ id = "green gem", chance = 446 },  -- 2155
	{ id = 7632, chance = 34 },  -- giant shimmering pearl
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 110, attack = 90, effect = CONST_ME_DRAWBLOOD, condition = { type = CONDITION_POISON, totalDamage = 5, interval = 4000 } },
	{ name = "speed", interval = 2000, chance = 15, speed = -350, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 15000 },
}

monster.defenses = {
	defense = 15,
	armor = 30,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -25 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)