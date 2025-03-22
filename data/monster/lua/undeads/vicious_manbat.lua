-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Vicious_Manbat
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Vicious_Manbat
---


local mType = Game.createMonsterType("Vicious Manbat")
local monster = {}

monster.description = "a vicious manbat"
monster.experience = 1200
monster.outfit = {
	lookType = 554,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1700
monster.maxHealth = 1700
monster.race = "blood"
monster.corpse = 21266
monster.speed = 105
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 163 },  -- 2148
	{ id = "tooth file", chance = 10305 },  -- 21241
	{ id = "strong mana potion", chance = 9924 },  -- 7589
	{ id = "small ruby", chance = 9160, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "strong health potion", chance = 8779 },  -- 7588
	{ id = "vampire teeth", chance = 7634 },  -- 10602
	{ id = "blood preservation", chance = 5344 },  -- 12405
	{ id = "bat wing", chance = 4198 },  -- 5894
	{ id = "emerald bangle", chance = 1145 },  -- 2127
	{ id = "red gem", chance = 763 },  -- 2156
	{ id = "vampire shield", chance = 763 },  -- 2534
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -215 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -250, radius = 3, effect = CONST_ME_HITAREA, target = false },
	{ name = "speed", speed = -300, interval = 2000, chance = 15, radius = 1, effect = CONST_ME_BATS, target = true },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 20, minDamage = -400, maxDamage = -600, radius = 2, effect = CONST_ME_DRAWBLOOD, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 44,
	mitigation = 1.21,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
