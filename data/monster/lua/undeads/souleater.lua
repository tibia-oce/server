-- Version: 8.60
-- Monster: https://tibia.fandom.com/wiki/Souleater
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Souleater
---


local mType = Game.createMonsterType("Souleater")
local monster = {}

monster.description = "a souleater"
monster.experience = 1300
monster.outfit = {
	lookType = 355,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1100
monster.maxHealth = 1100
monster.race = "undead"
monster.corpse = 12631
monster.speed = 105
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 3,
	color = 137,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Life is such a fickle thing!", yell = false },
	{ text = "I will devour your soul.", yell = false },
	{ text = "Souuuls!", yell = false },
	{ text = "I will feed on you.", yell = false },
	{ text = "Aaaahh", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 88031, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 49760, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "lizard essence", chance = 14994 },  -- 12636
	{ id = "ultimate health potion", chance = 9166 },  -- 8473
	{ id = "great mana potion", chance = 7947 },  -- 7590
	{ id = "ectoplasmic sushi", chance = 1984 },  -- 12637
	{ id = "necrotic rod", chance = 965 },  -- 2185
	{ id = "wand of cosmic energy", chance = 941 },  -- 2189
	{ id = 6300, chance = 316 },  -- death ring
	{ id = "spirit container", chance = 132 },  -- 5884
	{ id = "souleater trophy", chance = 14 },  -- 12635
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -210 },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -50, maxDamage = -100, range = 7, shootEffect = CONST_ANI_SMALLICE, target = true },
	{ name = "souleater drown", interval = 2000, chance = 10, target = false },
	{ name = "souleater wave", interval = 2000, chance = 10, minDamage = -100, maxDamage = -200, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -30, maxDamage = -60, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	mitigation = 0.51,
	{ name = "invisible", interval = 2000, chance = 5, effect = CONST_ME_MAGIC_BLUE },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 120, maxDamage = 125, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 60 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)