-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Muddy_Earth_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Muddy_Earth_Elemental
---


local mType = Game.createMonsterType("Muddy Earth Elemental")
local monster = {}

monster.description = "a muddy earth elemental"
monster.experience = 450
monster.outfit = {
	lookType = 301,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 650
monster.maxHealth = 650
monster.race = "undead"
monster.corpse = 8105
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 50,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 1,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 77041, minCount = 1, maxCount = 128 },  -- 2148
	{ id = "small stone", chance = 39421, minCount = 1, maxCount = 5 },  -- 1294
	{ id = "lump of earth", chance = 20588 },  -- 11222
	{ id = 2244, chance = 19140 },  -- some leaves
	{ id = "natural soil", chance = 3995 },  -- 8298
	{ id = "clay lump", chance = 834 },  -- 11339
	{ id = 13757, chance = 439 },  -- coal
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -160 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -25, maxDamage = -155, range = 7, radius = 2, effect = CONST_ME_STONES, target = true },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 1000, chance = 10, minDamage = 0, maxDamage = -26, length = 6, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 85 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
