-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Phantasm
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Phantasm
---


local mType = Game.createMonsterType("Phantasm")
local monster = {}

monster.description = "a Phantasm"
monster.experience = 4400
monster.outfit = {
	lookType = 241,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3950
monster.maxHealth = 3950
monster.race = "undead"
monster.corpse = 6343
monster.speed = 170
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 350,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 3,
	color = 203,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Phantasm Summon", chance = 35, interval = 2000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Oh my, you forgot to put your pants on!", yell = false },
	{ text = "Weeheeheeheehee!", yell = false },
	{ text = "Its nothing but a dream.", yell = false },
	{ text = "Dream a little dream with me!", yell = false },
	{ text = "Give in.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 88953, minCount = 5, maxCount = 246 },  -- 2148
	{ id = "platinum coin", chance = 88953, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "great mana potion", chance = 31170, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "shadow herb", chance = 26818 },  -- 2804
	{ id = "blank rune", chance = 21629, minCount = 1, maxCount = 2 },  -- 2260
	{ id = "ultimate health potion", chance = 17872 },  -- 8473
	{ id = "demonic essence", chance = 17668 },  -- 6500
	{ id = "small amethyst", chance = 13669, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "small topaz", chance = 13446, minCount = 1, maxCount = 3 },  -- 9970
	{ id = "small ruby", chance = 11419, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "small emerald", chance = 10768, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "shadow sceptre", chance = 911 },  -- 7451
	{ id = "stealth ring", chance = 837 },  -- 2165
	{ id = "crown armor", chance = 725 },  -- 2487
	{ id = "abyss hammer", chance = 391 },  -- 7414
	{ id = 6300, chance = 372 },  -- death ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -475 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -610, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -5, maxDamage = -80, radius = 3, effect = CONST_ME_YELLOW_RINGS, target = false },
	{ name = "phantasm drown", interval = 2000, chance = 15, target = false },
	{ name = "drunk", interval = 2000, chance = 15, radius = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.defenses = {
	defense = 0,
	armor = 80,
	mitigation = 1.10,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 228, maxDamage = 449, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_RED, speed = 340},
	{ name = "invisible", interval = 2000, chance = 25, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)