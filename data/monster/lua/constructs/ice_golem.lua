-- Ice Golem (Tibia Wiki: https://tibia.fandom.com/wiki/Ice_Golem)
-- Version: 8.00

local mType = Game.createMonsterType("Ice Golem")
local monster = {}

monster.description = "an ice golem"
monster.experience = 295
monster.outfit = {
	lookType = 261,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 385
monster.maxHealth = 385
monster.race = "undead"
monster.corpse = 7282
monster.speed = 95
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
}

monster.strategiesTarget = {
	nearest = 100,
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
	canPushCreatures = false,
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Chrrr.", yell = false },
	{ text = "Crrrrk.", yell = false },
	{ text = "Gnarr.", yell = false },
}

monster.loot = {
	{ id = "black pearl", chance = 1500 },
	{ id = "small diamond", chance = 750 },
	{ id = "small sapphire", chance = 578 },
	{ id = "gold coin", chance = 100000, maxCount = 111 },
	{ id = "ice rapier", chance = 350 },
	{ id = "strange helmet", chance = 350 },
	{ id = "shard", chance = 200 },
	{ id = 7441, chance = 5000 }, -- ice cube
	{ id = "crystal sword", chance = 600 },
	{ id = "strong health potion", chance = 2500 },
	{ id = "strong mana potion", chance = 3000 },
	{ id = "glacier mask", chance = 200 },
	{ id = "frosty heart", chance = 14500 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -220 },
	{ name = "speed", interval = 1000, chance = 13, speed = -800, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT, target = false, duration = 20000 },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -50, maxDamage = -85, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "ice golem skill reducer", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 26,
	armor = 47,
	mitigation = 0.70,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
