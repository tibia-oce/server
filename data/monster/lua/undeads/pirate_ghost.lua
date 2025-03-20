-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Pirate_Ghost
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Pirate_Ghost
---


local mType = Game.createMonsterType("Pirate Ghost")
local monster = {}

monster.description = "a pirate ghost"
monster.experience = 250
monster.outfit = {
	lookType = 196,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 275
monster.maxHealth = 275
monster.race = "undead"
monster.corpse = 5565
monster.speed = 105
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Yooh Ho Hooh Ho!", yell = false },
	{ text = "Hell is waiting for You!", yell = false },
	{ text = "It's alive!", yell = false },
	{ text = "The curse! Aww the curse!", yell = false },
	{ text = "You will not get my treasure.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 46642, minCount = 1, maxCount = 67 },  -- 2148
	{ id = "tattered piece of robe", chance = 4249 },  -- 10601
	{ id = "1948", chance = 822 },  -- parchment (rewritable)
	{ id = "stealth ring", chance = 685 },  -- 2165
	{ id = "spike sword", chance = 183 },  -- 2383
	{ id = "red robe", chance = 46 },  -- 2655
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, condition = { type = CONDITION_POISON, totalDamage = 40, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -40, maxDamage = -80, radius = 1, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -50, maxDamage = -65, range = 7, radius = 3, effect = CONST_ME_SOUND_RED, target = true },
}

monster.defenses = {
	defense = 0,
	armor = 30,
	mitigation = 0.78,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 40, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)