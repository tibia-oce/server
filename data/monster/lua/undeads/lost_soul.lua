-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Lost_Soul
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lost_Soul
---


local mType = Game.createMonsterType("Lost Soul")
local monster = {}

monster.description = "a lost soul"
monster.experience = 4000
monster.outfit = {
	lookType = 232,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5800
monster.maxHealth = 5800
monster.race = "undead"
monster.corpse = 6309
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	runHealth = 450,
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
	{ text = "Mouuuurn meeee!", yell = false },
	{ text = "Forgive Meee!", yell = false },
	{ text = "Help meee!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99994, minCount = 2, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 99994, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "blank rune", chance = 35139, minCount = 1, maxCount = 3 },  -- 2260
	{ id = "unholy bone", chance = 32957 },  -- 11233
	{ id = "great mana potion", chance = 15112, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "soul orb", chance = 15005 },  -- 5944
	{ id = "black pearl", chance = 12898, minCount = 1, maxCount = 3 },  -- 2144
	{ id = "white pearl", chance = 11857, minCount = 1, maxCount = 3 },  -- 2143
	{ id = "great health potion", chance = 9625, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "demonic essence", chance = 5994 },  -- 6500
	{ id = 7370, chance = 5186 },  -- silver goblet
	{ id = 9808, chance = 3794 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "stone skin amulet", chance = 3041 },  -- 2197
	{ id = 6300, chance = 2577 },  -- death ring
	{ id = "red gem", chance = 2025 },  -- 2156
	{ id = "skeleton decoration", chance = 1536 },  -- 6526
	{ id = "ruby necklace", chance = 1273 },  -- 2133
	{ id = "titan axe", chance = 1035 },  -- 7413
	{ id = "haunted blade", chance = 884 },  -- 7407
	{ id = "skull staff", chance = 884 },  -- 2436
	{ id = "tower shield", chance = 640 },  -- 2528
	{ id = "skull helmet", chance = 194 },  -- 5741
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -420 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -40, maxDamage = -210, length = 3, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 20, speed = -800, radius = 6, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 4000 },
}

monster.defenses = {
	defense = 30,
	armor = 28,
	mitigation = 1.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)