-- Lava Golem (Tibia Wiki: https://tibia.fandom.com/wiki/Lava_Golem)
-- Version: 9.60

local mType = Game.createMonsterType("Lava Golem")
local monster = {}

monster.description = "a lava golem"
monster.experience = 7900
monster.outfit = {
	lookType = 491,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 9000
monster.maxHealth = 9000
monster.race = "fire"
monster.corpse = 15988
monster.speed = 210
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
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
	level = 10,
	color = 206,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Grrrrunt", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, maxCount = 199 },
	{ id = "platinum coin", chance = 100000, maxCount = 11 },
	{ id = "yellow gem", chance = 6480 },
	{ id = 3039, chance = 1180 }, -- red gem
	{ id = "wand of inferno", chance = 2950 },
	{ id = "fire sword", chance = 1710 },
	{ id = "fire axe", chance = 1560 },
	{ id = "crown shield", chance = 1180 },
	{ id = "iron ore", chance = 11570 },
	{ id = "white piece of cloth", chance = 4810 },
	{ id = "red piece of cloth", chance = 3530 },
	{ id = "yellow piece of cloth", chance = 7230 },
	{ id = "strong health potion", chance = 18830, maxCount = 2 },
	{ id = "strong mana potion", chance = 18150, maxCount = 2 },
	{ id = "great mana potion", chance = 16030, maxCount = 2 },
	{ id = "mana potion", chance = 20720, maxCount = 2 },
	{ id = "magma amulet", chance = 2900 },
	{ id = "magma boots", chance = 2650 },
	{ id = "magma coat", chance = 430 },
	{ id = "ultimate health potion", chance = 15390 },
	{ id = "spellbook of mind control", chance = 450 },
	{ id = "fiery heart", chance = 13510 },
	{ id = "wand of everblazing", chance = 1390 },
	{ id = "violet crystal shard", chance = 6200 },
	{ id = "green crystal splinter", chance = 13990, maxCount = 2 },
	{ id = "red crystal fragment", chance = 10990 },
	{ id = "magma clump", chance = 15370, maxCount = 2 },
	{ id = "blazing bone", chance = 15200 },
	{ id = "prismatic bolt", chance = 12580, maxCount = 5 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -700, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "lava golem soulfire", interval = 2000, chance = 15, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -220, maxDamage = -350, radius = 4, effect = CONST_ME_FIREAREA, target = true },
	{ name = "speed", interval = 2000, chance = 10, speed = -800, length = 5, spread = 3, effect = CONST_ME_BLOCKHIT, target = false, duration = 30000 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -280, maxDamage = -350, radius = 3, effect = CONST_ME_HITBYFIRE, target = false },
}

monster.defenses = {
	defense = 60,
	armor = 84,
	mitigation = 2.51,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
