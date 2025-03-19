-- Version: 8.10
-- Monster: https://tibia.fandom.com/wiki/Dryad
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dryad
---


local mType = Game.createMonsterType("Dryad")
local monster = {}

monster.description = "a dryad"
monster.experience = 190
monster.outfit = {
	lookType = 137,
	lookHead = 99,
	lookBody = 41,
	lookLegs = 5,
	lookFeet = 102,
	lookAddons = 3,
	lookMount = 0,
}


monster.health = 310
monster.maxHealth = 310
monster.race = "blood"
monster.corpse = 18042
monster.speed = 115
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Feel the wrath of mother Tibia!", yell = false },
	{ text = "Defiler of nature!", yell = false },
}

monster.loot = {
	{ id = "white mushroom", chance = 55191, minCount = 1, maxCount = 2 },  -- 2787
	{ id = "gold coin", chance = 39703, minCount = 1, maxCount = 30 },  -- 2148
	{ id = "seeds", chance = 3705, minCount = 1, maxCount = 2 },  -- 7732
	{ id = "leaf legs", chance = 1104 },  -- 9928
	{ id = "flower dress", chance = 1037 },  -- 9929
	{ id = "coconut shoes", chance = 1033 },  -- 9931
	{ id = 9927, chance = 1029 },  -- flower wreath
	{ id = "orange mushroom", chance = 820, minCount = 1, maxCount = 2 },  -- 2790
	{ id = "carrot on a stick", chance = 205 },  -- 13298
	{ id = "small amethyst", chance = 96 },  -- 2150
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -40, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 15,
	mitigation = 1.26,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
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
