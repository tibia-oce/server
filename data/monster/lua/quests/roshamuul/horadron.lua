-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Horadron
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Horadron
---


local mType = Game.createMonsterType("Horadron")
local monster = {}

monster.description = "Horadron"
monster.experience = 18000
monster.outfit = {
	lookType = 12,
	lookHead = 78,
	lookBody = 80,
	lookLegs = 110,
	lookFeet = 77,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 30000
monster.maxHealth = 30000
monster.race = "blood"
monster.corpse = 6068
monster.speed = 160
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
	canPushItems = false,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Defiler", chance = 12, interval = 2000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Even I fear the wrath of the princes. And the cold touch of those whom they serve! You are not prepared!", yell = false },
	{ text = "You foolish mortals with you medding you brought the end upon your world!", yell = false },
	{ text = "After all those aeons I smell freedom at last!", yell = false },
}

monster.loot = {
	{ id = "cluster of solace", chance = 100000 },  -- 22396
	{ id = "demon horn", chance = 100000 },  -- 5954
	{ id = "demonic essence", chance = 100000 },  -- 6500
	{ id = "gold coin", chance = 100000, minCount = 4, maxCount = 197 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 50 },  -- 2152
	{ id = "unrealized dream", chance = 100000 },  -- 22598
	{ id = "dream matter", chance = 49421 },  -- 22397
	{ id = "beastslayer axe", chance = 35537 },  -- 3962
	{ id = "spellbook of warding", chance = 29752 },  -- 8901
	{ id = "small sapphire", chance = 18347, minCount = 1, maxCount = 25 },  -- 2146
	{ id = "blue robe", chance = 18017 },  -- 2656
	{ id = "small topaz", chance = 17190, minCount = 1, maxCount = 25 },  -- 9970
	{ id = "crown armor", chance = 16364 },  -- 2487
	{ id = "small amethyst", chance = 15868, minCount = 1, maxCount = 25 },  -- 2150
	{ id = "small ruby", chance = 15702, minCount = 1, maxCount = 25 },  -- 2147
	{ id = "knight legs", chance = 15537 },  -- 2477
	{ id = "small emerald", chance = 14876, minCount = 1, maxCount = 25 },  -- 2149
	{ id = "small diamond", chance = 14380, minCount = 1, maxCount = 25 },  -- 2145
	{ id = "lightning legs", chance = 13719 },  -- 7895
	{ id = "steel boots", chance = 12893 },  -- 2645
	{ id = "noble axe", chance = 12397 },  -- 7456
	{ id = "crown legs", chance = 11405 },  -- 2488
	{ id = "dream warden mask", chance = 11405 },  -- 22610
	{ id = "spellbook of mind control", chance = 9587 },  -- 8902
	{ id = "spellbook of lost souls", chance = 9421 },  -- 8903
	{ id = "golden armor", chance = 8926 },  -- 2466
	{ id = "butcher's axe", chance = 2149 },  -- 7412
	{ id = "vile axe", chance = 1818 },  -- 7388
	{ id = "golden legs", chance = 1488 },  -- 2470
	{ id = "spellscroll of prophecies", chance = 1322 },  -- 8904
	{ id = "executioner", chance = 661 },  -- 7453
	{ id = "great axe", chance = 165 },  -- 2415
	{ id = "spellbook of dark mysteries", chance = 165 },  -- 8918
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 110, attack = 100 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -600, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -600, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -235, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -250, radius = 3, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 25, minDamage = -300, maxDamage = -450, radius = 3, effect = CONST_ME_HITBYPOISON, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 72,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 400, maxDamage = 700, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = -40 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)