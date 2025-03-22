-- Version: 6.0
-- Monster: https://tibia.fandom.com/wiki/Witch
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Witch
---


local mType = Game.createMonsterType("Witch")
local monster = {}

monster.description = "a witch"
monster.experience = 120
monster.outfit = {
	lookType = 54,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 300
monster.maxHealth = 300
monster.race = "blood"
monster.corpse = 20535
monster.speed = 102
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 30,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Herba budinia ex!", yell = false },
	{ text = "Horax Pokti!", yell = false },
	{ text = "Hihihihi!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 63943, minCount = 1, maxCount = 40 },  -- 2148
	{ id = "cookie", chance = 29995, minCount = 1, maxCount = 8 },  -- 2687
	{ id = "wolf tooth chain", chance = 10088 },  -- 2129
	{ id = "witch broom", chance = 10006 },  -- 10569
	{ id = "star herb", chance = 8962 },  -- 2800
	{ id = "leather boots", chance = 5032 },  -- 2643
	{ id = "cape", chance = 4980 },  -- 2654
	{ id = "sickle", chance = 3892 },  -- 2405
	{ id = "garlic necklace", chance = 2538 },  -- 2199
	{ id = "coat", chance = 1997 },  -- 2651
	{ id = "necrotic rod", chance = 1085 },  -- 2185
	{ id = "bag of apple slices", chance = 906 },  -- 13537
	{ id = "silver dagger", chance = 544 },  -- 2402
	{ id = "witch hat", chance = 96 },  -- 10570
	{ id = "stuffed toad", chance = 6 },  -- 11211
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -75, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "outfit", interval = 2000, chance = 1, range = 5, target = true, duration = 2000, outfitMonster = "green frog" },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.30,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)