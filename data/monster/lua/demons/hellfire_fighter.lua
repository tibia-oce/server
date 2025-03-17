-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Hellfire_Fighter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hellfire_Fighter
---


local mType = Game.createMonsterType("Hellfire Fighter")
local monster = {}

monster.description = "a hellfire fighter"
monster.experience = 3800
monster.outfit = {
	lookType = 243,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3800
monster.maxHealth = 3800
monster.race = "fire"
monster.corpse = 6323
monster.speed = 165
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 5,
	color = 212,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "emerald bangle", chance = 2200 },
	{ id = 3019, chance = 190 }, -- demonbone amulet
	{ id = "small diamond", chance = 1400 },
	{ id = "gold coin", chance = 50000, maxCount = 100 },
	{ id = "gold coin", chance = 40000, maxCount = 100 },
	{ id = "gold coin", chance = 10000, maxCount = 46 },
	{ id = "wand of inferno", chance = 9450 },
	{ id = "burnt scroll", chance = 50000 },
	{ id = "blank rune", chance = 30000, maxCount = 2 },
	{ id = "fire sword", chance = 4140 },
	{ id = "fire axe", chance = 440 },
	{ id = "soul orb", chance = 12150 },
	{ id = "demonic essence", chance = 14500 },
	{ id = "magma legs", chance = 682 },
	{ id = "magma coat", chance = 380 },
	{ id = "fiery heart", chance = 9570 },
	{ id = "piece of hellfire armor", chance = 5060 },
	{ id = "coal", chance = 670 }, -- coal
	{ id = "eternal flames", chance = 380 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -520 },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -392, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -60, maxDamage = -330, range = 7, radius = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "hellfire fighter soulfire", interval = 2000, chance = 15, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 62,
	mitigation = 1.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -25 },
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