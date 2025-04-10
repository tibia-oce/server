-- Version: 5.0
-- Monster: https://tibia.fandom.com/wiki/Black_Knight
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Black_Knight
---


local mType = Game.createMonsterType("Black Knight")
local monster = {}

monster.description = "Black Knight"
monster.experience = 1600
monster.outfit = {
	lookType = 131,
	lookHead = 95,
	lookBody = 95,
	lookLegs = 95,
	lookFeet = 95,
	lookAddons = 3,
	lookMount = 0,
}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"BlackKnightDeath",
-- }


monster.health = 1800
monster.maxHealth = 1800
monster.race = "blood"
monster.corpse = 20355
monster.speed = 125
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = true,
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
	{ text = "NO PRISONERS!", yell = true },
	{ text = "By Bolg's blood!", yell = false },
	{ text = "You're no match for me!", yell = false },
	{ text = "NO MERCY!", yell = true },
	{ text = "MINE!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 48646, minCount = 1, maxCount = 143 },  -- 2148
	{ id = "spear", chance = 29517, minCount = 1, maxCount = 3 },  -- 2389
	{ id = "brown bread", chance = 20357, minCount = 1, maxCount = 2 },  -- 2691
	{ id = 2120, chance = 14381 },  -- rope
	{ id = "brass legs", chance = 13069 },  -- 2478
	{ id = 2381, chance = 12566 },  -- halberd
	{ id = "plate armor", chance = 10947 },  -- 2463
	{ id = "steel helmet", chance = 10416 },  -- 2457
	{ id = "two handed sword", chance = 9578 },  -- 2377
	{ id = "battle hammer", chance = 6953 },  -- 2417
	{ id = "warrior helmet", chance = 4719 },  -- 2475
	{ id = "knight axe", chance = 2653 },  -- 2430
	{ id = "dark helmet", chance = 2402 },  -- 2490
	{ id = "dark armor", chance = 2011 },  -- 2489
	{ id = "knight legs", chance = 1033 },  -- 2477
	{ id = "knight armor", chance = 726 },  -- 2476
	{ id = "ruby necklace", chance = 726 },  -- 2133
	{ id = "lightning legs", chance = 586 },  -- 7895
	{ id = "boots of haste", chance = 391 },  -- 2195
	{ id = "dragon lance", chance = 307 },  -- 2414
	{ id = "piggy bank", chance = 112 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -300 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -200, range = 7, shootEffect = CONST_ANI_SPEAR, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 42,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 95 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = -8 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
