-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Minotaur_Hunter
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Minotaur_Hunter
---


local mType = Game.createMonsterType("Minotaur Hunter")
local monster = {}

monster.description = "a minotaur hunter"
monster.experience = 1700
monster.outfit = {
	lookType = 612,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1400
monster.maxHealth = 1400
monster.race = "blood"
monster.corpse = 21095
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 11,
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
	targetDistance = 4,
	runHealth = 300,
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
	{ text = "You are marked for death!", yell = false },
	{ text = "This time the prey is you!", yell = false },
	{ text = "You are hunted!", yell = false },
	{ text = "You'll make a fine trophy!", yell = false },
	{ text = "Bullseye!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99463, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 35026, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "hunting spear", chance = 15024, minCount = 1, maxCount = 5 },  -- 3965
	{ id = "blank rune", chance = 14987, minCount = 1, maxCount = 2 },  -- 2260
	{ id = "royal spear", chance = 11737, minCount = 1, maxCount = 5 },  -- 7378
	{ id = "strong mana potion", chance = 10132, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "strong health potion", chance = 9872, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "soul orb", chance = 7026 },  -- 5944
	{ id = "minotaur horn", chance = 5038, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "minotaur leather", chance = 4892 },  -- 5878
	{ id = "small ruby", chance = 2535, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "small amethyst", chance = 2448, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "stealth ring", chance = 2424 },  -- 2165
	{ id = "green piece of cloth", chance = 1518 },  -- 5910
	{ id = "blue piece of cloth", chance = 1494 },  -- 5912
	{ id = "red piece of cloth", chance = 1482 },  -- 5911
	{ id = "mino shield", chance = 744 },  -- 23546
	{ id = "yellow gem", chance = 550 },  -- 2154
	{ id = "red gem", chance = 524 },  -- 2156
	{ id = 7401, chance = 161 },  -- minotaur trophy
	{ id = "mooh'tah plate", chance = 105 },  -- 23537
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 50, attack = 50 },
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -150, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_EXPLOSIONAREA, target = false },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 40, minDamage = -300, maxDamage = -400, range = 7, radius = 3, shootEffect = CONST_ANI_THROWINGKNIFE, effect = CONST_ME_HITAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -160, maxDamage = -260, range = 7, radius = 2, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_EXPLOSIONHIT, target = true },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_LIFEDRAIN, minDamage = -35, maxDamage = -150, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 36,
	mitigation = 1.71,
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_HEALING, minDamage = 95, maxDamage = 180, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_POFF, speed = 230},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)