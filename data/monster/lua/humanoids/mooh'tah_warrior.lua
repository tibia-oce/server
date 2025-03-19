-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Mooh%27Tah_Warrior
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Mooh%27Tah_Warrior
---


local mType = Game.createMonsterType("Mooh'Tah Warrior")
local monster = {}

monster.description = "a mooh'tah warrior"
monster.experience = 900
monster.outfit = {
	lookType = 611,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 21091
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 4,
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
	{ text = "Feel the power of the Mooh'Tah!", yell = false },
	{ text = "Ommm!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 120 },  -- 2148
	{ id = "platinum coin", chance = 39886, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "mooh'tah shell", chance = 15114 },  -- 23573
	{ id = "strong mana potion", chance = 7085 },  -- 7589
	{ id = "strong health potion", chance = 6956 },  -- 7588
	{ id = "small emerald", chance = 5178 },  -- 2149
	{ id = "minotaur leather", chance = 5140 },  -- 5878
	{ id = "small amethyst", chance = 5116 },  -- 2150
	{ id = "small topaz", chance = 5088 },  -- 9970
	{ id = "minotaur horn", chance = 5082, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "small ruby", chance = 5043 },  -- 2147
	{ id = "cowtana", chance = 1443 },  -- 23548
	{ id = "sword ring", chance = 1066 },  -- 2207
	{ id = "mooh'tah plate", chance = 1010 },  -- 23537
	{ id = "guardian shield", chance = 908 },  -- 2515
	{ id = "red piece of cloth", chance = 743 },  -- 5911
	{ id = "knight legs", chance = 694 },  -- 2477
	{ id = "knight armor", chance = 490 },  -- 2476
	{ id = 7401, chance = 134 },  -- minotaur trophy
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 45, attack = 80 },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_ENERGYDAMAGE, minDamage = -150, maxDamage = -200, length = 4, spread = 0, effect = CONST_ME_YELLOWENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 11, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -135, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -150, radius = 3, effect = CONST_ME_HITAREA, target = false },
	-- { name = "mooh'tah master skill reducer", interval = 2000, chance = 19, range = 7, target = false },
}

monster.defenses = {
	defense = 37,
	armor = 37,
	mitigation = 1.35,
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_HEALING, minDamage = 110, maxDamage = 160, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "haste", interval = 2000, chance = 8, speedChange = 220, effect = CONST_ME_MAGIC_RED, target = false, duration = 1000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)