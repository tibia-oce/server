-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Hive_Overseer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hive_Overseer
---


local mType = Game.createMonsterType("Hive Overseer")
local monster = {}

monster.description = "a hive overseer"
monster.experience = 5500
monster.outfit = {
	lookType = 458,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 7500
monster.maxHealth = 7500
monster.race = "venom"
monster.corpse = 13937
monster.speed = 115
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
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 4,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Spidris Elite Summon", chance = 40, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Zopp!", yell = false },
	{ text = "Kropp!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 98355, minCount = 1, maxCount = 199 },  -- 2148
	{ id = "platinum coin", chance = 84491, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "kollos shell", chance = 29511 },  -- 15480
	{ id = "gold ingot", chance = 28506 },  -- 9971
	{ id = "compound eye", chance = 18365 },  -- 15486
	{ id = "great mana potion", chance = 18342 },  -- 7590
	{ id = "small ruby", chance = 15829, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "gooey mass", chance = 12449, minCount = 1, maxCount = 2 },  -- 15572
	{ id = "ultimate health potion", chance = 12106 },  -- 8473
	{ id = 7632, chance = 6350 },  -- 7632
	{ id = "hive scythe", chance = 1576 },  -- 15492
	{ id = "calopteryx cape", chance = 1530 },  -- 15489
	{ id = "carapace shield", chance = 937 },  -- 15491
	{ id = "hive bow", chance = 617 },  -- 15643
	{ id = "steel boots", chance = 457 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -450 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -60, maxDamage = -80, radius = 4, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 20, minDamage = -600, maxDamage = -1000, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 57,
	mitigation = 2.40,
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 500, maxDamage = 700, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
