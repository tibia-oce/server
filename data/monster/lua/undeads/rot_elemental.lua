-- Version: 10.50
-- Monster: https://tibia.fandom.com/wiki/Rot_Elemental
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Rot_Elemental
---


local mType = Game.createMonsterType("Rot Elemental")
local monster = {}

monster.description = "a rot elemental"
monster.experience = 750
monster.outfit = {
	lookType = 615,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 850
monster.maxHealth = 850
monster.race = "venom"
monster.corpse = 21110
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 2,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 143,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "*splib*", yell = false },
	{ text = "*glibb*", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 140 },  -- 2148
	{ id = "glob of glooth", chance = 14036, minCount = 1, maxCount = 2 },  -- 23553
	{ id = "platinum coin", chance = 10131 },  -- 2152
	{ id = "strong mana potion", chance = 10076 },  -- 7589
	{ id = "strong health potion", chance = 10017 },  -- 7588
	{ id = "small sapphire", chance = 5066 },  -- 2146
	{ id = "small emerald", chance = 5008, minCount = 1, maxCount = 4 },  -- 2149
	{ id = "small topaz", chance = 4958, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "glooth spear", chance = 4877 },  -- 23529
	{ id = "life ring", chance = 1487 },  -- 2168
	{ id = "glooth axe", chance = 101 },  -- 23551
	{ id = "green gem", chance = 101 },  -- 2155
	{ id = "glooth amulet", chance = 94 },  -- 23554
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 58, attack = 50, condition = { type = CONDITION_POISON, totalDamage = 280, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -250, range = 7, radius = 3, shootEffect = CONST_ANI_GLOOTHSPEAR, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -230, length = 6, spread = 0, effect = CONST_ME_POISONAREA, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 10, minDamage = -200, maxDamage = -300, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "rot elemental paralyze", interval = 2000, chance = 11, target = false },
}

monster.defenses = {
	defense = 15,
	armor = 41,
	mitigation = 1.07,
	{ name = "combat", interval = 2000, chance = 7, type = COMBAT_HEALING, minDamage = 40, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 9, effect = CONST_ME_SMOKE, speed = 230},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)