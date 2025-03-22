-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Stabilizing_Reality_Reaver
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Stabilizing_Reality_Reaver
---


local mType = Game.createMonsterType("Stabilizing Reality Reaver")
local monster = {}

monster.description = "a stabilizing reality reaver"
monster.experience = 1950
monster.outfit = {
	lookType = 879,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2500
monster.maxHealth = 2500
monster.race = "venom"
monster.corpse = 23412
monster.speed = 155
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
	{ text = "Ssshhh!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 98154, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 98154, minCount = 1, maxCount = 4 },  -- 2152
	{ id = "great health potion", chance = 14606 },  -- 7591
	{ id = "great spirit potion", chance = 14461 },  -- 8472
	{ id = "great mana potion", chance = 13942 },  -- 7590
	{ id = "condensed energy", chance = 10166 },  -- 26157
	{ id = "energy drink", chance = 9668 },  -- 26201
	{ id = "small energy ball", chance = 9564 },  -- 26180
	{ id = "energy bar", chance = 9502 },  -- 26191
	{ id = "plasma pearls", chance = 9357 },  -- 26162
	{ id = "violet crystal shard", chance = 4212 },  -- 18414
	{ id = "red crystal fragment", chance = 3776 },  -- 18420
	{ id = "blue crystal splinter", chance = 3672, minCount = 1, maxCount = 2 },  -- 18418
	{ id = "blue crystal shard", chance = 1701 },  -- 18413
	{ id = "red gem", chance = 1369 },  -- 2156
	{ id = "wand of starstorm", chance = 1224 },  -- 8920
	{ id = "lightning headband", chance = 166 },  -- 7901
	{ id = "focus cape", chance = 145 },  -- 8871
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -180, maxDamage = -300, range = 5, radius = 5, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_PURPLEENERGY, target = true },
	{ name = "reality reaver wave", interval = 2000, chance = 20, minDamage = -200, maxDamage = -350, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -80, maxDamage = -200, radius = 3, effect = CONST_ME_STUN, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 46,
	mitigation = 1.57,
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_POFF },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 80, maxDamage = 210, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_HITAREA, speed = 310},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)