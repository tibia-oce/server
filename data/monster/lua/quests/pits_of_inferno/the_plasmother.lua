-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/The_Plasmother
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Plasmother
---


local mType = Game.createMonsterType("The Plasmother")
local monster = {}

monster.description = "The Plasmother"
monster.experience = 12000
monster.outfit = {
	lookType = 238,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 300,
	bossRace = RARITY_NEMESIS,
}

monster.health = 7500
monster.maxHealth = 7500
monster.race = "venom"
monster.corpse = 6532
monster.speed = 155
monster.manaCost = 0

monster.changeTarget = {
	interval = 5500,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 250,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 30,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Defiler", chance = 20, interval = 4000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Blubb", yell = false },
	{ text = "Blubb Blubb", yell = false },
	{ text = "Blubberdiblubb", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 16, maxCount = 149 },  -- 2148
	{ id = "the Plasmother's remains", chance = 100000 },  -- 6535
	{ id = "platinum coin", chance = 72727, minCount = 3, maxCount = 14 },  -- 2152
	{ id = "demonic essence", chance = 63636 },  -- 6500
	{ id = "small sapphire", chance = 36364, minCount = 2, maxCount = 3 },  -- 2146
	{ id = "small amethyst", chance = 27273, maxCount = 2 },  -- 2150
	{ id = "black pearl", chance = 18182, minCount = 1, maxCount = 3 },  -- 2144
	{ id = "soul orb", chance = 18182 },  -- 5944
	{ id = "small emerald", chance = 9091, maxCount = 3 },  -- 2149
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 30, attack = 50 },
	{ name = "speed", interval = 1000, chance = 8, speed = -800, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 10000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -350, radius = 4, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -530, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 30,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 75, type = COMBAT_HEALING, minDamage = 505, maxDamage = 605, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -15 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)