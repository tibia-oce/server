-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Starving_Wolf
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Starving_Wolf
---


local mType = Game.createMonsterType("Starving Wolf")
local monster = {}

monster.description = "a starving wolf"
monster.experience = 65
monster.outfit = {
	lookType = 27,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 85
monster.maxHealth = 85
monster.race = "blood"
monster.corpse = 5968
monster.speed = 94
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 8,
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
	{ text = "Gaarrrrrr", yell = false },
	{ text = "Gnoorrr", yell = false },
	{ text = "Yoooohhuuuu!", yell = false },
}

monster.loot = {
	{ id = "dirty fur", chance = 64730 },
	{ id = "meat", chance = 5300, maxCount = 2 },
	{ id = "wolf paw", chance = 1430 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25 },
}

monster.defenses = {
	defense = 10,
	armor = 2,
	mitigation = 0.33,
	{ name = "effect", interval = 2000, chance = 10, radius = 1, effect = CONST_ME_YELLOW_RINGS, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
