-- Version: 5.1
-- Monster: https://tibia.fandom.com/wiki/Orc_Warrior
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Orc_Warrior
---


local mType = Game.createMonsterType("Orc Warrior")
local monster = {}

monster.description = "an orc warrior"
monster.experience = 50
monster.outfit = {
	lookType = 7,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 125
monster.maxHealth = 125
monster.race = "blood"
monster.corpse = 5979
monster.speed = 95
monster.manaCost = 360

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 11,
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
	{ text = "Alk!", yell = false },
	{ text = "Trak grrrr brik.", yell = false },
	{ text = "Grow truk grrrr.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 65157, minCount = 1, maxCount = 15 },  -- 2148
	{ id = "meat", chance = 14934 },  -- 2666
	{ id = "broken helmet", chance = 10030 },  -- 12409
	{ id = "chain armor", chance = 7402 },  -- 2464
	{ id = "orc leather", chance = 3979 },  -- 12435
	{ id = "skull belt", chance = 982 },  -- 12436
	{ id = "orc tooth", chance = 788 },  -- 11113
	{ id = "copper shield", chance = 492 },  -- 2530
	{ id = "poison dagger", chance = 115 },  -- 2411
	-- { id = "heavy old tome", chance = 3 },  -- todo: heavy old tome does not exist in items.xml
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60 },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.36,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
