-- Version: 9.20
-- Monster: https://tibia.fandom.com/wiki/Fleshcrawler
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Fleshcrawler
---


local mType = Game.createMonsterType("Fleshcrawler")
local monster = {}

monster.description = "Fleshcrawler"
monster.experience = 1000
monster.outfit = {
	lookType = 79,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1450
monster.maxHealth = 1450
monster.race = "venom"
monster.corpse = 6021
monster.speed = 115
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
	rewardBoss = true,
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

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Larva", chance = 10, interval = 2000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "scarab pincers", chance = 100000 },  -- 10548
	{ id = "platinum coin", chance = 99180, minCount = 1, maxCount = 15 },  -- 2152
	{ id = "scarab coin", chance = 99180, minCount = 1, maxCount = 2 },  -- 2159
	{ id = "small emerald", chance = 89344, minCount = 1, maxCount = 3 },  -- 2149
	{ id = "small amethyst", chance = 88115, minCount = 1, maxCount = 4 },  -- 2150
	{ id = "springsprout rod", chance = 75410 },  -- 8912
	{ id = "scarab amulet", chance = 50820 },  -- 2135
	{ id = 2142, chance = 48361 },  -- ancient amulet
	{ id = "scarab shield", chance = 45082 },  -- 2540
	{ id = "strong health potion", chance = 43852 },  -- 7588
	{ id = "knight armor", chance = 40984 },  -- 2476
	{ id = "amber staff", chance = 28689 },  -- 7426
	{ id = "ornamented brooch", chance = 12705 },  -- 12424
	{ id = "terra mantle", chance = 9836 },  -- 7884
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -330 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -150, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false, duration = 25000 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 30, minDamage = 0, maxDamage = -520, radius = 5, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	mitigation = 0.96,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)