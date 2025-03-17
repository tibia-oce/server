-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Dread_Intruder
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dread_Intruder
---


local mType = Game.createMonsterType("Dread Intruder")
local monster = {}

monster.description = "a dread intruder"
monster.experience = 2400
monster.outfit = {
	lookType = 882,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4500
monster.maxHealth = 4500
monster.race = "venom"
monster.corpse = 23478
monster.speed = 165
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
	{ text = "Whirr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 8 },  -- 2152
	{ id = "energy drink", chance = 20860 },  -- 26201
	{ id = "energy bar", chance = 19895 },  -- 26191
	{ id = "frozen lightning", chance = 15967 },  -- 26175
	{ id = "instable proto matter", chance = 14938 },  -- 26172
	{ id = "great mana potion", chance = 13305 },  -- 7590
	{ id = "great spirit potion", chance = 12944 },  -- 8472
	{ id = "ultimate health potion", chance = 12734 },  -- 8473
	{ id = "energy ball", chance = 11974 },  -- 26179
	{ id = "odd organ", chance = 9808 },  -- 26166
	{ id = "blue crystal splinter", chance = 8967 },  -- 18418
	{ id = "cyan crystal fragment", chance = 5755 },  -- 18419
	{ id = "small ruby", chance = 4710, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "small sapphire", chance = 4640, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "violet crystal shard", chance = 4500 },  -- 18414
	{ id = "small amethyst", chance = 4435, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "violet gem", chance = 1002 },  -- 2153
	{ id = 26189, chance = 302 },  -- ring of red plasma
	{ id = "ring of green plasma", chance = 280 },  -- 26187
	{ id = 26198, chance = 253 },  -- collar of blue plasma
	{ id = 26185, chance = 253 },  -- ring of blue plasma
	{ id = "collar of green plasma", chance = 237 },  -- 26199
	{ id = 26200, chance = 210 },  -- collar of red plasma
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500 },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 20, minDamage = -400, maxDamage = -600, radius = 5, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -250, maxDamage = -400, range = 4, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "dread intruder wave", interval = 2000, chance = 25, minDamage = -350, maxDamage = -550, target = false },
}

monster.defenses = {
	defense = 50,
	armor = 50,
	mitigation = 1.54,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 80, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 5 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)