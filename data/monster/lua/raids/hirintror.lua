-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/Hirintror
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hirintror
---


local mType = Game.createMonsterType("Hirintror")
local monster = {}

monster.description = "Hirintror"
monster.experience = 800
monster.outfit = {
	lookType = 261,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1500
monster.maxHealth = 1500
monster.race = "undead"
monster.corpse = 7282
monster.speed = 95
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
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
	rewardBoss = true,
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
	{ text = "Srk.", yell = false },
	{ text = "Krss!", yell = false },
	{ text = "Chrrk! Krk!", yell = false },
	{ text = "snirr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 85714, minCount = 40, maxCount = 60 },  -- 2148
	{ id = "strong mana potion", chance = 71429, maxCount = 3 },  -- 7589
	{ id = "platinum coin", chance = 57143, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "frosty heart", chance = 42857 },  -- 10578
	{ id = "glacier mask", chance = 28571 },  -- 7902
	{ id = "glacier shoes", chance = 28571 },  -- 7892
	{ id = "small sapphire", chance = 28571 },  -- 2146
	{ id = "strange helmet", chance = 28571 },  -- 2479
	{ id = "black pearl", chance = 14286 },  -- 2144
	{ id = "blue piece of cloth", chance = 28571 },  -- 5912
	{ id = "crystal sword", chance = 28571 },  -- 7449
	{ id = 7441, chance = 14286 },  -- ice cube
	{ id = "ice rapier", chance = 14286 },  -- 2396
	{ id = "shard", chance = 14286 },  -- 7290
	{ id = "small diamond", chance = 28571, maxCount = 5 },  -- 2145
	{ id = "strong health potion", chance = 28571, maxCount = 3 },  -- 7588
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 140, attack = 40 },
	{ name = "hirintror freeze", interval = 2000, chance = 15, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -75, maxDamage = -150, range = 7, radius = 3, shootEffect = CONST_ANI_ICE, effect = CONST_ME_BLOCKHIT, target = true },
	{ name = "ice golem paralyze", interval = 2000, chance = 11, target = false },
	{ name = "hirintror skill reducer", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 26,
	armor = 25,
	mitigation = 1.18,
	{ name = "hirintror summon", interval = 2000, chance = 18, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)