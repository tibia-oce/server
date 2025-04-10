-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Quara_Mantassin_Scout
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Quara_Mantassin_Scout
---


local mType = Game.createMonsterType("Quara Mantassin Scout")
local monster = {}

monster.description = "a quara mantassin scout"
monster.experience = 100
monster.outfit = {
	lookType = 72,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 220
monster.maxHealth = 220
monster.race = "blood"
monster.corpse = 6064
monster.speed = 70
monster.manaCost = 480

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
	convinceable = true,
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
	{ text = "Shrrrr", yell = false },
	{ text = "Zuerk Pachak!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 93979, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "mantassin tail", chance = 7966 },  -- 12445
	{ id = "chain armor", chance = 4985 },  -- 2464
	{ id = "small sapphire", chance = 1004 },  -- 2146
	{ id = 2229, chance = 974 },  -- skull
	{ id = "two handed sword", chance = 799 },  -- 2377
	{ id = "stealth ring", chance = 706 },  -- 2165
	{ id = "fish fin", chance = 367 },  -- 5895
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 15,
	armor = 7,
	mitigation = 0.56,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)