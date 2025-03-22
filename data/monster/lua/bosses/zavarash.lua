-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Zavarash
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Zavarash
---


local mType = Game.createMonsterType("Zavarash")
local monster = {}

monster.description = "Zavarash"
monster.experience = 21000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 15,
	lookLegs = 57,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 35000
monster.maxHealth = 35000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 220
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25,
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
	staticAttackChance = 90,
	targetDistance = 4,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "dark torturer", chance = 100, interval = 1000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Harrr, Harrr!", yell = false },
}

monster.loot = {
	{ id = "cluster of solace", chance = 100000 },  -- 22396
	{ id = "demon horn", chance = 100000 },  -- 5954
	{ id = "gold coin", chance = 100000, minCount = 6, maxCount = 197 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 50 },  -- 2152
	{ id = "demonic essence", chance = 59162 },  -- 6500
	{ id = "unrealized dream", chance = 59162 },  -- 22598
	{ id = 7632, chance = 42932 },  -- giant shimmering pearl
	{ id = "violet crystal shard", chance = 38394, minCount = 1, maxCount = 8 },  -- 18414
	{ id = "great mana potion", chance = 34729, minCount = 1, maxCount = 10 },  -- 7590
	{ id = "great spirit potion", chance = 33159, minCount = 1, maxCount = 10 },  -- 8472
	{ id = "ultimate health potion", chance = 32112, minCount = 1, maxCount = 10 },  -- 8473
	{ id = "blue crystal shard", chance = 31588, minCount = 1, maxCount = 8 },  -- 18413
	{ id = "green crystal shard", chance = 30017, minCount = 1, maxCount = 8 },  -- 18415
	{ id = "green gem", chance = 20419 },  -- 2155
	{ id = "guardian halberd", chance = 16056 },  -- 2427
	{ id = "guardian shield", chance = 15881 },  -- 2515
	{ id = "blue gem", chance = 15532 },  -- 2158
	{ id = "gold ingot", chance = 15358 },  -- 9971
	{ id = "bonebreaker", chance = 15009 },  -- 7428
	{ id = "heavy mace", chance = 12914 },  -- 2452
	{ id = "crown shield", chance = 11518 },  -- 2519
	{ id = "dream warden mask", chance = 10646 },  -- 22610
	{ id = "paladin armor", chance = 9599 },  -- 8891
	{ id = "diamond sceptre", chance = 8377 },  -- 7387
	{ id = "demon shield", chance = 6283 },  -- 2520
	{ id = "onyx flail", chance = 4014 },  -- 7421
	{ id = "mastermind shield", chance = 1396 },  -- 2514
	{ id = "demonbone", chance = 698 },  -- 7431
	{ id = "skullcracker armor", chance = 524 },  -- 8889
	{ id = "lavos armor", chance = 349 },  -- 8877
	{ id = "obsidian truncheon", chance = 175 },  -- 8928
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -6000, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 55,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 400, maxDamage = 600, radius = 8, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 18, effect = CONST_ME_MAGIC_GREEN, speed = 440},
	{ name = "invisible", interval = 2000, chance = 20, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = -20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)