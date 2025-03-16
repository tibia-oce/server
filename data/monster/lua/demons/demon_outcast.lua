-- Demon Outcast (Tibia Wiki: https://tibia.fandom.com/wiki/Demon_Outcast)
-- Version: 10.30

local mType = Game.createMonsterType("Demon Outcast")
local monster = {}

monster.description = "a demon outcast"
monster.experience = 6200
monster.outfit = {
	lookType = 590,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 6900
monster.maxHealth = 6900
monster.race = "blood"
monster.corpse = 20215
monster.speed = 148
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "energy elemental", chance = 10, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Back in the evil business!", yell = false },
	{ text = "This prison break will have casualties!", yell = false },
	{ text = "At last someone to hurt", yell = false },
	{ text = "No one will imprison me again!", yell = false },
}

monster.loot = {
	{ id = "small diamond", chance = 10000, maxCount = 5 },
	{ id = "small sapphire", chance = 10000, maxCount = 5 },
	{ id = "small ruby", chance = 12000, maxCount = 5 },
	{ id = "gold coin", chance = 100000, maxCount = 100 },
	{ id = "small emerald", chance = 10000, maxCount = 5 },
	{ id = "platinum coin", chance = 100000, maxCount = 6 },
	{ id = "might ring", chance = 910 },
	{ id = 3049, chance = 1300 }, -- stealth ring
	{ id = "platinum amulet", chance = 1000 },
	{ id = 3098, chance = 3000 }, -- ring of healing
	{ id = "giant sword", chance = 2000 },
	{ id = "ice rapier", chance = 660 },
	{ id = "devil helmet", chance = 910 },
	{ id = "crusader helmet", chance = 740 },
	{ id = "crown shield", chance = 740 },
	{ id = "demon shield", chance = 170 },
	{ id = "fire mushroom", chance = 20600, maxCount = 6 },
	{ id = 5906, chance = 1000 }, -- demon dust
	{ id = "assassin star", chance = 8340, maxCount = 10 },
	{ id = "demonrage sword", chance = 350 },
	{ id = "great mana potion", chance = 18000, maxCount = 2 },
	{ id = "ultimate health potion", chance = 20500, maxCount = 3 },
	{ id = "small topaz", chance = 9300, maxCount = 5 },
	{ id = "cluster of solace", chance = 4550 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -250, maxDamage = -450, length = 6, spread = 0, effect = CONST_ME_PURPLEENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -550, length = 8, spread = 0, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -250, radius = 3, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "demon outcast skill reducer", interval = 2000, chance = 10, range = 5, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -80, maxDamage = -150, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 49,
	mitigation = 1.60,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 250, maxDamage = 425, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -8 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -6 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
