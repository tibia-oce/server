-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/Zushuka
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zushuka
---


local mType = Game.createMonsterType("Zushuka")
local monster = {}

monster.description = "zushuka" -- (immortal) // (mortal): lookType = 149, lookHead = 86, lookBody = 10, lookLegs = 11, lookFeet = 4, lookAddons = 0, lookMount = 0
monster.experience = 9000
monster.outfit = {
	lookType = 149,
	lookHead = 0,
	lookBody = 10,
	lookLegs = 0,
	lookFeet = 4,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 20546
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	canPushCreatures = true,
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Cool down, will you?", yell = false },
	{ text = "And stay cool.", yell = false },
	{ text = "Your cold dead body will be a marvelous ice statue.", yell = false },
	{ text = "Pay for your ignorance!", yell = false },
	{ text = "Is this all you've got?", yell = false },
	{ text = "Freeze!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 93333, minCount = 100, maxCount = 200 },  -- 2148
	{ id = "silver raid token", chance = 86667 },  -- 21400
	{ id = "shard", chance = 60000 },  -- 7290
	{ id = "crystal sword", chance = 46667 },  -- 7449
	{ id = "glacier shoes", chance = 40000 },  -- 7892
	{ id = "great spirit potion", chance = 40000, maxCount = 5 },  -- 8472
	{ id = "ice rapier", chance = 40000 },  -- 2396
	{ id = "life ring", chance = 40000 },  -- 2168
	{ id = "platinum coin", chance = 40000 },  -- 2152
	{ id = "berserk potion", chance = 33333 },  -- 7439
	{ id = "blue gem", chance = 33333 },  -- 2158
	{ id = "bullseye potion", chance = 33333 },  -- 7443
	{ id = "mastermind potion", chance = 33333 },  -- 7440
	{ id = "white piece of cloth", chance = 33333, minCount = 1, maxCount = 2 },  -- 5909
	{ id = "great mana potion", chance = 26667, maxCount = 5 },  -- 7590
	{ id = "mystic turban", chance = 26667 },  -- 2663
	{ id = "glacier amulet", chance = 20000 },  -- 7888
	{ id = "skull staff", chance = 20000 },  -- 2436
	{ id = "blue piece of cloth", chance = 13333 },  -- 5912
	{ id = "crystal mace", chance = 13333 },  -- 2445
	{ id = "dragon necklace", chance = 13333 },  -- 2201
	{ id = "glacier kilt", chance = 13333 },  -- 7896
	{ id = "glacier robe", chance = 13333 },  -- 7897
	{ id = "gold ingot", chance = 13333 },  -- 9971
	{ id = "great health potion", chance = 13333, maxCount = 5 },  -- 7591
	{ id = "pair of earmuffs", chance = 13333 },  -- 7459
	{ id = "boots of haste", chance = 6667 },  -- 2195
	{ id = "glacier mask", chance = 6667 },  -- 7902
	{ id = "red piece of cloth", chance = 6667 },  -- 5911
	{ id = "trapped lightning", chance = 6667 },  -- 21699
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -560 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -100, length = 8, spread = 0, effect = CONST_ME_ICEATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -110, range = 7, shootEffect = CONST_ANI_SNOWBALL, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -300, maxDamage = -750, length = 8, spread = 0, effect = CONST_ME_ICEAREA, target = false },
	{ name = "outfit", interval = 2000, chance = 10, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitItem = 7172 },
	{ name = "speed", interval = 2000, chance = 15, speed = -330, range = 7, effect = CONST_ME_ICETORNADO, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 20,
	armor = 20,
	--	mitigation = ???,
	{ name = "combat", interval = 10000, chance = 1, type = COMBAT_HEALING, minDamage = 7500, maxDamage = 7515, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
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