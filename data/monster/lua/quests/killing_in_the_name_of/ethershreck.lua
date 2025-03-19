-- Version: 9.20
-- Monster: https://tibia.fandom.com/wiki/Ethershreck
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ethershreck
---


local mType = Game.createMonsterType("Ethershreck")
local monster = {}

monster.description = "Ethershreck"
monster.experience = 5600
monster.outfit = {
	lookType = 351,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 9500
monster.maxHealth = 9500
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 366,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 4,
	color = 119,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "EMBRACE MY GIFTS!", yell = true },
}

monster.loot = {
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "ghastly dragon head", chance = 100000 },  -- 11366
	{ id = 7632, chance = 100000 },  -- giant shimmering pearl
	{ id = "gold coin", chance = 100000, minCount = 6, maxCount = 198 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 15 },  -- 2152
	{ id = "small topaz", chance = 100000, minCount = 1, maxCount = 10 },  -- 9970
	{ id = "undead heart", chance = 100000 },  -- 11367
	{ id = "Zaoan halberd", chance = 76852 },
	{ id = "ultimate health potion", chance = 58333 },  -- 8473
	{ id = "jade hat", chance = 46605 },  -- 11368
	{ id = "shiny stone", chance = 45370 },  -- 11227
	{ id = "great mana potion", chance = 33642, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "great spirit potion", chance = 29938, minCount = 1, maxCount = 3 },  -- 8472
	{ id = "Zaoan shoes", chance = 29938 },
	{ id = "great health potion", chance = 29321, minCount = 1, maxCount = 3 },  -- 7591
	{ id = "spellweaver's robe", chance = 15741 },  -- 11355
	{ id = "Zaoan armor", chance = 15432 },
	{ id = "Zaoan legs", chance = 14198 },
	{ id = "drakinata", chance = 11111 },  -- 11305
	{ id = "Zaoan helmet", chance = 9259 },
	{ id = "sai", chance = 8025 },  -- 11306
	{ id = "guardian boots", chance = 3395 },  -- 11240
	{ id = "Zaoan sword", chance = 2160 },
	{ id = "golden can of oil", chance = 1235 },  -- 13938
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 80, attack = 100 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -230, range = 7, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "ghastly dragon curse", interval = 2000, chance = 10, range = 7, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -920, maxDamage = -1260, range = 7, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -90, maxDamage = -350, range = 7, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -70, maxDamage = -180, radius = 4, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 45,
	mitigation = 1.74,
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_HEALING, minDamage = 70, maxDamage = 300, effect = CONST_ME_MAGIC_GREEN, target = false },
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