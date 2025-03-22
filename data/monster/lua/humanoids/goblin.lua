-- Version: 6.1
-- Monster: https://tibia.fandom.com/wiki/Goblin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Goblin
---


local mType = Game.createMonsterType("Goblin")
local monster = {}

monster.description = "a goblin"
monster.experience = 25
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
	interval = 5000,
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
	runHealth = 15,
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
	{ text = "Zig Zag! Gobo attack!", yell = false },
	{ text = "Me green, me mean!", yell = false },
	{ text = "Bugga! Bugga!", yell = false },
	{ text = "Help! Goblinkiller!", yell = false },
	{ text = "Me have him!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 50210, minCount = 1, maxCount = 9 },  -- 2148
	{ id = "small stone", chance = 15252 },  -- 1294
	{ id = 2667 , chance = 12987 },  -- fish
	{ id = "small axe", chance = 9852 },  -- 2559
	{ id = "short sword", chance = 8785 },  -- 2406
	{ id = "bone club", chance = 4954 },  -- 2449
	{ id = "leather armor", chance = 2540 },  -- 2467
	{ id = "leather helmet", chance = 1954 },  -- 2461
	{ id = "dagger", chance = 1795 },  -- 2379
	{ id = 2230, chance = 1076 },  -- bone
	{ id = "mouldy cheese", chance = 994 },  -- 2235
	{ id = "goblin ear", chance = 949 },  -- 12495
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -10 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -25, range = 7, shootEffect = CONST_ANI_SMALLSTONE, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)