-- Version: 8.50
-- Monster: https://tibia.fandom.com/wiki/Leviathan
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Leviathan
---


local mType = Game.createMonsterType("Leviathan")
local monster = {}

monster.description = "Leviathan"
monster.experience = 5000
monster.outfit = {
	lookType = 275,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 6000
monster.maxHealth = 6000
monster.race = "blood"
monster.corpse = 949
monster.speed = 379
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 600,
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
	{ text = "CHHHRRRR", yell = true },
	{ text = "HISSSS", yell = true },
}

monster.loot = {
	{ id = "leviathan's amulet", chance = 100000 },  -- 10220
	{ id = "sea serpent trophy", chance = 100000 },  -- 10529
	{ id = 9808, chance = 84559 },  -- todo: rusted armor does not exist in items.xml
	{ id = "platinum coin", chance = 83088, minCount = 1, maxCount = 7 },  -- 2152
	{ id = 9811, chance = 83088 },  -- todo: rusted legs does not exist in items.xml
	{ id = "bonebreaker", chance = 53676 },  -- 7428
	{ id = "small sapphire", chance = 50735, minCount = 1, maxCount = 5 },  -- 2146
	{ id = "strong mana potion", chance = 49265 },  -- 7589
	{ id = "moon backpack", chance = 15441 },  -- 10521
	{ id = "frozen plate", chance = 735 },  -- 8887
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -500 },
	{ name = "combat", interval = 1000, chance = 8, type = COMBAT_EARTHDAMAGE, minDamage = -130, maxDamage = -460, length = 9, spread = 3, effect = CONST_ME_BIGPLANTS, target = false },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -365, maxDamage = -491, length = 9, spread = 3, effect = CONST_ME_ICEAREA, target = false },
	{ name = "combat", interval = 1000, chance = 11, type = COMBAT_DROWNDAMAGE, minDamage = -15, maxDamage = -20, radius = 4, effect = CONST_ME_LOSEENERGY, target = true },
}

monster.defenses = {
	defense = 30,
	armor = 20,
	mitigation = 1.24,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 100, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)