-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/Nightfiend
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Nightfiend
---


local mType = Game.createMonsterType("Nightfiend")
local monster = {}

monster.description = "a nightfiend"
monster.experience = 2100
monster.outfit = {
	lookType = 568,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2700
monster.maxHealth = 2700
monster.race = "blood"
monster.corpse = 2669
monster.speed = 112
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
}

monster.loot = {
	{ id = "gold coin", chance = 98673, minCount = 1, maxCount = 148 },  -- 2148
	{ id = "platinum coin", chance = 32836 },  -- 2152
	{ id = "vampire teeth", chance = 10779 },  -- 10602
	{ id = "small ruby", chance = 8624, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "tooth file", chance = 7629 },  -- 21241
	{ id = "strong health potion", chance = 7297 },  -- 7588
	{ id = "strong mana potion", chance = 6633 },  -- 7589
	{ id = "blood preservation", chance = 5638 },  -- 12405
	{ id = "ring of healing", chance = 3648 },  -- 2214
	{ id = "emerald bangle", chance = 995 },  -- 2127
	{ id = "red gem", chance = 995 },  -- 2156
	{ id = "vampire shield", chance = 166 },  -- 2534
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -45 },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -5, maxDamage = -40, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 11,
	armor = 46,
	mitigation = 1.43,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -8 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)