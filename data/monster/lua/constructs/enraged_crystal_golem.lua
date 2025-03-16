-- Enraged Crystal Golem (Tibia Wiki: https://tibia.fandom.com/wiki/Enraged_Crystal_Golem)
-- Version: 9.60

local mType = Game.createMonsterType("Enraged Crystal Golem")
local monster = {}

monster.description = "an enraged crystal golem"
monster.experience = 550
monster.outfit = {
	lookType = 508,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 700
monster.maxHealth = 700
monster.race = "venom"
monster.corpse = 16176
monster.speed = 120
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
	staticAttackChance = 70,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Crrrrk! Chhhhr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, maxCount = 100 },
	{ id = "crystal sword", chance = 4710 },
	{ id = "glorious axe", chance = 360 },
	{ id = "strong health potion", chance = 7140 },
	{ id = "strong mana potion", chance = 8270 },
	{ id = "blue crystal splinter", chance = 4120 },
	{ id = "cyan crystal fragment", chance = 1050 },
	{ id = "crystalline spikes", chance = 7980 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
}

monster.defenses = {
	defense = 15,
	armor = 15,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
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
