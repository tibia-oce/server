-- Version: 3.0
-- Monster: https://tibia.fandom.com/wiki/Orc
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc
---


local mType = Game.createMonsterType("Orc")
local monster = {}

monster.description = "an orc"
monster.experience = 25
monster.outfit = {
	lookType = 5,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 70
monster.maxHealth = 70
monster.race = "blood"
monster.corpse = 5966
monster.speed = 75
monster.manaCost = 300

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 15,
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
	{ text = "Grow truk grrrrr.", yell = false },
	{ text = "Prek tars, dekklep zurk.", yell = false },
	{ text = "Grak brrretz!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 84952, minCount = 1, maxCount = 17 },  -- 2148
	{ id = "meat", chance = 10063 },  -- 2666
	{ id = "studded armor", chance = 7821 },  -- 2484
	{ id = "studded shield", chance = 7151 },  -- 2526
	{ id = "sabre", chance = 5895 },  -- 2385
	{ id = "axe", chance = 5006 },  -- 2386
	{ id = "studded helmet", chance = 3013 },  -- 2482
	{ id = "orc leather", chance = 511 },  -- 12435
	{ id = "orc tooth", chance = 88 },  -- 11113
	-- { id = "heavy old tome", chance = 3 },  -- todo: heavy old tome does not exist in items.xml
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -35 },
}

monster.defenses = {
	defense = 10,
	armor = 4,
	mitigation = 0.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
