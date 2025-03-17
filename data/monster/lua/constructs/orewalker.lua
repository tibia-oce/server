-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Orewalker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orewalker
---


local mType = Game.createMonsterType("Orewalker")
local monster = {}

monster.description = "an orewalker"
monster.experience = 5900
monster.outfit = {
	lookType = 490,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 7200
monster.maxHealth = 7200
monster.race = "undead"
monster.corpse = 15911
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
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
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "CLONK!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 198 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "sulphurous stone", chance = 21103 },  -- 11232
	{ id = "pulverized ore", chance = 21007 },  -- 18427
	{ id = "iron ore", chance = 15923 },  -- 5880
	{ id = "strong health potion", chance = 15374, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "vein of ore", chance = 15016 },  -- 18429
	{ id = "strong mana potion", chance = 14944, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "mana potion", chance = 14920, minCount = 1, maxCount = 4 },  -- 7620
	{ id = "small topaz", chance = 14896, minCount = 1, maxCount = 3 },  -- 9970
	{ id = "great mana potion", chance = 14634, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "blue crystal splinter", chance = 14538, minCount = 1, maxCount = 2 },  -- 18418
	{ id = "prismatic bolt", chance = 14490, minCount = 1, maxCount = 5 },  -- 18435
	{ id = "cyan crystal fragment", chance = 13201 },  -- 18419
	{ id = "shiny stone", chance = 12294 },  -- 11227
	{ id = "ultimate health potion", chance = 9406, minCount = 1, maxCount = 2 },  -- 8473
	{ id = "green crystal shard", chance = 7735 },  -- 18415
	{ id = "dwarven ring", chance = 4536 },  -- 2213
	{ id = "titan axe", chance = 2960 },  -- 7413
	{ id = "glorious axe", chance = 2817 },  -- 7454
	{ id = "magic sulphur", chance = 2435 },  -- 5904
	{ id = "knight legs", chance = 1814 },  -- 2477
	{ id = "wand of defiance", chance = 1504 },  -- 18390
	{ id = "crown helmet", chance = 979 },  -- 2491
	{ id = "yellow gem", chance = 931 },  -- 2154
	{ id = "crown armor", chance = 382 },  -- 2487
	{ id = "crystalline armor", chance = 358 },  -- 8878
	{ id = "crystal crossbow", chance = 191 },  -- 18453
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
	{ name = "orewalker wave", interval = 2000, chance = 15, minDamage = -296, maxDamage = -700, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -1500, length = 6, spread = 3, effect = CONST_ME_GROUNDSHAKER, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -800, maxDamage = -1080, radius = 3, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_SMALLPLANTS, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -800, radius = 2, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 45,
	armor = 79,
	mitigation = 2.31,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 65 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 25 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)