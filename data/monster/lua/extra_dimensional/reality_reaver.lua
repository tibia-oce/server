-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Reality_Reaver
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Reality_Reaver
---


local mType = Game.createMonsterType("Reality Reaver")
local monster = {}

monster.description = "a reality reaver"
monster.experience = 2480
monster.outfit = {
	lookType = 879,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3900
monster.maxHealth = 3900
monster.race = "venom"
monster.corpse = 23412
monster.speed = 170
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
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Ssshhh!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "energy drink", chance = 17649, minCount = 1, maxCount = 2 },  -- 26201
	{ id = "energy bar", chance = 17501, minCount = 1, maxCount = 2 },  -- 26191
	{ id = "energy vein", chance = 15255 },  -- 26164
	{ id = "plasmatic lightning", chance = 14753 },  -- 26176
	{ id = "great spirit potion", chance = 11118, minCount = 1, maxCount = 2 },  -- 8472
	{ id = "great mana potion", chance = 10929, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "great health potion", chance = 10808, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "dangerous proto matter", chance = 9858 },  -- 26171
	{ id = "plasma pearls", chance = 9831 },  -- 26162
	{ id = "blue crystal splinter", chance = 8042, minCount = 1, maxCount = 2 },  -- 18418
	{ id = "red crystal fragment", chance = 6160 },  -- 18420
	{ id = "violet crystal shard", chance = 4079 },  -- 18414
	{ id = "blue crystal shard", chance = 4026 },  -- 18413
	{ id = "red gem", chance = 2596 },  -- 2156
	{ id = "wand of starstorm", chance = 1040 },  -- 8920
	{ id = "lightning headband", chance = 520 },  -- 7901
	{ id = "violet gem", chance = 417 },  -- 2153
	{ id = 26185, chance = 386 },  -- ring of blue plasma
	{ id = "focus cape", chance = 381 },  -- 8871
	{ id = "ring of green plasma", chance = 363 },  -- 26187
	{ id = "collar of green plasma", chance = 291 },  -- 26199
	{ id = 26198, chance = 287 },  -- collar of blue plasma
	{ id = 26189, chance = 278 },  -- ring of red plasma
	{ id = 26200, chance = 260 },  -- collar of red plasma
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -180, maxDamage = -400, range = 5, radius = 5, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_PURPLEENERGY, target = true },
	{ name = "reality reaver wave", interval = 2000, chance = 20, minDamage = -200, maxDamage = -500, target = false },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 20, minDamage = -400, maxDamage = -800, radius = 5, effect = CONST_ME_STUN, target = false },
}

monster.defenses = {
	defense = 50,
	armor = 51,
	mitigation = 1.76,
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_POFF },
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_HITAREA, speed = 340},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 85 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)