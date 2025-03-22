-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Terofar
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Terofar
---


local mType = Game.createMonsterType("Terofar")
local monster = {}

monster.description = "Terofar"
monster.experience = 24000
monster.outfit = {
	lookType = 12,
	lookHead = 19,
	lookBody = 0,
	lookLegs = 77,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 40000
monster.maxHealth = 40000
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
	{ text = "Terofar cast a greater death curse on you!", yell = false },
	{ text = "IT TOOK AN ARMY OF YOUR KIND TO DEFEAT THE WARDEN. NOW YOU ARE ALONE!", yell = true },
	{ text = "THE WARDS ARE FAILING! MY ESCAPE IS ONLY A MATTER OF TIME!!", yell = true },
	{ text = "FEELS GOOD TO BE BACK IN ACTION!", yell = true },
}

monster.loot = {
	{ id = "cluster of solace", chance = 100000 },  -- 22396
	{ id = "demon horn", chance = 100000 },  -- 5954
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "dream matter", chance = 100000 },  -- 22397
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 60 },  -- 2152
	{ id = "unrealized dream", chance = 100000 },  -- 22598
	{ id = 7632, chance = 41811 },  -- giant shimmering pearl
	{ id = "violet crystal shard", chance = 37958, minCount = 1, maxCount = 8 },  -- 18414
	{ id = "great mana potion", chance = 33526, minCount = 1, maxCount = 10 },  -- 7590
	{ id = "great spirit potion", chance = 33333, minCount = 1, maxCount = 10 },  -- 8472
	{ id = "ultimate health potion", chance = 32563, minCount = 1, maxCount = 10 },  -- 8473
	{ id = "blue crystal shard", chance = 31599, minCount = 1, maxCount = 8 },  -- 18413
	{ id = "green crystal shard", chance = 30058, minCount = 1, maxCount = 8 },  -- 18415
	{ id = "green gem", chance = 25626 },  -- 2155
	{ id = "small diamond", chance = 17726, minCount = 1, maxCount = 25 },  -- 2145
	{ id = "small ruby", chance = 15029, minCount = 1, maxCount = 25 },  -- 2147
	{ id = "small topaz", chance = 14836, minCount = 1, maxCount = 25 },  -- 9970
	{ id = "blue gem", chance = 14451 },  -- 2158
	{ id = "terra boots", chance = 14066 },  -- 7886
	{ id = "small sapphire", chance = 13680, minCount = 1, maxCount = 25 },  -- 2146
	{ id = "gold coin", chance = 13295, minCount = 20, maxCount = 177 },  -- 2148
	{ id = "gold ingot", chance = 12717 },  -- 9971
	{ id = "small amethyst", chance = 12524, minCount = 1, maxCount = 25 },  -- 2150
	{ id = "paladin armor", chance = 11753 },  -- 8891
	{ id = "small emerald", chance = 11175, minCount = 1, maxCount = 25 },  -- 2149
	{ id = "crown shield", chance = 10405 },  -- 2519
	{ id = "dream warden mask", chance = 10019 },  -- 22610
	{ id = "demon shield", chance = 6166 },  -- 2520
	{ id = "boots of haste", chance = 5395 },  -- 2195
	{ id = "steel boots", chance = 5395 },  -- 2645
	{ id = "skull helmet", chance = 4239 },  -- 5741
	{ id = "royal helmet", chance = 2697 },  -- 2498
	{ id = "magic plate armor", chance = 1734 },  -- 2472
	{ id = "guardian shield", chance = 1541 },  -- 2515
	{ id = "voltage armor", chance = 1349 },  -- 8879
	{ id = "mastermind shield", chance = 578 },  -- 2514
	{ id = "lavos armor", chance = 385 },  -- 8877
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 180, attack = 100 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -700, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -750, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDAXE, target = true },
}

monster.defenses = {
	defense = 65,
	armor = 55,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 300, maxDamage = 500, radius = 8, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 18, effect = CONST_ME_MAGIC_GREEN, speed = 440},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)