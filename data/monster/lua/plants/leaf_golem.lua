-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Leaf_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Leaf_Golem
---


local mType = Game.createMonsterType("Leaf Golem")
local monster = {}

monster.description = "a leaf golem"
monster.experience = 45
monster.outfit = {
	lookType = 567,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 90
monster.maxHealth = 90
monster.race = "undead"
monster.corpse = 21358
monster.speed = 68
monster.manaCost = 0

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
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
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
	{ text = "*crackle*", yell = false },
	{ text = "*swwwwishhhh*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 87499, minCount = 1, maxCount = 27 },  -- 2148
	{ id = "fir cone", chance = 14908 },  -- 21428
	{ id = "dowser", chance = 12182 },  -- 21427
	{ id = "swampling club", chance = 5129 },  -- 20104
	{ id = "white mushroom", chance = 4946, minCount = 1, maxCount = 3 },  -- 2787
	{ id = "small emerald", chance = 964 },  -- 2149
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -15, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = true },
	{ name = "speed", interval = 2000, chance = 20, speed = -600, radius = 3, effect = CONST_ME_SMALLPLANTS, target = false, duration = 9000 },
}

monster.defenses = {
	defense = 10,
	armor = 11,
	mitigation = 0.41,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
