-- Version: 8.10
-- Monster: https://tibia.fandom.com/wiki/Dark_Magician
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dark_Magician
---


local mType = Game.createMonsterType("Dark Magician")
local monster = {}

monster.description = "a dark magician"
monster.experience = 185
monster.outfit = {
	lookType = 133,
	lookHead = 58,
	lookBody = 95,
	lookLegs = 51,
	lookFeet = 131,
	lookAddons = 2,
	lookMount = 0,
}


monster.health = 325
monster.maxHealth = 325
monster.race = "blood"
monster.corpse = 20367
monster.speed = 90
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
	targetDistance = 4,
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
	{ text = "Feel the power of my runes!", yell = false },
	{ text = "Killing you gets expensive.", yell = false },
	{ text = "My secrets are mine alone!", yell = false },
	{ text = "Stand still!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 75001, minCount = 1, maxCount = 55 },  -- 2148
	{ id = "health potion", chance = 12002 },  -- 7618
	{ id = "mana potion", chance = 11913 },  -- 7620
	{ id = "blank rune", chance = 9989 },  -- 2260
	{ id = "strong health potion", chance = 2968 },  -- 7588
	{ id = "strong mana potion", chance = 2888 },  -- 7589
	{ id = "small enchanted amethyst", chance = 518 },  -- 7762
	{ id = "necrotic rod", chance = 292 },  -- 2185
	{ id = "reins", chance = 21 },  -- 13295
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -40 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -5, maxDamage = -40, range = 7, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -20, maxDamage = -30, range = 7, shootEffect = CONST_ANI_ENERGY, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 0.64,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 60, maxDamage = 80, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
