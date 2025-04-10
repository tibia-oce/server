-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Goblin_Assassin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Goblin_Assassin
---


local mType = Game.createMonsterType("Goblin Assassin")
local monster = {}

monster.description = "a goblin assassin"
monster.experience = 52
monster.outfit = {
	lookType = 296,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 75
monster.maxHealth = 75
monster.race = "blood"
monster.corpse = 6002
monster.speed = 70
monster.manaCost = 360

monster.changeTarget = {
	interval = 10000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
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
	{ text = "Goblin Powahhh!", yell = false },
	{ text = "Me kill you!", yell = false },
	{ text = "Me green menace!", yell = false },
	{ text = "Gobabunga!", yell = false },
	{ text = "Gooobliiiins!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 49845, minCount = 1, maxCount = 9 },  -- 2148
	{ id = "dagger", chance = 17754 },  -- 2379
	{ id = 2667 , chance = 12417 },  -- fish
	{ id = 2230, chance = 12161 },  -- bone
	{ id = "small stone", chance = 10769, minCount = 1, maxCount = 3 },  -- 1294
	{ id = "leather helmet", chance = 10093 },  -- 2461
	{ id = "small axe", chance = 9782 },  -- 2559
	{ id = "short sword", chance = 8688 },  -- 2406
	{ id = "leather armor", chance = 7215 },  -- 2467
	{ id = "mouldy cheese", chance = 6959 },  -- 2235
	{ id = "bone club", chance = 4932 },  -- 2449
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -15 },
	{ name = "drunk", interval = 2000, chance = 10, shootEffect = CONST_ANI_POISON, target = false, duration = 10000 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -35, range = 6, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 6,
	mitigation = 0.15,
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 140},
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