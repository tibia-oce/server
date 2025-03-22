-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Robby_the_Reckless
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Robby_the_Reckless
---


local mType = Game.createMonsterType("Robby the Reckless")
local monster = {}

monster.description = "Robby the Reckless"
monster.experience = 110
monster.outfit = {
	lookType = 129,
	lookHead = 96,
	lookBody = 132,
	lookLegs = 118,
	lookFeet = 114,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 155
monster.maxHealth = 155
monster.race = "blood"
monster.corpse = 20498
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 5,
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
	canPushCreatures = false,
	staticAttackChance = 90,
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
	{ text = "Banks are meant to be robbed. It's my job!", yell = false },
	{ text = "That bank chick was trembling in fear. I love it!", yell = false },
	{ text = "You won't get this gold!", yell = false },
	{ text = "This is MY gold now!", yell = false },
}

monster.loot = {
	{ id = "bag with stolen gold", chance = 100000 },  -- 14903
	{ id = "platinum coin", chance = 100000, minCount = 3, maxCount = 100 },  -- 2152
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80 },
}

monster.defenses = {
	defense = 25,
	armor = 25,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
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