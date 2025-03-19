-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Execowtioner
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Execowtioner
---


local mType = Game.createMonsterType("Execowtioner")
local monster = {}

monster.description = "an execowtioner"
monster.experience = 2400
monster.outfit = {
	lookType = 609,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3500
monster.maxHealth = 3500
monster.race = "blood"
monster.corpse = 21004
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4,
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
	{ text = "I'm the one who puts the cute into execute!", yell = false },
	{ text = "I'm here to punish!", yell = false },
	{ text = "Justice is swift and unavoidable!", yell = false },
	{ text = "I'll bring justice!", yell = false },
	{ text = "There is excellence in execution!", yell = false },
	{ text = "Your sentence is death!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 65607, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "execowtioner mask", chance = 16126 },  -- 23572
	{ id = "minotaur leather", chance = 15866 },  -- 5878
	{ id = "great health potion", chance = 10573 },  -- 7591
	{ id = "great mana potion", chance = 9905 },  -- 7590
	{ id = "meat", chance = 8431 },  -- 2666
	{ id = "small ruby", chance = 5334, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "small topaz", chance = 4993, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "minotaur horn", chance = 4870, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "red piece of cloth", chance = 2851 },  -- 5911
	{ id = "execowtioner axe", chance = 1064 },  -- 23547
	{ id = "knight axe", chance = 805 },  -- 2430
	{ id = "crown armor", chance = 628 },  -- 2487
	{ id = "titan axe", chance = 587 },  -- 7413
	{ id = "butcher's axe", chance = 505 },  -- 7412
	{ id = "gold ingot", chance = 355 },  -- 9971
	{ id = 7401, chance = 300 },  -- minotaur trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 80 },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_LIFEDRAIN, minDamage = -135, maxDamage = -280, range = 7, radius = 5, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_DRAWBLOOD, target = true },
	{ name = "combat", interval = 2000, chance = 8, type = COMBAT_PHYSICALDAMAGE, minDamage = -90, maxDamage = -200, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 40,
	armor = 40,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)