-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Crazed_Beggar
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Crazed_Beggar
---


local mType = Game.createMonsterType("Crazed Beggar")
local monster = {}

monster.description = "a crazed beggar"
monster.experience = 35
monster.outfit = {
	lookType = 153,
	lookHead = 40,
	lookBody = 19,
	lookLegs = 21,
	lookFeet = 97,
	lookAddons = 3,
	lookMount = 0,
}


monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 20351
monster.speed = 77
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
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{ text = "Hehehe!", yell = false },
	{ text = "Raahhh!", yell = false },
	{ text = "You are one of THEM! Die!", yell = false },
	{ text = "Wanna buy roses??", yell = false },
	{ text = "Make it stop!", yell = false },
	{ text = "They're coming! They're coming!", yell = false },
	{ text = "Gimme money!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99353, minCount = 1, maxCount = 9 },  -- 2148
	{ id = "dirty cape", chance = 60740 },  -- 2237
	{ id = "roll", chance = 19462 },  -- 2690
	{ id = "meat", chance = 9886 },  -- 2666
	{ id = "wooden spoon", chance = 9472 },  -- 2567
	{ id = "wooden hammer", chance = 6858 },  -- 2556
	{ id = "red rose", chance = 5098 },  -- 2744
	{ id = 2570, chance = 4555 },  -- rolling pin
	{ id = "sling herb", chance = 595 },  -- 2802
	{ id = "small blue pillow", chance = 569 },  -- 1681
	{ id = "rum flask", chance = 492 },  -- 5553
	{ id = 9808, chance = 336 },  -- rusty armor (todo: heavily rusted does not exist in items.xml)
	{ id = 2072, chance = 336 },  -- lute
	{ id = 6092, chance = 336 },  -- very noble-looking watch
	{ id = "dwarven ring", chance = 129 },  -- 2213
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25 },
}

monster.defenses = {
	defense = 15,
	armor = 4,
	mitigation = 0.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
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