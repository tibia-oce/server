-- Deepling Brawler (Tibia Wiki: https://tibia.fandom.com/wiki/Deepling_Brawler)
-- Version: 9.50

local mType = Game.createMonsterType("Deepling Brawler")
local monster = {}

monster.description = "a deepling brawler"
monster.experience = 260
monster.outfit = {
	lookType = 470,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 380
monster.maxHealth = 380
monster.race = "blood"
monster.corpse = 12685
monster.speed = 85
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 40,
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
	{ text = "?", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 96000, maxCount = 44 },
	{ id = 3578, chance = 19730, maxCount = 3 }, -- fish
	{ id = "deepling scales", chance = 14500 },
	{ id = "eye of a deepling", chance = 6500 },
	{ id = "heavy trident", chance = 2720 },
	{ id = "fish fin", chance = 680 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -100, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = -60, maxDamage = -120, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true },
}

monster.defenses = {
	defense = 18,
	armor = 18,
	mitigation = 0.72,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
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
