-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Barbaria
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Barbaria
---


local mType = Game.createMonsterType("Barbaria")
local monster = {}

monster.description = "Barbaria"
monster.experience = 355
monster.outfit = {
	lookType = 264,
	lookHead = 78,
	lookBody = 97,
	lookLegs = 95,
	lookFeet = 121,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 440,
	bossRace = RARITY_NEMESIS,
}

monster.health = 345
monster.maxHealth = 345
monster.race = "blood"
monster.corpse = 18058
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
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
	maxSummons = 1,
	summons = {
		{ name = "War Wolf", chance = 40, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "To me, creatures of the wild!", yell = false },
	{ text = "My instincts tell me about your cowardice.", yell = false },
	{ text = "Mine is the power of rage!", yell = false },
	{ text = "I'll be triumphant!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 92857, minCount = 3, maxCount = 44 },  -- 2148
	{ id = "ham", chance = 21429 },  -- 2671
	{ id = "hunting spear", chance = 21429 },  -- 3965
	{ id = "chain armor", chance = 14286 },  -- 2464
	{ id = "fur bag", chance = 14286 },  -- 7343
	{ id = 2401, chance = 14286 },  -- staff
	{ id = "mammoth fur shorts", chance = 7143 },  -- 7464
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 60, attack = 20 },
	{ name = "combat", interval = 2000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -30, maxDamage = -80, range = 7, radius = 1, shootEffect = CONST_ANI_SNOWBALL, target = true },
	{ name = "combat", interval = 3000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -35, maxDamage = -70, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 10,
	mitigation = 0.70,
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)