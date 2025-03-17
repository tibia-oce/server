-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Glooth_Blob
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Blob
---


local mType = Game.createMonsterType("Glooth Blob")
local monster = {}

monster.description = "a glooth blob"
monster.experience = 700
monster.outfit = {
	lookType = 614,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 750
monster.maxHealth = 750
monster.race = "venom"
monster.corpse = 21108
monster.speed = 80
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0,
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
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Glooth Blob", chance = 6, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 70 },  -- 2148
	{ id = "glob of glooth", chance = 14788 },  -- 23553
	{ id = "small sapphire", chance = 3129, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "small topaz", chance = 2853, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "glooth club", chance = 589 },  -- 23549
	{ id = "glooth axe", chance = 551 },  -- 23551
	{ id = "glooth blade", chance = 529 },  -- 23550
	{ id = "glooth amulet", chance = 507 },  -- 23554
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 45, attack = 40, condition = { type = CONDITION_POISON, totalDamage = 280, interval = 4000 } },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 13, minDamage = -400, maxDamage = -480, radius = 4, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_EARTHDAMAGE, minDamage = -85, maxDamage = -180, radius = 3, shootEffect = CONST_ANI_ENVENOMEDARROW, effect = CONST_ME_GREEN_RINGS, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -105, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 30,
	mitigation = 1.04,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)