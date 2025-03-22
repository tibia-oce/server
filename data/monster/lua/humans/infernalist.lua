-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Infernalist
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Infernalist
---


local mType = Game.createMonsterType("Infernalist")
local monster = {}

monster.description = "an infernalist"
monster.experience = 4000
monster.outfit = {
	lookType = 130,
	lookHead = 78,
	lookBody = 76,
	lookLegs = 94,
	lookFeet = 39,
	lookAddons = 2,
	lookMount = 0,
}


monster.health = 3650
monster.maxHealth = 3650
monster.race = "blood"
monster.corpse = 20427
monster.speed = 115
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
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 4,
	runHealth = 900,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "fire elemental", chance = 20, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Nothing will remain but your scorched bones!", yell = false },
	{ text = "Some like it hot!", yell = false },
	{ text = "It's cooking time!", yell = false },
	{ text = "Feel the heat of battle!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 97774, minCount = 1, maxCount = 151 },  -- 2148
	{ id = "great mana potion", chance = 19304 },  -- 7590
	{ id = "great health potion", chance = 19285 },  -- 7591
	{ id = "raspberry", chance = 7969, minCount = 1, maxCount = 5 },  -- 8840
	{ id = "skull staff", chance = 6510 },  -- 2436
	{ id = "small enchanted ruby", chance = 4658 },  -- 7760
	{ id = "energy ring", chance = 2095 },  -- 2167
	{ id = "red piece of cloth", chance = 1197 },  -- 5911
	{ id = "royal tapestry", chance = 767 },  -- 9958
	{ id = "magic sulphur", chance = 636 },  -- 5904
	{ id = "spellbook of mind control", chance = 486 },  -- 8902
	{ id = "black skull", chance = 430 },  -- 9969
	{ id = "red tome", chance = 299 },  -- 1986
	{ id = "magma boots", chance = 187 },  -- 7891
	{ id = "gold ingot", chance = 131 },  -- 9971
	{ id = "crystal of power", chance = 94 },  -- 9980
	{ id = "piggy bank", chance = 94 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -65, maxDamage = -180, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -90, maxDamage = -180, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_MANADRAIN, minDamage = -53, maxDamage = -120, range = 7, radius = 3, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_TELEPORT, target = true },
	{ name = "firefield", interval = 2000, chance = 15, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -250, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -150, radius = 2, effect = CONST_ME_EXPLOSIONAREA, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 33,
	mitigation = 1.15,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 60, maxDamage = 230, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)