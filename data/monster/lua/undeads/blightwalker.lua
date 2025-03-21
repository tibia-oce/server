-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Blightwalker
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Blightwalker
---


local mType = Game.createMonsterType("Blightwalker")
local monster = {}

monster.description = "a blightwalker"
monster.experience = 6400
monster.outfit = {
	lookType = 246,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 8100
monster.maxHealth = 8100
monster.race = "undead"
monster.corpse = 6353
monster.speed = 175
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 800,
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
	{ text = "I can see you decaying!", yell = false },
	{ text = "Let me taste your mortality!", yell = false },
	{ text = "Your lifeforce is waning!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 199 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "bunch of wheat", chance = 49772, minCount = 1, maxCount = 2 },  -- 2694
	{ id = "great mana potion", chance = 30191, minCount = 1, maxCount = 3 },  -- 7590
	{ id = "demonic essence", chance = 29986 },  -- 6500
	{ id = "soul orb", chance = 25826 },  -- 5944
	{ id = "blank rune", chance = 25519, minCount = 1, maxCount = 2 },  -- 2260
	{ id = "bundle of cursed straw", chance = 14919 },  -- 10605
	{ id = "ultimate health potion", chance = 14593, minCount = 1, maxCount = 2 },  -- 8473
	{ id = "hailstorm rod", chance = 9642 },  -- 2183
	{ id = "assassin star", chance = 7082, minCount = 1, maxCount = 10 },  -- 7368
	{ id = "gold ingot", chance = 5361 },  -- 9971
	{ id = 7632, chance = 4597 },
	{ id = "seeds", chance = 3741 },  -- 7732
	{ id = "scythe", chance = 2987 },  -- 2550
	{ id = "terra legs", chance = 2634 },  -- 7885
	{ id = "garlic necklace", chance = 2010 },  -- 2199
	{ id = "skull staff", chance = 1796 },  -- 2436
	{ id = "gold ring", chance = 1424 },  -- 2179
	{ id = 6300, chance = 1349 },  -- death ring
	{ id = "terra mantle", chance = 1284 },  -- 7884
	{ id = "amulet of loss", chance = 158 },  -- 2173
	{ id = "golden sickle", chance = 140 },  -- 2418
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -490 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -220, maxDamage = -405, range = 7, radius = 1, shootEffect = CONST_ANI_POISON, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -65, maxDamage = -135, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "blightwalker curse", interval = 2000, chance = 15, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -300, range = 7, shootEffect = CONST_ANI_POISON, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 50,
	armor = 63,
	mitigation = 1.18,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = -30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
