-- Defiler (Tibia Wiki: https://tibia.fandom.com/wiki/Defiler)
-- Version: 7.9

local mType = Game.createMonsterType("Defiler")
local monster = {}

monster.description = "a defiler"
monster.experience = 3700
monster.outfit = {
	lookType = 238,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3650
monster.maxHealth = 3650
monster.race = "venom"
monster.corpse = 6532
monster.speed = 80
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 85,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 30,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Blubb", yell = false },
	{ text = "Blubb Blubb", yell = false },
}

monster.loot = {
	{ id = "small diamond", chance = 2439, maxCount = 2 },
	{ id = "small ruby", chance = 3000, maxCount = 2 },
	{ id = "gold coin", chance = 100000, maxCount = 100 },
	{ id = "gold coin", chance = 100000, maxCount = 100 },
	{ id = "gold coin", chance = 100000, maxCount = 72 },
	{ id = "small emerald", chance = 5366, maxCount = 3 },
	{ id = "talon", chance = 5710 },
	{ id = "platinum coin", chance = 95000, maxCount = 6 },
	{ id = "yellow gem", chance = 1219 },
	{ id = "green gem", chance = 613 },
	{ id = 3039, chance = 1538 }, -- red gem
	{ id = "blue gem", chance = 300 },
	{ id = "soul orb", chance = 20000 },
	{ id = 6299, chance = 3030 }, -- death ring
	{ id = "demonic essence", chance = 20320 },
	{ id = "glob of acid slime", chance = 14210 },
	{ id = "glob of tar", chance = 12000 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240, condition = { type = CONDITION_POISON, totalDamage = 150, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -160, maxDamage = -270, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -400, maxDamage = -640, range = 7, radius = 7, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -120, maxDamage = -170, radius = 3, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -500, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, length = 8, spread = 3, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 15000 },
}

monster.defenses = {
	defense = 20,
	armor = 60,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 280, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
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
