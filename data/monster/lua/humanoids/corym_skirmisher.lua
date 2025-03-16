-- Corym Skirmisher (Tibia Wiki: https://tibia.fandom.com/wiki/Corym_Skirmisher)
-- Version: 9.80

local mType = Game.createMonsterType("Corym Skirmisher")
local monster = {}

monster.description = "a corym skirmisher"
monster.experience = 260
monster.outfit = {
	lookType = 533,
	lookHead = 0,
	lookBody = 76,
	lookLegs = 83,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 450
monster.maxHealth = 450
monster.race = "blood"
monster.corpse = 17446
monster.speed = 100
monster.manaCost = 695

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
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Squeak! Squeak!", yell = false },
	{ text = "<sniff> <sniff> <sniff>", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 50000, maxCount = 45 },
	{ id = 3607, chance = 20000 }, -- cheese
	{ id = "bola", chance = 7692 },
	{ id = "spike shield", chance = 645 },
	{ id = "ratana", chance = 2702 },
	{ id = "life preserver", chance = 2941 },
	{ id = "cheese cutter", chance = 8333 },
	{ id = "cheesy figurine", chance = 854 },
	{ id = "earflap", chance = 9090 },
	{ id = "soft cheese", chance = 14285 },
	{ id = "rat cheese", chance = 16666 },
	{ id = "rat god doll", chance = 12 },
	{ id = "leather harness", chance = 561 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -110 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -90, range = 7, shootEffect = CONST_ANI_WHIRLWINDCLUB, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 25,
	mitigation = 0.96,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
