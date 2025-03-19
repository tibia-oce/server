-- Version: 7.8
-- Monster: https://tibia.fandom.com/wiki/Enlightened_of_the_Cult
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Enlightened_of_the_Cult
---


local mType = Game.createMonsterType("Enlightened of the Cult")
local monster = {}

monster.description = "an enlightened of the cult"
monster.experience = 500
monster.outfit = {
	lookType = 193,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 700
monster.maxHealth = 700
monster.race = "blood"
monster.corpse = 18110
monster.speed = 100
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
	canPushCreatures = true,
	staticAttackChance = 50,
	targetDistance = 4,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Crypt Shambler", chance = 10, interval = 2000, count = 1 },
		{ name = "Ghost", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Praise to my master Urgith!", yell = false },
	{ text = "You will rise as my servant!", yell = false },
	{ text = "Praise to my masters! Long live the triangle!", yell = false },
	{ text = "You will die in the name of the triangle!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 65014, minCount = 1, maxCount = 92 },  -- 2148
	{ id = "cultish mask", chance = 10373 },  -- 10555
	{ id = "cultish symbol", chance = 1018 },  -- 12411
	{ id = "strong mana potion", chance = 880 },  -- 7589
	{ id = "protection amulet", chance = 853 },  -- 2200
	{ id = 1950, chance = 783 },  -- book (orange)
	{ id = 6090, chance = 567 },  -- music sheet (fourth verse)
	{ id = "small sapphire", chance = 525 },  -- 2146
	{ id = "pirate voodoo doll", chance = 456 },  -- 5810
	{ id = "energy ring", chance = 429 },  -- 2167
	{ id = "skull staff", chance = 359 },  -- 2436
	{ id = "platinum amulet", chance = 198 },  -- 2171
	{ id = "wand of inferno", chance = 147 },  -- 2187
	{ id = "broken key ring", chance = 134 },  -- 12608
	{ id = "jewelled backpack", chance = 129 },  -- 5801
	{ id = "piggy bank", chance = 111 },  -- 2114
	{ id = "amber staff", chance = 101 },  -- 7426
	{ id = "blue robe", chance = 83 },  -- 2656
	{ id = "mysterious voodoo skull", chance = 83 },  -- 5669
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, condition = { type = CONDITION_POISON, totalDamage = 4, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -70, maxDamage = -185, range = 1, radius = 1, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true, duration = 5000 },
	{ name = "speed", interval = 2000, chance = 10, speed = -360, range = 7, effect = CONST_ME_MAGIC_RED, target = true, duration = 6000 },
}

monster.defenses = {
	defense = 25,
	armor = 40,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 60, maxDamage = 90, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_YELLOW_RINGS },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)