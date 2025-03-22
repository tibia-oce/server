-- Version: 5.0
-- Monster: https://tibia.fandom.com/wiki/Demon_Skeleton
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Demon_Skeleton
---


local mType = Game.createMonsterType("Demon Skeleton")
local monster = {}

monster.description = "a demon skeleton"
monster.experience = 240
monster.outfit = {
	lookType = 37,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"UpperSpikeDeath",
-- }


monster.health = 400
monster.maxHealth = 400
monster.race = "undead"
monster.corpse = 5963
monster.speed = 90
monster.manaCost = 620

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
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
	{ id = "gold coin", chance = 97503, minCount = 1, maxCount = 75 },  -- 2148
	{ id = "demonic skeletal hand", chance = 12003 },  -- 10564
	{ id = "throwing star", chance = 10008, minCount = 1, maxCount = 3 },  -- 2399
	{ id = "health potion", chance = 9733, minCount = 1, maxCount = 2 },  -- 7618
	{ id = "mana potion", chance = 5042 },  -- 7620
	{ id = "battle shield", chance = 4949 },  -- 2513
	{ id = 2050, chance = 4856 },  -- torch
	{ id = "battle hammer", chance = 4050 },  -- 2417
	{ id = "iron helmet", chance = 3384 },  -- 2459
	{ id = "black pearl", chance = 2999 },  -- 2144
	{ id = "small ruby", chance = 1519 },  -- 2147
	{ id = "mysterious fetish", chance = 531 },  -- 2194
	{ id = "mind stone", chance = 464 },  -- 2178
	{ id = "guardian shield", chance = 112 },  -- 2515
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -185 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -30, maxDamage = -50, range = 1, radius = 1, effect = CONST_ME_SMALLCLOUDS, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 25,
	mitigation = 0.91,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
