-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Deepling_Worker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deepling_Worker
---


local mType = Game.createMonsterType("Deepling Worker")
local monster = {}

monster.description = "a deepling worker"
monster.experience = 130
monster.outfit = {
	lookType = 470,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 190
monster.maxHealth = 190
monster.race = "blood"
monster.corpse = 15497
monster.speed = 65
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
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 20,
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
	{ text = "Qjell afar gou jey!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 75597, minCount = 1, maxCount = 25 },  -- 2148
	{ id = 2667 , chance = 11981, minCount = 1, maxCount = 3 },  -- fish
	{ id = "deepling scales", chance = 6972 },  -- 15430
	{ id = "heavy trident", chance = 492 },  -- 13838
	{ id = "fish fin", chance = 335 },  -- 5895
	{ id = "eye of a deepling", chance = 291 },  -- 13870
	{ id = "small emerald", chance = 123 },  -- 2149
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80, effect = CONST_ME_DRAWBLOOD },
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.46,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)