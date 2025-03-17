-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Vulcongra
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Vulcongra
---


local mType = Game.createMonsterType("Vulcongra")
local monster = {}

monster.description = "a vulcongra"
monster.experience = 1100
monster.outfit = {
	lookType = 509,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1600
monster.maxHealth = 1600
monster.race = "fire"
monster.corpse = 16186
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
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
	runHealth = 220,
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
	{ text = "Fuchah!", yell = false },
	{ text = "Fuchah! Fuchah!", yell = false },
	{ text = "Yag! Yag! Yag!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 107 },  -- 2148
	{ id = "platinum coin", chance = 14358 },  -- 2152
	{ id = "magma clump", chance = 12029 },  -- 18424
	{ id = "banana", chance = 9688, minCount = 1, maxCount = 10 },  -- 2676
	{ id = "fiery heart", chance = 9058 },  -- 10553
	{ id = "blazing bone", chance = 7888 },  -- 18425
	{ id = "strong health potion", chance = 7348 },  -- 7588
	{ id = "strong mana potion", chance = 7213 },  -- 7589
	{ id = "brown crystal splinter", chance = 4917 },  -- 18417
	{ id = "sword ring", chance = 2993 },  -- 2207
	{ id = "red crystal fragment", chance = 2340 },  -- 18420
	{ id = "wand of inferno", chance = 956 },  -- 2187
	{ id = "magma amulet", chance = 889 },  -- 7890
	{ id = 13757, chance = 866 },  -- coal
	{ id = "fire sword", chance = 293 },  -- 2392
	{ id = "magma coat", chance = 169 },  -- 7899
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -235 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -195, maxDamage = -340, length = 8, spread = 0, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -200, range = 7, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "vulcongra soulfire", interval = 3000, chance = 100, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 50,
	mitigation = 1.46,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
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