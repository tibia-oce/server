-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Omrafir
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Omrafir
---


local mType = Game.createMonsterType("Omrafir")
local monster = {}

monster.description = "Omrafir"
monster.experience = 50000
monster.outfit = {
	lookType = 12,
	lookHead = 78,
	lookBody = 3,
	lookLegs = 79,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 322000
monster.maxHealth = 322000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 240
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
	{ text = "FIRST I'LL OBLITERATE YOU THEN I BURN THIS PRISON DOWN!!", yell = true },
	{ text = "I'M TOO HOT FOR YOU TO HANDLE!", yell = true },
	{ text = "FREEDOM FOR THE PRINCES!", yell = true },
	{ text = "OMRAFIR INHALES DEEPLY!", yell = true },
	{ text = "OMRAFIR BREATHES INFERNAL FIRE", yell = true },
	{ text = "THE POWER OF HIS INTERNAL FIRE RENEWS OMRAFIR!", yell = true },
	{ text = "I WILL RULE WHEN THE NEW ORDER IS ESTABLISHED!", yell = true },
	{ text = "INFERNATIL! COME HERE AND FIGHT ME YOU COWARD!", yell = true },
}

monster.loot = {
	{ id = "platinum coin", chance = 93750, minCount = 10, maxCount = 20 },  -- 2152
	{ id = "demonic essence", chance = 81250 },  -- 6500
	{ id = "dream matter", chance = 81250, minCount = 1, maxCount = 2 },  -- 22397
	{ id = "unrealized dream", chance = 81250, minCount = 1, maxCount = 3 },  -- 22598
	{ id = "cluster of solace", chance = 62500, minCount = 1, maxCount = 4 },  -- 22396
	{ id = "great spirit potion", chance = 56250, maxCount = 8 },  -- 8472
	{ id = "cyan crystal fragment", chance = 43750, maxCount = 3 },  -- 18419
	{ id = 7632, chance = 43750 },  -- giant shimmering pearl
	{ id = "blue crystal shard", chance = 37500, maxCount = 5 },  -- 18413
	{ id = "green crystal fragment", chance = 37500, maxCount = 3 },  -- 18421
	{ id = "ultimate health potion", chance = 31250, maxCount = 8 },  -- 8473
	{ id = "demon horn", chance = 18750 },  -- 5954
	{ id = "gold coin", chance = 18750, maxCount = 100 },  -- 2148
	{ id = "green crystal shard", chance = 18750, maxCount = 5 },  -- 18415
	{ id = "green gem", chance = 18750 },  -- 2155
	{ id = "lightning robe", chance = 18750 },  -- 7898
	{ id = "violet crystal shard", chance = 18750, maxCount = 5 },  -- 18414
	{ id = "lightning boots", chance = 12500 },  -- 7893
	{ id = "nightmare hook", chance = 12500 },  -- 22616
	{ id = "noble axe", chance = 12500, maxCount = 2 },  -- 7456
	{ id = "crystalline armor", chance = 6250 },  -- 8878
	{ id = "demonic tapestry", chance = 6250 },  -- 22612
	{ id = "dream warden mask", chance = 6250 },  -- 22610
	{ id = "great mana potion", chance = 6250, maxCount = 8 },  -- 7590
	{ id = "nightmare horn", chance = 6250 },  -- 22608
	{ id = "psychedelic tapestry", chance = 6250 },  -- 22611
	{ id = "red crystal fragment", chance = 6250, maxCount = 3 },  -- 18420
	{ id = "ring of healing", chance = 6250 },  -- 2214
	{ id = "skull helmet", chance = 6250 },  -- 5741
	{ id = "steel boots", chance = 6250 },  -- 2645
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 392, attack = 500 },
	{ name = "omrafir wave", interval = 2000, chance = 17, minDamage = -500, maxDamage = -1000, target = false },
	{ name = "omrafir beam", interval = 2000, chance = 15, minDamage = -7000, maxDamage = -10000, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -1000, maxDamage = -3000, length = 10, spread = 3, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -400, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 19, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -300, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, radius = 1, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = true },
	{ name = "firefield", interval = 2000, chance = 12, radius = 3, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true },
}

monster.defenses = {
	defense = 165,
	armor = 155,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_HEALING, minDamage = 440, maxDamage = 800, target = false },
	{ name = "omrafir summon", interval = 2000, chance = 50, target = false },
	{ name = "omrafir healing 2", interval = 2000, chance = 20, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
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