-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/The_Welter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Welter
---


local mType = Game.createMonsterType("The Welter")
local monster = {}

monster.description = "The Welter"
monster.experience = 11000
monster.outfit = {
	lookType = 563,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 25000
monster.maxHealth = 25000
monster.race = "blood"
monster.corpse = 21291
monster.speed = 128
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 300,
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
	maxSummons = 1,
	summons = {
		{ name = "spawn of the welter", chance = 16, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "FCHHHHH", yell = true },
}

monster.loot = {
	{ id = 7632, chance = 100000 },  -- giant shimmering pearl
	{ id = "gold coin", chance = 100000, minCount = 30, maxCount = 50 },  -- 2148
	{ id = "hydra egg", chance = 25000 },  -- 4850
	{ id = "platinum coin", chance = 100000, minCount = 5, maxCount = 20 },  -- 2152
	{ id = "royal helmet", chance = 25000 },  -- 2498
	{ id = "stone skin amulet", chance = 75000 },  -- 2197
	{ id = "strong mana potion", chance = 75000, maxCount = 3 },  -- 7589
	{ id = "strong health potion", chance = 25000, maxCount = 3 },  -- 7588
	{ id = "small sapphire", chance = 25000, maxCount = 5 },  -- 2146
	{ id = "silver raid token", chance = 25000 },  -- 21400
	{ id = "warrior helmet", chance = 25000 },  -- 2475
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 90, attack = 100 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 17, minDamage = -500, maxDamage = -660, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -450, length = 8, spread = 3, effect = CONST_ME_BLACKSMOKE, target = false },
	{ name = "combat", interval = 2000, chance = 18, type = COMBAT_ICEDAMAGE, minDamage = -150, maxDamage = -270, range = 7, radius = 4, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEATTACK, target = true },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_ICEDAMAGE, minDamage = -120, maxDamage = -230, range = 1, radius = 1, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEATTACK, target = true },
	{ name = "the welter paralyze", interval = 2000, chance = 9, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 27,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 32, type = COMBAT_HEALING, minDamage = 250, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_HEALING, minDamage = 150, maxDamage = 700, radius = 5, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "the welter summon2", interval = 2000, chance = 9, target = false },
	{ name = "the welter heal", interval = 2000, chance = 8, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
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