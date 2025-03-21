-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Emerald_Damselfly
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Emerald_Damselfly
---


local mType = Game.createMonsterType("Emerald Damselfly")
local monster = {}

monster.description = "an emerald damselfly"
monster.experience = 35
monster.outfit = {
	lookType = 528,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 90
monster.maxHealth = 90
monster.race = "venom"
monster.corpse = 17426
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	{ text = "Bzzzzz!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 90854, minCount = 1, maxCount = 18 },  -- 2148
	{ id = "damselfly wing", chance = 11817 },  -- 19738
	{ id = "damselfly eye", chance = 10016 },  -- 19743
	{ id = 2544, chance = 7553, minCount = 1, maxCount = 5 },  -- arrow
	{ id = 2120, chance = 5036 },  -- rope
	{ id = "health potion", chance = 3601 },  -- 7618
	{ id = "mana potion", chance = 3565 },  -- 7620
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -4, condition = { type = CONDITION_POISON, totalDamage = 10, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -12, range = 7, shootEffect = CONST_ANI_POISON, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.20,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 4, maxDamage = 10, effect = CONST_ME_MAGIC_BLUE, target = false },
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
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)