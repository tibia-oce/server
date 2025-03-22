-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Gravedigger
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gravedigger
---


local mType = Game.createMonsterType("Gravedigger")
local monster = {}

monster.description = "a gravedigger"
monster.experience = 950
monster.outfit = {
	lookType = 558,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 21279
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 200,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "High Five!", yell = false },
	{ text = "scrabble", yell = false },
	{ text = "Put it there!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 149 },  -- 2148
	{ id = "platinum coin", chance = 24115 },  -- 2152
	{ id = "unholy bone", chance = 10169 },  -- 11233
	{ id = "safety pin", chance = 7077 },  -- 12449
	{ id = "pile of grave earth", chance = 6988 },  -- 12440
	{ id = "wand of inferno", chance = 5114 },  -- 2187
	{ id = "sudden death rune", chance = 4906, minCount = 1, maxCount = 8 },  -- 2268
	{ id = "strong mana potion", chance = 2617, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "strong health potion", chance = 2587, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "yellow gem", chance = 981 },  -- 2154
	{ id = 6300, chance = 654 },  -- death ring
	{ id = "mysterious voodoo skull", chance = 178 },  -- 5669
	{ id = "skull staff", chance = 119 },  -- 2436
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -320, condition = { type = CONDITION_POISON, totalDamage = 180, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -40, maxDamage = -250, range = 1, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -175, maxDamage = -300, range = 1, shootEffect = CONST_ANI_DEATH, target = false },
	{ name = "drunk", interval = 2000, chance = 10, radius = 5, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 4000 },
}

monster.defenses = {
	defense = 20,
	armor = 58,
	mitigation = 1.68,
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 240},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
