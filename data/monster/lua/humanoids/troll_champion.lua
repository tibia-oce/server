-- Version: 8.10
-- Monster: https://tibia.fandom.com/wiki/Troll_Champion
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Troll_Champion
---


local mType = Game.createMonsterType("Troll Champion")
local monster = {}

monster.description = "a troll champion"
monster.experience = 40
monster.outfit = {
	lookType = 281,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 75
monster.maxHealth = 75
monster.race = "blood"
monster.corpse = 7926
monster.speed = 69
monster.manaCost = 350

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
	staticAttackChance = 95,
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
	{ text = "Meee maity!", yell = false },
	{ text = "Grrrr", yell = false },
	{ text = "Whaaaz up!?", yell = false },
	{ text = "Gruntz!", yell = false },
	{ text = "Groar", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 64606, minCount = 1, maxCount = 12 },  -- 2148
	{ id = "spear", chance = 25083 },  -- 2389
	{ id = "meat", chance = 9967 },  -- 2666
	{ id = "leather boots", chance = 9956 },  -- 2643
	{ id = 2512, chance = 5314 },  -- wooden shield
	{ id = 2544, chance = 5057, minCount = 1, maxCount = 5 },  -- arrow
	{ id = "studded club", chance = 5053 },  -- 2448
	{ id = "bunch of troll hair", chance = 3055 },  -- 10606
	{ id = "trollroot", chance = 920 },  -- 12471
	{ id = "silver amulet", chance = 128 },  -- 2170
}
monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -35 },
}

monster.defenses = {
	defense = 20,
	armor = 10,
	mitigation = 0.28,
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
