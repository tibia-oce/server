-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Fleshslicer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Fleshslicer
---


local mType = Game.createMonsterType("Fleshslicer")
local monster = {}

monster.description = "Fleshslicer"
monster.experience = 5500
monster.outfit = {
	lookType = 457,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 5700
monster.maxHealth = 5700
monster.race = "blood"
monster.corpse = 15296
monster.speed = 280
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
}

monster.loot = {
	{ id = "compound eye", chance = 100000, minCount = 1, maxCount = 2 },  -- 15486
	{ id = "gold coin", chance = 100000, minCount = 36, maxCount = 234 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "spidris mandible", chance = 100000 },  -- 15485
	{ id = "great mana potion", chance = 71053, minCount = 1, maxCount = 2 },  -- 7590
	{ id = 16096, chance = 60526 },  -- dung ball (quest)
	{ id = "small ruby", chance = 47368, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "ripper lance", chance = 34211 },  -- 3964
	{ id = "ultimate health potion", chance = 28947 },  -- 8473
	{ id = "white pearl", chance = 23684, minCount = 1, maxCount = 5 },  -- 2143
	{ id = "red gem", chance = 18421 },  -- 2156
	{ id = "titan axe", chance = 7895 },  -- 7413
	{ id = 6300, chance = 5263 },  -- death ring
	{ id = 7632, chance = 5263 },  -- giant shimmering pearl
	{ id = "violet gem", chance = 5263 },  -- 2153
	{ id = "hive bow", chance = 2632 },  -- 15643
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -99 },
}

monster.defenses = {
	defense = 20,
	armor = 12,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
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
