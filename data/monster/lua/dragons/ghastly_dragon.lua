-- Version: 8.54
-- Monster: https://tibia.fandom.com/wiki/Ghastly_Dragon
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ghastly_Dragon
---


local mType = Game.createMonsterType("Ghastly Dragon")
local monster = {}

monster.description = "a ghastly dragon"
monster.experience = 4600
monster.outfit = {
	lookType = 351,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 7800
monster.maxHealth = 7800
monster.race = "undead"
monster.corpse = 10445
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5,
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
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 366,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 4,
	color = 119,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "EMBRACE MY GIFTS!", yell = true },
	{ text = "I WILL FEAST ON YOUR SOUL!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 99539, minCount = 1, maxCount = 379 },  -- 2148
	{ id = "plate legs", chance = 49142 },  -- 2647
	{ id = "small emerald", chance = 40289, minCount = 1, maxCount = 7 },  -- 2149
	{ id = "dark armor", chance = 34772, minCount = 1, maxCount = 2 },  -- 2489
	{ id = "platinum coin", chance = 30181, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "great mana potion", chance = 30099, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great spirit potion", chance = 29789, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "ultimate health potion", chance = 24922, minCount = 1, maxCount = 2 },  -- 8473
	{ id = "undead heart", chance = 19435, minCount = 1, maxCount = 2 },  -- 11367
	{ id = "twin hooks", chance = 15112 },  -- 11309
	{ id = "Zaoan halberd", chance = 15112 },
	{ id = "soul orb", chance = 12349, minCount = 1, maxCount = 2 },  -- 5944
	{ id = "terra boots", chance = 10121 },  -- 7886
	{ id = 9808, chance = 9797 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "demonic essence", chance = 9052 },  -- 6500
	{ id = "ghastly dragon head", chance = 7060 },  -- 11366
	{ id = "terra legs", chance = 3272 },  -- 7885
	{ id = "drakinata", chance = 1496, minCount = 1, maxCount = 2 },  -- 11305
	{ id = "Zaoan legs", chance = 1134 },
	{ id = "Zaoan shoes", chance = 853 },
	{ id = "shiny stone", chance = 841 },  -- 11227
	{ id = "Zaoan armor", chance = 841 },
	{ id = "jade hat", chance = 806 },  -- 11368
	{ id = "spellweaver's robe", chance = 716 },  -- 11355
	{ id = "guardian boots", chance = 216 },  -- 11240
	{ id = "Zaoan helmet", chance = 190 },
	{ id = "Zaoan sword", chance = 91 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -603 },
	{ name = "ghastly dragon curse", interval = 2000, chance = 5, range = 5, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -920, maxDamage = -1280, range = 5, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -230, range = 7, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "ghastly dragon wave", interval = 2000, chance = 10, minDamage = -120, maxDamage = -250, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -110, maxDamage = -180, radius = 4, effect = CONST_ME_MORTAREA, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -800, range = 7, effect = CONST_ME_SMALLCLOUDS, target = true, duration = 30000 },
}

monster.defenses = {
	defense = 35,
	armor = 30,
	mitigation = 1.24,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
