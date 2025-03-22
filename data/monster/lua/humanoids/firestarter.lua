-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Firestarter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Firestarter
---


local mType = Game.createMonsterType("Firestarter")
local monster = {}

monster.description = "a firestarter"
monster.experience = 80
monster.outfit = {
	lookType = 159,
	lookHead = 94,
	lookBody = 77,
	lookLegs = 78,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 180
monster.maxHealth = 180
monster.race = "blood"
monster.corpse = 20599
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
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
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "FIRE!", yell = true },
	{ text = "BURN!", yell = true },
	{ text = "DEATH to the FALSE GOD!!", yell = false },
	{ text = "You shall burn in the thornfires!!", yell = false },
	{ text = "DOWN with the followers of the bog!!", yell = false },
	{ text = "Hey, what's that burnt stench... isn't that... YOU?", yell = false },
	{ text = "Set everything on fire!!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 78325, minCount = 1, maxCount = 35 },  -- 2148
	{ id = "flaming arrow", chance = 29480, minCount = 1, maxCount = 12 },  -- 7840
	{ id = "grapes", chance = 19925 },  -- 2681
	{ id = 13757, chance = 15286 },  -- coal
	{ id = "longsword", chance = 6020 },  -- 2397
	{ id = "elvish talisman", chance = 5016 },  -- 10552
	{ id = "bow", chance = 3886 },  -- 2456
	{ id = 5921, chance = 911 },  -- heaven blossom
	{ id = "flintstone", chance = 358 },  -- 13943
	{ id = "elvish bow", chance = 108 },  -- 7438
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -15 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = 0, maxDamage = -21, radius = 1, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_EXPLOSIONHIT, target = true },
	{ name = "firefield", interval = 2000, chance = 10, radius = 1, shootEffect = CONST_ANI_FIRE, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 0.51,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 5 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)