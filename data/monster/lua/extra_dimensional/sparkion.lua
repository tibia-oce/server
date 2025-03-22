-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Sparkion
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Sparkion
---


local mType = Game.createMonsterType("Sparkion")
local monster = {}

monster.description = "a sparkion"
monster.experience = 1520
monster.outfit = {
	lookType = 877,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2700
monster.maxHealth = 2700
monster.race = "venom"
monster.corpse = 26044
monster.speed = 151
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 15,
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
	{ text = "Zzing!", yell = false },
	{ text = "Frizzle!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 90733, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "sparkion claw", chance = 15468 },  -- 26158
	{ id = "energy drink", chance = 15060 },  -- 26201
	{ id = "energy bar", chance = 14685 },  -- 26191
	{ id = "sparkion stings", chance = 14140 },  -- 26161
	{ id = "sparkion legs", chance = 11107 },  -- 26160
	{ id = "great mana potion", chance = 10153, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "great spirit potion", chance = 9744, minCount = 1, maxCount = 2 },  -- 8472
	{ id = "great health potion", chance = 9506, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "sparkion tail", chance = 9131 },  -- 26159
	{ id = "blue crystal splinter", chance = 8586 },  -- 18418
	{ id = "cyan crystal fragment", chance = 5997 },  -- 18419
	{ id = "small sapphire", chance = 4906, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "blue crystal shard", chance = 4225 },  -- 18413
	{ id = "blue gem", chance = 1056 },  -- 2158
	{ id = "wand of cosmic energy", chance = 920 },  -- 2189
	{ id = "ring of green plasma", chance = 375 },  -- 26187
	{ id = 26189, chance = 375 },  -- ring of red plasma
	{ id = 26198, chance = 239 },  -- collar of blue plasma
	{ id = "collar of green plasma", chance = 239 },  -- 26199
	{ id = 26185, chance = 239 },  -- ring of blue plasma
	{ id = 26200, chance = 204 },  -- collar of red plasma
	{ id = "energy spike sword", chance = 170 },  -- 7869
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -400, length = 6, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -400, range = 5, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 20, minDamage = -300, maxDamage = -600, range = 6, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY, target = true },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	mitigation = 1.32,
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_RED, speed = 302},
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 50, maxDamage = 180, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 70 },
	{ type = COMBAT_HOLYDAMAGE, percent = 5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)