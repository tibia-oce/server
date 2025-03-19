-- Version: 10.55
-- Monster: https://tibia.fandom.com/wiki/Troll_Marauder
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Troll_Marauder
---


local mType = Game.createMonsterType("Troll Marauder")
local monster = {}

monster.description = "a troll marauder"
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

monster.health = 70
monster.maxHealth = 70
monster.race = "blood"
monster.corpse = 861
monster.speed = 60
monster.manaCost = 350

monster.changeTarget = {
	interval = 2000,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 8 },  -- 2148
	{ id = "spear", chance = 26471 },  -- 2389
	{ id = "studded armor", chance = 14706 },  -- 2484
	{ id = "studded club", chance = 11765 },  -- 2448
	{ id = "meat", chance = 10294 },  -- 2666
	{ id = "leather boots", chance = 8824 },  -- 2643
	{ id = "simple arrow", chance = 7353, minCount = 1, maxCount = 7 },  -- 23839
	{ id = 2512, chance = 7353 },  -- wooden shield
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 10, attack = 25 },
}

monster.defenses = {
	defense = 4,
	armor = 8,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
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