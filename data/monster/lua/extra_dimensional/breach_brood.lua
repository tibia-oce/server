-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Breach_Brood
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Breach_Brood
---


local mType = Game.createMonsterType("Breach Brood")
local monster = {}

monster.description = "a breach brood"
monster.experience = 1760
monster.outfit = {
	lookType = 878,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3500
monster.maxHealth = 3500
monster.race = "venom"
monster.corpse = 23392
monster.speed = 135
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 20,
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
	{ text = "Hisss!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "energy drink", chance = 18152 },  -- 26201
	{ id = "energy bar", chance = 18072 },  -- 26191
	{ id = "spark sphere", chance = 14847 },  -- 26174
	{ id = "great health potion", chance = 12339 },  -- 7591
	{ id = "great mana potion", chance = 12154 },  -- 7590
	{ id = "great spirit potion", chance = 12039 },  -- 8472
	{ id = "volatile proto matter", chance = 10228 },  -- 26170
	{ id = "crystallized anger", chance = 10193 },  -- 26163
	{ id = "curious matter", chance = 10118 },  -- 26167
	{ id = "plasma pearls", chance = 10017 },  -- 26162
	{ id = "blue crystal splinter", chance = 7968, minCount = 1, maxCount = 2 },  -- 18418
	{ id = "cyan crystal fragment", chance = 5808 },  -- 18419
	{ id = "green crystal shard", chance = 4023 },  -- 18415
	{ id = "blue crystal shard", chance = 4006 },  -- 18413
	{ id = 26185, chance = 361 },  -- ring of blue plasma
	{ id = "blue gem", chance = 344 },  -- 2158
	{ id = 26189, chance = 278 },  -- ring of red plasma
	{ id = 26198, chance = 251 },  -- collar of blue plasma
	{ id = "ring of green plasma", chance = 251 },  -- 26187
	{ id = "collar of green plasma", chance = 220 },  -- 26199
	{ id = 26200, chance = 189 },  -- collar of red plasma
	{ id = "lightning legs", chance = 71 },  -- 7895
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -350 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -400, range = 6, shootEffect = CONST_ANI_FLASHARROW, effect = CONST_ME_STUN, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -350, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "breach brood reducer", interval = 2000, chance = 20, target = false },
}

monster.defenses = {
	defense = 52,
	armor = 53,
	mitigation = 1.46,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)