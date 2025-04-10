-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Dworc_Voodoomaster
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dworc_Voodoomaster
---


local mType = Game.createMonsterType("Dworc Voodoomaster")
local monster = {}

monster.description = "a dworc voodoomaster"
monster.experience = 55
monster.outfit = {
	lookType = 214,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 80
monster.maxHealth = 80
monster.race = "blood"
monster.corpse = 6055
monster.speed = 75
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 80,
	targetDistance = 4,
	runHealth = 15,
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
	{ text = "Grow truk grrrrr.", yell = false },
	{ text = "Brak brrretz!", yell = false },
	{ text = "Prek tars, dekklep zurk.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 74846, minCount = 1, maxCount = 17 },  -- 2148
	{ id = "leather armor", chance = 10057 },  -- 2467
	{ id = 2230, chance = 5822 },  -- bone
	{ id = 2050, chance = 5534 },  -- torch
	{ id = 2231, chance = 3064 },  -- big bone
	{ id = 2229, chance = 1983, minCount = 1, maxCount = 3 },  -- skull
	{ id = "poison dagger", chance = 1010 },  -- 2411
	{ id = "health potion", chance = 592 },  -- 7618
	{ id = "strange symbol", chance = 501 },  -- 2174
	{ id = "tribal mask", chance = 482 },  -- 3967
	{ id = 2322, chance = 117 },  -- voodoo doll

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -20 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -40, range = 1, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -800, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_TELEPORT, target = false },
	{ name = "outfit", interval = 2000, chance = 10, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "chicken" },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -6, maxDamage = -18, radius = 6, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "poisonfield", interval = 2000, chance = 10, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 3,
	mitigation = 0.20,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 3, maxDamage = 9, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 150},
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 35 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
