-- Version: 6.2
-- Monster: https://tibia.fandom.com/wiki/Frost_Troll
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Frost_Troll
---


local mType = Game.createMonsterType("Frost Troll")
local monster = {}

monster.description = "a frost troll"
monster.experience = 23
monster.outfit = {
	lookType = 53,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 55
monster.maxHealth = 55
monster.race = "blood"
monster.corpse = 5998
monster.speed = 70
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
	runHealth = 10,
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
	{ text = "Brrr", yell = false },
	{ text = "Broar!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 50363, minCount = 1, maxCount = 12 },  -- 2148
	{ id = "spear", chance = 20331 },  -- 2389
	{ id = "fish", chance = 18163 },  -- 2667
	{ id = "rapier", chance = 15536 },  -- 2384
	{ id = 2512, chance = 15536 },  -- wooden shield
	{ id = "twigs", chance = 8175 },  -- 2245
	{ id = "frosty ear of a troll", chance = 2011 },  -- 10565
	{ id = "coat", chance = 1128 },  -- 2651
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20 },
}

monster.defenses = {
	defense = 15,
	armor = 6,
	mitigation = 0.23,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
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