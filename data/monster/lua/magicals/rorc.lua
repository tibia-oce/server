-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Rorc
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Rorc
---


local mType = Game.createMonsterType("Rorc")
local monster = {}

monster.description = "a rorc"
monster.experience = 105
monster.outfit = {
	lookType = 550,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 260
monster.maxHealth = 260
monster.race = "blood"
monster.corpse = 21223
monster.speed = 88
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Kroaaah!!", yell = false },
	{ text = "Butak <crooooarck> bana zamar!", yell = false },
	{ text = "Krrrooow truaaak kiiiii!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 73494, minCount = 1, maxCount = 35 },  -- 2148
	{ id = "rorc feather", chance = 12015 },  -- 21310
	{ id = "hatched rorc egg", chance = 10961 },  -- 21314
	{ id = "wolf tooth chain", chance = 7939 },  -- 2129
	{ id = "plate shield", chance = 6471 },  -- 2510
	{ id = "orcish axe", chance = 2071 },  -- 2428
	{ id = "rorc egg", chance = 1049 },  -- 21313
	{ id = "obsidian lance", chance = 984 },  -- 2425
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100 },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 40, maxDamage = 55, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 176},
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