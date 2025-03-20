-- Version: 7.0
-- Monster: https://tibia.fandom.com/wiki/Blue_Djinn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Blue_Djinn
---


local mType = Game.createMonsterType("Blue Djinn")
local monster = {}

monster.description = "a blue djinn"
monster.experience = 215
monster.outfit = {
	lookType = 80,
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
monster.corpse = 6020
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
	{ text = "Simsalabim", yell = false },
	{ text = "Wishes can come true.", yell = false },
	{ text = "Feel the power of my magic, tiny mortal!", yell = false },
	{ text = "Be careful what you wish for.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 87768, minCount = 1, maxCount = 115 },  -- 2148
	{ id = "carrot", chance = 24359 },  -- 2684
	{ id = "royal spear", chance = 4734, minCount = 1, maxCount = 2 },  -- 7378
	{ id = "small sapphire", chance = 2593, minCount = 1, maxCount = 4 },  -- 2146
	{ id = "1978", chance = 2431 },  -- book (blue)
	{ id = "blue piece of cloth", chance = 1940 },  -- 5912
	{ id = "dirty turban", chance = 1859 },  -- 12412
	{ id = "mana potion", chance = 835 },  -- 7620
	{ id = "small oil lamp", chance = 750 },  -- 2063
	{ id = "blue rose", chance = 526 },  -- 2745
	{ id = "mystic turban", chance = 77 },  -- 2663
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -45, maxDamage = -80, range = 7, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -60, maxDamage = -105, range = 7, radius = 1, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_ENERGY, target = false, duration = 5000 },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitMonster = "rabbit" },
	{ name = "djinn electrify", interval = 2000, chance = 15, range = 5, target = false },
	{ name = "djinn cancel invisibility", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 20,
	mitigation = 0.78,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -13 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)