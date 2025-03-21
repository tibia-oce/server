-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/The_Pale_Count
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Pale_Count
---


local mType = Game.createMonsterType("The Pale Count")
local monster = {}

monster.description = "The Pale Count"
monster.experience = 28000
monster.outfit = {
	lookType = 557,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 18953
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
	maxSummons = 4,
	summons = {
		{ name = "Nightfiend", chance = 10, interval = 2000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Feel the hungry kiss of death!", yell = false },
	{ text = "The monsters in the mirror will come eat your dreams.", yell = false },
	{ text = "Your pitiful life has come to an end!", yell = false },
	{ text = "I will squish you like a maggot and suck you dry!", yell = false },
	{ text = "Yield to the inevitable!", yell = false },
	{ text = "Some day I shall see my beautiful face in a mirror again.", yell = false },
}

monster.loot = {
    { id = "gold coin", chance = 100000, minCount = 100, maxCount = 200 },  -- 2148
    { id = "vampire's cape chain", chance = 100000 },  -- 21244
    { id = "vampire lord token", chance = 95455 },  -- 9020
    { id = "strong health potion", chance = 72727, maxCount = 3 },  -- 7588
    { id = "strong mana potion", chance = 68182, maxCount = 3 },  -- 7589
    { id = "vampire teeth", chance = 54545 },  -- 10602
    { id = "platinum coin", chance = 45455, maxCount = 5 },  -- 2152
    { id = "blood preservation", chance = 40909 },  -- 12405
    { id = "white piece of cloth", chance = 40909 },  -- 5909
    { id = "stealth ring", chance = 36364 },  -- 2165
    { id = "blue piece of cloth", chance = 27273 },  -- 5912
    { id = "small topaz", chance = 22727, maxCount = 5 },  -- 9970
    { id = "epee", chance = 18182 },  -- 2438
    { id = "red piece of cloth", chance = 18182 },  -- 5911
    { id = "ring of healing", chance = 18182 },  -- 2214
    { id = "small sapphire", chance = 18182, maxCount = 5 },  -- 2146
    { id = "vampire shield", chance = 18182 },  -- 2534
    { id = "small amethyst", chance = 13636, maxCount = 5 },  -- 2150
    { id = "small ruby", chance = 13636, maxCount = 5 },  -- 2147
    { id = "black pearl", chance = 9091, maxCount = 5 },  -- 2144
    { id = "small diamond", chance = 9091, maxCount = 5 },  -- 2145
    { id = "small emerald", chance = 9091, maxCount = 5 },  -- 2149
    { id = "violet gem", chance = 9091 },  -- 2153
    { id = "blue gem", chance = 4545 },  -- 2158
    { id = "chaos mace", chance = 4545 },  -- 7427
    { id = "Vampire Count's medal", chance = 4545 },  -- 21253
    { id = "vampire's signet ring", chance = 4545 },  -- 21252
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 80, attack = 120 },
	{ name = "speed", interval = 1000, chance = 17, speed = -600, range = 7, radius = 4, effect = CONST_ME_MAGIC_RED, target = true, duration = 1500 },
	{ name = "combat", interval = 2000, chance = 21, type = COMBAT_ICEDAMAGE, minDamage = -130, maxDamage = -350, range = 6, radius = 2, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_GIANTICE, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -60, maxDamage = -120, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_CARNIPHILA, target = false },
}

monster.defenses = {
	defense = 75,
	armor = 75,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)