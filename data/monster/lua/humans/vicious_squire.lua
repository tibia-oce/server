-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Vicious_Squire
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Vicious_Squire
---


local mType = Game.createMonsterType("Vicious Squire")
local monster = {}

monster.description = "a vicious squire"
monster.experience = 900
monster.outfit = {
	lookType = 131,
	lookHead = 97,
	lookBody = 24,
	lookLegs = 73,
	lookFeet = 116,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 1000
monster.maxHealth = 1000
monster.race = "blood"
monster.corpse = 22017
monster.speed = 130
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
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
	{ text = "Your stuff will be mine soon!", yell = false },
	{ text = "I'll cut you a bloody grin!", yell = false },
	{ text = "For hurting me, my sire will kill you!", yell = false },
	{ text = "You shouldn't have come here!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 70 },  -- 2148
	{ id = 2543, chance = 20065, minCount = 1, maxCount = 10 },  -- bolt
	{ id = "crossbow", chance = 12914 },  -- 2455
	{ id = "meat", chance = 10670 },  -- 2666
	{ id = "great health potion", chance = 5859 },  -- 7591
	{ id = "small amethyst", chance = 2559 },  -- 2150
	{ id = 2381, chance = 2477 },  -- halberd
	{ id = "small emerald", chance = 2403 },  -- 2149
	{ id = "small diamond", chance = 2380 },  -- 2145
	{ id = "war hammer", chance = 735 },  -- 2391
	{ id = "scarf", chance = 609 },  -- 2661
	{ id = "might ring", chance = 444 },  -- 2164
	{ id = "knight legs", chance = 347 },  -- 2477
	{ id = "guardian shield", chance = 319 },  -- 2515
	{ id = "warrior helmet", chance = 208 },  -- 2475
	{ id = "piggy bank", chance = 51 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 10, maxDamage = -175 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 10, maxDamage = -100, range = 7, shootEffect = CONST_ANI_BOLT, target = false },
}

monster.defenses = {
	defense = 50,
	armor = 30,
	mitigation = 1.24,
	{ name = "combat", interval = 4000, chance = 25, type = COMBAT_HEALING, minDamage = 20, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = -20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)