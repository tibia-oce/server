-- Version: 9.50
-- Monster: https://tibia.fandom.com/wiki/Deepling_Master_Librarian
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deepling_Master_Librarian
---


local mType = Game.createMonsterType("Deepling Master Librarian")
local monster = {}

monster.description = "a deepling master librarian"
monster.experience = 1900
monster.outfit = {
	lookType = 443,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1700
monster.maxHealth = 1700
monster.race = "blood"
monster.corpse = 15211
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
	staticAttackChance = 60,
	targetDistance = 1,
	runHealth = 250,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 90141, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "spellsinger's seal", chance = 24883 },  -- 15421
	{ id = "deepling filet", chance = 20599 },  -- 15488
	-- { id = 15422, chance = 19894 },  -- key to the drowned library
	{ id = "eye of a deepling", chance = 10211 },  -- 13870
	{ id = 2667 , chance = 9155, minCount = 1, maxCount = 2 },  -- fish
	{ id = "small sapphire", chance = 7805, minCount = 1, maxCount = 3 },  -- 2146
	{ id = "deepling staff", chance = 3110 },  -- 15400
	{ id = "life ring", chance = 2758 },  -- 2168
	{ id = "fish fin", chance = 2054 },  -- 5895
	{ id = "necklace of the deep", chance = 1291 },  -- 15403
	{ id = "ornate crossbow", chance = 293 },  -- 15644
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -210, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_ICEDAMAGE, minDamage = -260, maxDamage = -450, length = 10, spread = 3, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DROWNDAMAGE, minDamage = -150, maxDamage = -280, radius = 4, effect = CONST_ME_BUBBLES, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -80, maxDamage = -140, range = 7, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_MANADRAIN, minDamage = -60, maxDamage = -140, range = 7, effect = CONST_ME_SMALLPLANTS, target = false },
	{ name = "deepling spellsinger skill reducer", interval = 2000, chance = 10, range = 5, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 45,
	mitigation = 1.37,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)