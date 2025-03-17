-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Barbarian_Bloodwalker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Barbarian_Bloodwalker
---


local mType = Game.createMonsterType("Barbarian Bloodwalker")
local monster = {}

monster.description = "a barbarian bloodwalker"
monster.experience = 195
monster.outfit = {
	lookType = 255,
	lookHead = 114,
	lookBody = 113,
	lookLegs = 132,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 305
monster.maxHealth = 305
monster.race = "blood"
monster.corpse = 18054
monster.speed = 118
monster.manaCost = 590

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
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
	{ text = "YAAAHEEE!", yell = true },
	{ text = "SLAUGHTER!", yell = true },
	{ text = "CARNAGE!", yell = true },
	{ text = "You can run but you can't hide", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 55198, minCount = 1, maxCount = 12 },  -- 2148
	{ id = "chain helmet", chance = 10635 },  -- 2458
	{ id = "chain armor", chance = 10185 },  -- 2464
	{ id = 2044, chance = 8122 },  -- lamp
	{ id = 2381, chance = 6946 },  -- halberd
	{ id = "battle axe", chance = 5936 },  -- 2378
	{ id = "ham", chance = 4943 },  -- 2671
	{ id = "health potion", chance = 942 },  -- 7618
	{ id = "red piece of cloth", chance = 501 },  -- 5911
	{ id = "beastslayer axe", chance = 349 },  -- 3962
	{ id = "shard", chance = 312 },  -- 7290
	{ id = "fur boots", chance = 83 },  -- 7457
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240 },
}

monster.defenses = {
	defense = 0,
	armor = 9,
	mitigation = 0.25,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 236},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
