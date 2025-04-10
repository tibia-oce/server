-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Haunted_Treeling
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Haunted_Treeling
---


local mType = Game.createMonsterType("Haunted Treeling")
local monster = {}

monster.description = "a haunted treeling"
monster.experience = 310
monster.outfit = {
	lookType = 310,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 450
monster.maxHealth = 450
monster.race = "undead"
monster.corpse = 9867
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
	canPushCreatures = true,
	staticAttackChance = 85,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Knarrrz", yell = false },
	{ text = "Huuhuuhuuuhuuaarrr", yell = false },
	{ text = "Knorrrrrr", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 91974, minCount = 1, maxCount = 95 },  -- 2148
	{ id = 2250, chance = 29321 },  -- wooden trash
	{ id = "red mushroom", chance = 7835 },  -- 2788
	{ id = "white mushroom", chance = 5127, minCount = 1, maxCount = 2 },  -- 2787
	{ id = "health potion", chance = 5087 },  -- 7618
	{ id = "haunted piece of wood", chance = 5000 },  -- 10600
	{ id = "orange mushroom", chance = 1830 },  -- 2790
	{ id = "strong health potion", chance = 1102 },  -- 7588
	{ id = "small emerald", chance = 660 },  -- 2149
	{ id = "dwarven ring", chance = 613 },  -- 2213
	{ id = "bullseye potion", chance = 103 },  -- 7443
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_MANADRAIN, minDamage = -30, maxDamage = -100, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "speed", interval = 2000, chance = 15, speed = -700, length = 5, spread = 0, effect = CONST_ME_SMALLPLANTS, target = false, duration = 15000 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -100, range = 7, radius = 1, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_CARNIPHILA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -55, maxDamage = -100, radius = 4, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, radius = 1, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 0,
	armor = 20,
	mitigation = 0.91,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)