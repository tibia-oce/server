-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Gozzler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gozzler
---


local mType = Game.createMonsterType("Gozzler")
local monster = {}

monster.description = "a gozzler"
monster.experience = 180
monster.outfit = {
	lookType = 313,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 240
monster.maxHealth = 240
monster.race = "undead"
monster.corpse = 9938
monster.speed = 120
monster.manaCost = 800

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
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Huhuhuhuuu!", yell = false },
	{ text = "Let the fun begin!", yell = false },
	{ text = "Yihahaha!", yell = false },
	{ text = "I'll bite you! Nyehehehe!", yell = false },
	{ text = "Nyarnyarnyarnyar.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 82192, minCount = 1, maxCount = 70 },  -- 2148
	{ id = "plate shield", chance = 10027 },  -- 2510
	{ id = "brown flask", chance = 9039 },  -- 2015
	{ id = "sabre", chance = 8092 },  -- 2385
	{ id = "morning star", chance = 5121 },  -- 2394
	{ id = "battle axe", chance = 3082 },  -- 2378
	{ id = "clerical mace", chance = 774 },  -- 2423
	{ id = "small sapphire", chance = 388 },  -- 2146
	{ id = "serpent sword", chance = 300 },  -- 2409
	{ id = "dwarven ring", chance = 204 },  -- 2213
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -32, maxDamage = -135, range = 1, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 25,
	mitigation = 1.37,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 30, maxDamage = 50, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 240},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)