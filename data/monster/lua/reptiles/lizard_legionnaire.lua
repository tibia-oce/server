-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Lizard_Legionnaire
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lizard_Legionnaire
---


local mType = Game.createMonsterType("Lizard Legionnaire")
local monster = {}

monster.description = "a lizard legionnaire"
monster.experience = 1100
monster.outfit = {
	lookType = 338,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1400
monster.maxHealth = 1400
monster.race = "blood"
monster.corpse = 10359
monster.speed = 133
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Tssss!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 94077, minCount = 1, maxCount = 165 },  -- 2148
	{ id = "broken halberd", chance = 14938 },  -- 11335
	{ id = "strong health potion", chance = 3906 },  -- 7588
	{ id = "legionnaire flags", chance = 1938 },  -- 11334
	{ id = "bunch of ripe rice", chance = 1922 },  -- 11245
	{ id = "lizard leather", chance = 979 },  -- 5876
	{ id = "lizard scale", chance = 972 },  -- 5881
	{ id = "Zaoan halberd", chance = 968 },
	{ id = "small diamond", chance = 949, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "drakinata", chance = 715 },  -- 11305
	{ id = "red lantern", chance = 513 },  -- 11206
	{ id = "Zaoan shoes", chance = 435 },
	{ id = "Zaoan armor", chance = 65 },
	{ id = "lizard trophy", chance = 14 },  -- 11336
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -180 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_SPEAR, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 30,
	mitigation = 1.07,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 45 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
