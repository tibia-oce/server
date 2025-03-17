-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Stabilizing_Dread_Intruder
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Stabilizing_Dread_Intruder
---


local mType = Game.createMonsterType("Stabilizing Dread Intruder")
local monster = {}

monster.description = "a stabilizing dread intruder"
monster.experience = 1900
monster.outfit = {
	lookType = 882,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2800
monster.maxHealth = 2800
monster.race = "venom"
monster.corpse = 23478
monster.speed = 145
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Whirr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 98715, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 86519, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "energy bar", chance = 10496 },  -- 26191
	{ id = "energy drink", chance = 9923 },  -- 26201
	{ id = "solid rage", chance = 9804 },  -- 26173
	{ id = "strange proto matter", chance = 9804 },  -- 26169
	{ id = "glistening bone", chance = 9468 },  -- 26178
	{ id = "ultimate health potion", chance = 9429 },  -- 8473
	{ id = "great spirit potion", chance = 9251 },  -- 8472
	{ id = "great mana potion", chance = 9231 },  -- 7590
	{ id = "violet crystal shard", chance = 5396 },  -- 18414
	{ id = "cyan crystal fragment", chance = 5258 },  -- 18419
	{ id = "blue crystal splinter", chance = 5120 },  -- 18418
	{ id = "small sapphire", chance = 4863, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "small amethyst", chance = 4843, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "small ruby", chance = 4270, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "violet gem", chance = 217 },  -- 2153
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -300, range = 4, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "dread intruder wave", interval = 2000, chance = 25, minDamage = -350, maxDamage = -450, target = false },
}

monster.defenses = {
	defense = 50,
	armor = 46,
	mitigation = 1.37,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 80, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 70 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)