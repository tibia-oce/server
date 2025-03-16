-- The Bloodtusk (Tibia Wiki: https://tibia.fandom.com/wiki/The_Bloodtusk)
-- Version: 8.50

local mType = Game.createMonsterType("The Bloodtusk")
local monster = {}

monster.description = "the Bloodtusk"
monster.experience = 300
monster.outfit = {
	lookType = 199,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 600
monster.maxHealth = 600
monster.race = "blood"
monster.corpse = 6074
monster.speed = 95
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
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
}

monster.loot = {
	{ id = 3031, chance = 100000, maxCount = 99 }, -- gold coin
	{ id = 10321, chance = 100000, maxCount = 2 }, -- mammoth tusk
	{ id = 3035, chance = 100000, maxCount = 5 }, -- platinum coin
	{ id = 7432, chance = 63000 }, -- furry club
	{ id = 5911, chance = 60000 }, -- red piece of cloth
	{ id = 3443, chance = 55000 }, -- tusk shield
	{ id = 3044, chance = 41000, maxCount = 4 }, -- tusk
	{ id = 7463, chance = 18000 }, -- mammoth fur cape
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -120 },
}

monster.defenses = {
	defense = 57,
	armor = 40,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
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
