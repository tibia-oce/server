-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Minotaur_Invader
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur_Invader
---


local mType = Game.createMonsterType("Minotaur Invader")
local monster = {}

monster.description = "a minotaur invader"
monster.experience = 1600
monster.outfit = {
	lookType = 29,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1850
monster.maxHealth = 1850
monster.race = "blood"
monster.corpse = 5983
monster.speed = 120
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "For the victory!", yell = false },
	{ text = "We will crush the enemy!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 49554, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "piece of warrior armor", chance = 14646 },  -- 12438
	{ id = "small topaz", chance = 10342, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "minotaur horn", chance = 8233, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "small amethyst", chance = 5185 },  -- 2150
	{ id = "minotaur leather", chance = 5128 },  -- 5878
	{ id = "small ruby", chance = 4649 },  -- 2147
	{ id = "mooh'tah plate", chance = 949 },  -- 23537
	{ id = "blue piece of cloth", chance = 911 },  -- 5912
	{ id = "guardian shield", chance = 815 },  -- 2515
	{ id = "red gem", chance = 767 },  -- 2156
	{ id = "warrior helmet", chance = 642 },  -- 2475
	{ id = "knight axe", chance = 613 },  -- 2430
	{ id = "red piece of cloth", chance = 604 },  -- 5911
	{ id = 7401, chance = 220 },  -- minotaur trophy
	{ id = "blue gem", chance = 211 },  -- 2158
	{ id = "titan axe", chance = 163 },  -- 7413
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350 },
}

monster.defenses = {
	defense = 20,
	armor = 40,
	mitigation = 1.76,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)