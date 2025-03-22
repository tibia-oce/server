-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Crystal_Wolf
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Crystal_Wolf
---


local mType = Game.createMonsterType("Crystal Wolf")
local monster = {}

monster.description = "a crystal wolf"
monster.experience = 275
monster.outfit = {
	lookType = 391,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 750
monster.maxHealth = 750
monster.race = "undead"
monster.corpse = 13584
monster.speed = 160
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
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 20,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 5,
	color = 179,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Aaaauuuuuooooooo!!", yell = false },
	{ text = "Raaarrr!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 86441, minCount = 1, maxCount = 67 },  -- 2148
	{ id = "meat", chance = 45763 },  -- 2666
	{ id = "shiver arrow", chance = 11864, minCount = 1, maxCount = 10 },  -- 7839
	{ id = "hailstorm rod", chance = 5085 },  -- 2183
	{ id = "crystalline armor", chance = 1695 },  -- 8878
	{ id = "wolf paw", chance = 1695 },  -- 5897
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -80 },
	{ name = "crystal wolf wave", interval = 2000, chance = 15, minDamage = -60, maxDamage = -130, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -80, maxDamage = -150, range = 6, radius = 3, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_GIANTICE, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -25, maxDamage = -80, range = 7, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 19,
	mitigation = 0.67,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 15, maxDamage = 55, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 5 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
