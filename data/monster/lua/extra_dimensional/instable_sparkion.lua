-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Instable_Sparkion
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Instable_Sparkion
---


local mType = Game.createMonsterType("Instable Sparkion")
local monster = {}

monster.description = "an instable sparkion"
monster.experience = 1350
monster.outfit = {
	lookType = 877,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1900
monster.maxHealth = 1900
monster.race = "venom"
monster.corpse = 23388
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10,
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
	{ id = "gold coin", chance = 98987, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 90883 },  -- 2152
	{ id = "blue crystal splinter", chance = 8394 },  -- 18418
	{ id = "sparkion claw", chance = 8249 },  -- 26158
	{ id = "sparkion legs", chance = 6657 },  -- 26160
	{ id = "sparkion tail", chance = 6223 },  -- 26159
	{ id = "small sapphire", chance = 6078, minCount = 1, maxCount = 2 },  -- 2146
	{ id = "energy drink", chance = 5789 },  -- 26201
	{ id = "sparkion stings", chance = 5789 },  -- 26161
	{ id = "cyan crystal fragment", chance = 5210 },  -- 18419
	{ id = "great mana potion", chance = 5210 },  -- 7590
	{ id = "blue crystal shard", chance = 4631 },  -- 18413
	{ id = "energy bar", chance = 4486 },  -- 26191
	{ id = "great health potion", chance = 3763 },  -- 7591
	{ id = "great spirit potion", chance = 3618 },  -- 8472
	{ id = "wand of cosmic energy", chance = 868 },  -- 2189
	{ id = "energy spike sword", chance = 145 },  -- 7869
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -350, length = 6, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -150, maxDamage = -200, range = 5, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 20, minDamage = -300, maxDamage = -600, range = 6, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 37,
	mitigation = 1.18,
	{ name = "speed", interval = 2000, chance = 10, effect = CONST_ME_MAGIC_RED, speed = 280},
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = -15 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 60 },
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