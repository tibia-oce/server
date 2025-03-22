-- Version: 8.10
-- Monster: https://tibia.fandom.com/wiki/Goblin_Leader
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Goblin_Leader
---


local mType = Game.createMonsterType("Goblin Leader")
local monster = {}

monster.description = "a goblin leader"
monster.experience = 75
monster.outfit = {
	lookType = 61,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 50
monster.maxHealth = 50
monster.race = "blood"
monster.corpse = 6002
monster.speed = 60
monster.manaCost = 290

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"GoblinLeaderDeath",
-- }

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
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
	{ text = "Go go, Gobo attack!!", yell = false },
	{ text = "Me the greenest and the meanest!", yell = false },
	{ text = "Me have power to crush you!", yell = false },
	{ text = "Goblinkiller! Catch him !!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 49234, minCount = 1, maxCount = 9 },  -- 2148
	{ id = "dagger", chance = 17584 },  -- 2379
	{ id = 2667 , chance = 12989 },  -- fish
	{ id = 2230, chance = 11401 },  -- bone
	{ id = "small axe", chance = 10607 },  -- 2559
	{ id = "leather helmet", chance = 10323 },  -- 2461
	{ id = "short sword", chance = 9983 },  -- 2406
	{ id = "leather armor", chance = 7601 },  -- 2467
	{ id = "mouldy cheese", chance = 7317 },  -- 2235
	{ id = "bone club", chance = 4708 },  -- 2449
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -45, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.33,
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