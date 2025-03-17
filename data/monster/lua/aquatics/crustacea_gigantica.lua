-- Version: 8.70
-- Monster: https://tibia.fandom.com/wiki/Crustacea_Gigantica
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Crustacea_Gigantica
---


local mType = Game.createMonsterType("Crustacea Gigantica")
local monster = {}

monster.description = "a crustacea gigantica"
monster.experience = 1800
monster.outfit = {
	lookType = 383,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1600
monster.maxHealth = 1600
monster.race = "blood"
monster.corpse = 12344
monster.speed = 240
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Chrchrchr", yell = false },
	{ text = "Klonklonk", yell = false },
	{ text = "Chrrrrr", yell = false },
	{ text = "Crunch crunch", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 96000, maxCount = 100 },
	{ id = "gold coin", chance = 56000, maxCount = 75 },
	{ id = "strong mana potion", chance = 8885 },
	{ id = "strong health potion", chance = 3880 },
	{ id = "giant crab pincer", chance = 5000, maxCount = 2 },
	{ id = "ring of healing", chance = 3000 }, -- ring of healing
	{ id = "great mana potion", chance = 1220 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 45,
	armor = 40,
	mitigation = 0.91,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)