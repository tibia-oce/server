-- Version: 8.60
-- Monster: https://tibia.fandom.com/wiki/Draken_Elite
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Draken_Elite
---


local mType = Game.createMonsterType("Draken Elite")
local monster = {}

monster.description = "a draken elite"
monster.experience = 4200
monster.outfit = {
	lookType = 362,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5550
monster.maxHealth = 5550
monster.race = "blood"
monster.corpse = 11653
monster.speed = 166
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 161,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "For ze emperor!", yell = false },
	{ text = "You will die zhouzandz deazhz!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 97100, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 50063, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "meat", chance = 29999 },  -- 2666
	{ id = "broken slicer", chance = 24957 },  -- 12617
	{ id = "broken draken mail", chance = 17709 },  -- 12616
	{ id = "draken wristbands", chance = 14173 },  -- 12615
	{ id = "ultimate health potion", chance = 9292, minCount = 1, maxCount = 3 },  -- 8473
	{ id = "great mana potion", chance = 8994, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "draken sulphur", chance = 8078 },  -- 12614
	{ id = "small diamond", chance = 2466, minCount = 1, maxCount = 4 },  -- 2145
	{ id = "magic sulphur", chance = 2054 },  -- 5904
	{ id = "assassin dagger", chance = 891 },  -- 7404
	{ id = "twiceslicer", chance = 865 },  -- 12613
	{ id = "Zaoan legs", chance = 862 },
	{ id = "draken boots", chance = 574 },  -- 12646
	{ id = "Zaoan armor", chance = 567 },
	{ id = "Zaoan sword", chance = 498 },
	{ id = "Zaoan helmet", chance = 149 },
	{ id = "elite draken mail", chance = 92 },  -- 12607
	{ id = "snake god's wristguard", chance = 51 },  -- 12647
	{ id = "blade of corruption", chance = 41 },  -- 12649
	{ id = "cobra crown", chance = 10 },  -- 12630
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -354 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -240, maxDamage = -550, length = 4, spread = 3, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -300, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -280, maxDamage = -410, radius = 4, effect = CONST_ME_POFF, target = true },
	{ name = "soulfire rune", interval = 2000, chance = 10, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -250, maxDamage = -320, range = 7, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 60,
	armor = 60,
	mitigation = 1.60,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 510, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
