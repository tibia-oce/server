-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Earth_Overlord
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Earth_Overlord
---


local mType = Game.createMonsterType("Earth Overlord")
local monster = {}

monster.description = "Earth Overlord"
monster.experience = 2800
monster.outfit = {
	lookType = 285,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"ElementalOverlordDeath",
}

monster.health = 4000
monster.maxHealth = 4000
monster.race = "undead"
monster.corpse = 8105
monster.speed = 165
monster.manaCost = 0

monster.changeTarget = {
	interval = 20000,
	chance = 30,
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
	rewardBoss = true,
	illusionable = false,
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
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 168 },  -- 2148
	{ id = "mother soil", chance = 100000 },  -- 8305
	{ id = "lump of earth", chance = 47741 },  -- 11222
	{ id = "platinum coin", chance = 40864, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "shiny stone", chance = 9037 },  -- 11227
	{ id = "terra mantle", chance = 1965 },  -- 7884
	{ id = 13757, chance = 589 },  -- coal
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -800, length = 7, spread = 0, effect = CONST_ME_STONES, target = false },
	{ name = "combat", interval = 1000, chance = 9, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -490, radius = 6, effect = CONST_ME_BIGPLANTS, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -750, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 4000 },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)