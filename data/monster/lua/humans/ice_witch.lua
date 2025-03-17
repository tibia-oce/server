-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Ice_Witch
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ice_Witch
---


local mType = Game.createMonsterType("Ice Witch")
local monster = {}

monster.description = "an ice witch"
monster.experience = 580
monster.outfit = {
	lookType = 149,
	lookHead = 0,
	lookBody = 9,
	lookLegs = 86,
	lookFeet = 86,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 650
monster.maxHealth = 650
monster.race = "blood"
monster.corpse = 18142
monster.speed = 114
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 4,
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
	{ text = "So you think you are cool?", yell = false },
	{ text = "I hope it is not too cold for you! HeHeHe.", yell = false },
	{ text = "Freeze!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 29959, minCount = 1, maxCount = 90 },  -- 2148
	{ id = 7441, chance = 9965 },  -- ice cube
	{ id = "green mushroom", chance = 1285 },  -- 2796
	{ id = "clerical mace", chance = 1036 },  -- 2423
	{ id = "strong mana potion", chance = 879 },  -- 7589
	{ id = "shard", chance = 626 },  -- 7290
	{ id = "mystic turban", chance = 444 },  -- 2663
	{ id = "crystal sword", chance = 376 },  -- 7449
	{ id = "glacier shoes", chance = 317 },  -- 7892
	{ id = "diamond sceptre", chance = 304 },  -- 7387
	{ id = "pair of earmuffs", chance = 85 },  -- 7459
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -60 },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitItem = 7172 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -60, maxDamage = -130, length = 5, spread = 2, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -55, maxDamage = -115, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true },
	{ name = "speed", interval = 2000, chance = 15, speed = -600, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICETORNADO, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 20,
	armor = 70,
	mitigation = 0.91,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 90, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)