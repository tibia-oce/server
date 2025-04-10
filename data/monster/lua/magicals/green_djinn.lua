-- Version: 7.3
-- Monster: https://tibia.fandom.com/wiki/Green_Djinn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Green_Djinn
---


local mType = Game.createMonsterType("Green Djinn")
local monster = {}

monster.description = "a green djinn"
monster.experience = 215
monster.outfit = {
	lookType = 51,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 330
monster.maxHealth = 330
monster.race = "blood"
monster.corpse = 6016
monster.speed = 110
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
	{ text = "I grant you a deathwish!", yell = false },
	{ text = "Muahahahahaha", yell = false },
	{ text = "I wish you a merry trip to hell!", yell = false },
	{ text = "Good wishes are for fairytales", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 88454, minCount = 1, maxCount = 115 },  -- 2148
	{ id = 2696, chance = 24358 },  -- cheese
	{ id = "royal spear", chance = 5099, minCount = 1, maxCount = 2 },  -- 7378
	{ id = "small emerald", chance = 2913, minCount = 1, maxCount = 4 },  -- 2149
	{ id = 1980, chance = 2338 },  -- book (green)
	{ id = "dirty turban", chance = 2124 },  -- 12412
	{ id = "green piece of cloth", chance = 2055 },  -- 5910
	{ id = 2747, chance = 966 },  -- grave flower
	{ id = "small oil lamp", chance = 836 },  -- 2063
	{ id = "mana potion", chance = 483 },  -- 7620
	{ id = "mystic turban", chance = 123 },  -- 2663
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -45, maxDamage = -80, range = 7, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -50, maxDamage = -105, range = 7, radius = 1, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_ENERGY, target = false, duration = 5000 },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitMonster = "rat" },
	{ name = "djinn electrify", interval = 2000, chance = 15, range = 5, target = false },
	{ name = "djinn cancel invisibility", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 15,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -13 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)