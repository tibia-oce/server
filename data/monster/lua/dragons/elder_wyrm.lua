-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Elder_Wyrm
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Elder_Wyrm
---


local mType = Game.createMonsterType("Elder Wyrm")
local monster = {}

monster.description = "an elder wyrm"
monster.experience = 2500
monster.outfit = {
	lookType = 561,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2700
monster.maxHealth = 2700
monster.race = "blood"
monster.corpse = 18966
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 250,
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
	{ text = "GRROARR", yell = true },
	{ text = "GRRR", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 180 },  -- 2148
	{ id = "dragon ham", chance = 34508 },  -- 2672
	{ id = "platinum coin", chance = 24672, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "strong mana potion", chance = 20286 },  -- 7589
	{ id = "strong health potion", chance = 19854 },  -- 7588
	{ id = "wyrm scale", chance = 16701 },  -- 10582
	{ id = "crossbow", chance = 8165 },  -- 2455
	{ id = "soul orb", chance = 4844 },  -- 5944
	{ id = "small diamond", chance = 4696, minCount = 1, maxCount = 5 },  -- 2145
	{ id = "wand of draconia", chance = 1536 },  -- 8921
	{ id = 2547, chance = 835, minCount = 1, maxCount = 10 },  -- power bolt
	{ id = "lightning pendant", chance = 822 },  -- 7889
	{ id = "lightning legs", chance = 674 },  -- 7895
	{ id = "wand of starstorm", chance = 627 },  -- 8920
	{ id = "lightning boots", chance = 229 },  -- 7893
	{ id = "composite hornbow", chance = 216 },  -- 8855
	{ id = "dragonbone staff", chance = 202 },  -- 7430
	{ id = "shadow sceptre", chance = 195 },  -- 7451
	{ id = "lightning robe", chance = 175 },  -- 7898
	{ id = "shockwave amulet", chance = 108 },  -- 10221
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -360 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -90, maxDamage = -150, radius = 4, effect = CONST_ME_TELEPORT, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -140, maxDamage = -250, radius = 5, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -180, length = 8, spread = 3, effect = CONST_ME_BLOCKHIT, target = false },
	{ name = "elder wyrm wave", interval = 2000, chance = 10, minDamage = -200, maxDamage = -300, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 48,
	mitigation = 1.35,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 75 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
