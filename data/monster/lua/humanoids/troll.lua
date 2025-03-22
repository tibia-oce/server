-- Version: 2.0
-- Monster: https://tibia.fandom.com/wiki/Troll
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Troll
---


local mType = Game.createMonsterType("Troll")
local monster = {}

monster.description = "a troll"
monster.experience = 20
monster.outfit = {
	lookType = 15,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 50
monster.maxHealth = 50
monster.race = "blood"
monster.corpse = 5960
monster.speed = 63
monster.manaCost = 290

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
	{ text = "Hmmm, bugs", yell = false },
	{ text = "Hmmm, dogs", yell = false },
	{ text = "Grrr", yell = false },
	{ text = "Groar", yell = false },
	{ text = "Gruntz!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 65090, minCount = 1, maxCount = 12 },  -- 2148
	{ id = "hand axe", chance = 17867 },  -- 2380
	{ id = "meat", chance = 15147 },  -- 2666
	{ id = "spear", chance = 13145 },  -- 2389
	{ id = "leather helmet", chance = 11782 },  -- 2461
	{ id = "leather boots", chance = 10016 },  -- 2643
	{ id = 2120, chance = 7787 },  -- rope
	{ id = "studded club", chance = 5017 },  -- 2448
	{ id = 2512, chance = 5005 },  -- wooden shield
	{ id = "bunch of troll hair", chance = 1018 },  -- 10606
	{ id = "silver amulet", chance = 100 },  -- 2170
	-- { id = "heavy old tome", chance = 25 },  -- todo: heavy old tome does not exist in items.xml
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -15 },
}

monster.defenses = {
	defense = 10,
	armor = 6,
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
