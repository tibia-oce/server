-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Spectre
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Spectre
---


local mType = Game.createMonsterType("Spectre")
local monster = {}

monster.description = "a spectre"
monster.experience = 2100
monster.outfit = {
	lookType = 235,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1350
monster.maxHealth = 1350
monster.race = "undead"
monster.corpse = 6347
monster.speed = 140
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
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
	{ text = "Revenge ... is so ... sweet.", yell = false },
	{ text = "Life...force! Feed me your... lifeforce", yell = false },
	{ text = "Mor... tals!", yell = false },
	{ text = "Buuuuuh", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99686, minCount = 1, maxCount = 301 },  -- 2148
	{ id = "blank rune", chance = 30133, minCount = 1, maxCount = 2 },  -- 2260
	{ id = "wand of cosmic energy", chance = 9848 },  -- 2189
	{ id = 2071, chance = 9793 },  -- lyre
	{ id = "demonic essence", chance = 6152 },  -- 6500
	{ id = "soul orb", chance = 6026 },  -- 5944
	{ id = "white piece of cloth", chance = 3668 },  -- 5909
	{ id = "platinum coin", chance = 3497, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "shiny stone", chance = 958 },  -- 11227
	{ id = "great mana potion", chance = 936 },  -- 7590
	{ id = "silver brooch", chance = 821 },  -- 2134
	{ id = "relic sword", chance = 744 },  -- 7383
	{ id = 6300, chance = 292 },  -- death ring
	{ id = "stealth ring", chance = 215 },  -- 2165
	{ id = 2136, chance = 121 },  -- demonbone amulet
	{ id = "shadow sceptre", chance = 105 },  -- 7451
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -308, condition = { type = CONDITION_POISON, totalDamage = 300, interval = 4000 } },
	{ name = "drunk", interval = 2000, chance = 15, radius = 4, effect = CONST_ME_SOUND_PURPLE, target = false, duration = 6000 },
	{ name = "spectre drown", interval = 2000, chance = 15, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -400, range = 7, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -550, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 40,
	mitigation = 1.04,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 700, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 280},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 90 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -8 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -8 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 1 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)