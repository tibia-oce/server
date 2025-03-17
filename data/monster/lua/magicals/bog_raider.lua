-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Bog_Raider
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Bog_Raider
---


local mType = Game.createMonsterType("Bog Raider")
local monster = {}

monster.description = "a bog raider"
monster.experience = 800
monster.outfit = {
	lookType = 299,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1300
monster.maxHealth = 1300
monster.race = "venom"
monster.corpse = 8123
monster.speed = 125
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 60,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 4,
	color = 30,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Tchhh!", yell = false },
	{ text = "Slurp!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 92094, minCount = 1, maxCount = 105 },  -- 2148
	{ id = "boggy dreads", chance = 9886 },  -- 10584
	{ id = "great health potion", chance = 2039 },  -- 7591
	{ id = "plate legs", chance = 2019 },  -- 2647
	{ id = "great spirit potion", chance = 2005 },  -- 8472
	{ id = "springsprout rod", chance = 1011 },  -- 8912
	{ id = "ultimate health potion", chance = 781 },  -- 8473
	{ id = "belted cape", chance = 596 },  -- 8872
	{ id = "paladin armor", chance = 139 },  -- 8891
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -183, condition = { type = CONDITION_POISON, totalDamage = 80, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -90, maxDamage = -140, range = 7, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -175, radius = 3, effect = CONST_ME_BUBBLES, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -96, maxDamage = -110, range = 7, shootEffect = CONST_ANI_SMALLEARTH, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, range = 7, effect = CONST_ME_SMALLPLANTS, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 0,
	armor = 20,
	mitigation = 0.78,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 65, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 85 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
