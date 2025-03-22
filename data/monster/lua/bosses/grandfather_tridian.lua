-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Grandfather_Tridian
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Grandfather_Tridian
---


local mType = Game.createMonsterType("Grandfather Tridian")
local monster = {}

monster.description = "Grandfather Tridian"
monster.experience = 1400
monster.outfit = {
	lookType = 193,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1800
monster.maxHealth = 1800
monster.race = "blood"
monster.corpse = 20391
monster.speed = 105
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
	staticAttackChance = 50,
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
		{ name = "Crypt Shambler", chance = 10, interval = 2000, count = 1 },
		{ name = "Ghost", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I will bring peace to your misguided soul!", yell = false },
	{ text = "Your intrusion can't be tolerated!", yell = false },
	{ text = "You should have joined us when there was time!", yell = false },
	{ text = "Rejoice! You will die in the name of the triangle!", yell = false },
}

monster.loot = {
	{ id = 6087, chance = 100000, maxCount = 2 },  -- music sheet
	{ id = "piggy bank", chance = 100000 },  -- 2114
	{ id = "gold coin", chance = 58333, minCount = 4, maxCount = 76 },  -- 2148
	{ id = "skull staff", chance = 25000 },  -- 2436
	{ id = "protection amulet", chance = 16667 },  -- 2200
	{ id = "small sapphire", chance = 16667 },  -- 2146
	{ id = "wand of inferno", chance = 16667 },  -- 2187
	{ id = "jewelled backpack", chance = 8333 },  -- 5801
	{ id = "pirate voodoo doll", chance = 8333 },  -- 5810
	{ id = "strong mana potion", chance = 8333 },  -- 7589
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -138, maxDamage = -362, range = 1, radius = 1, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -50, range = 1, radius = 1, effect = CONST_ME_MAGIC_RED, target = true },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 60, maxDamage = 90, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_YELLOW_RINGS },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 35 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
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
