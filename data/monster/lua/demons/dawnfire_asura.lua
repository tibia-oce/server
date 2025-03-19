-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Dawnfire_Asura
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Dawnfire_Asura
---


local mType = Game.createMonsterType("Dawnfire Asura")
local monster = {}

monster.description = "a dawnfire asura"
monster.experience = 4100
monster.outfit = {
	lookType = 150,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 78,
	lookFeet = 79,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 2900
monster.maxHealth = 2900
monster.race = "blood"
monster.corpse = 21987
monster.speed = 140
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
	staticAttackChance = 80,
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
	{ text = "May the flames consume you!", yell = false },
	{ text = "Encounter the flames of destiny!", yell = false },
	{ text = "Fire and destruction!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 9 },  -- 2152
	{ id = "concentrated demonic blood", chance = 30342 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "soul orb", chance = 19668 },  -- 5944
	{ id = "golden lotus brooch", chance = 17926 },  -- 24630
	{ id = "peacock feather fan", chance = 16841 },  -- 24631
	{ id = "demonic essence", chance = 15881 },  -- 6500
	{ id = "great mana potion", chance = 12114, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "small ruby", chance = 8316, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "small diamond", chance = 4925, minCount = 1, maxCount = 2 },  -- 2145
	{ id = "small topaz", chance = 4591, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "small amethyst", chance = 4528, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "small emerald", chance = 4518, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "red piece of cloth", chance = 2859 },  -- 5911
	{ id = "mystic turban", chance = 2848 },  -- 2663
	{ id = "wand of inferno", chance = 1638 },  -- 2187
	{ id = "mysterious fetish", chance = 1367 },  -- 2194
	{ id = "red gem", chance = 1346 },  -- 2156
	{ id = "focus cape", chance = 1336 },  -- 8871
	{ id = "magma coat", chance = 908 },  -- 7899
	{ id = "ruby necklace", chance = 897 },  -- 2133
	{ id = 6300, chance = 574 },  -- death ring
	{ id = "oriental shoes", chance = 396 },  -- 24637
	{ id = "blue gem", chance = 344 },  -- 2158
	{ id = "spellbook of mind control", chance = 250 },  -- 8902
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -269 },
	{ name = "combat", interval = 3700, chance = 17, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -300, length = 8, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "combat", interval = 3200, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -350, radius = 4, range = 5, target = true, effect = CONST_ME_MORTAREA },
	{ name = "combat", interval = 2700, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -95, maxDamage = -180, range = 3, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "speed", interval = 2000, chance = 20, speed = -800, radius = 1, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_SLEEP, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 55,
	armor = 48,
	mitigation = 1.46,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 280},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)