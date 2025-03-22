-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Warlord_Ruzad
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Warlord_Ruzad
---


local mType = Game.createMonsterType("Warlord Ruzad")
local monster = {}

monster.description = "Warlord Ruzad"
monster.experience = 1700
monster.outfit = {
	lookType = 2,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 6008
monster.speed = 135
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Orc Berserker", chance = 30, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Gadarat Ulderek!", yell = false },
	{ text = "Ruzad buta bana!", yell = false },
	{ text = "Rahi Gosh!", yell = false },
	{ text = "Ikem rambo zambo!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 36842, minCount = 4, maxCount = 63 },  -- 2148
	{ id = "brass legs", chance = 31579 },  -- 2478
	{ id = "throwing star", chance = 21053, minCount = 8, maxCount = 17 },  -- 2399
	{ id = "orcish axe", chance = 15789 },  -- 2428
	{ id = 2419, chance = 15789 },  -- scimitar
	{ id = "dark helmet", chance = 10526 },  -- 2490
	{ id = "hunting spear", chance = 10526 },  -- 3965
	{ id = "meat", chance = 10526 },  -- 2666
	{ id = "plate armor", chance = 10526 },  -- 2463
	{ id = "plate legs", chance = 10526 },  -- 2647
	{ id = "protection amulet", chance = 10526 },  -- 2200
	{ id = "two handed sword", chance = 10526 },  -- 2377
	{ id = "butcher's axe", chance = 5263 },  -- 7412
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
}

monster.defenses = {
	defense = 35,
	armor = 32,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 1 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)