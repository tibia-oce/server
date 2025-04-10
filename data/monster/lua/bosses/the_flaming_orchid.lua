-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/The_Flaming_Orchid
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:The_Flaming_Orchid
---


local mType = Game.createMonsterType("The Flaming Orchid")
local monster = {}

monster.description = "a flaming orchid"
monster.experience = 8500
monster.outfit = {
	lookType = 150,
	lookHead = 114,
	lookBody = 94,
	lookLegs = 78,
	lookFeet = 79,
	lookAddons = 1,
	lookMount = 0,
}

monster.health = 4000
monster.maxHealth = 4000
monster.race = "blood"
monster.corpse = 21987 -- review later
monster.speed = 210
monster.manaCost = 0

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"killingLibrary",
-- }

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
	interval = 2000,
	chance = 7,
	{ text = "I will end your torment. Do not run, little mortal.", yell = true },
	{ text = "*SNIFF* *SNIFF* BLOOD! I CAN SMELL YOU, MORTAL!!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 57, maxCount = 246 },  -- 2148
	{ id = "golden lotus brooch", chance = 100000 },  -- 24630
	{ id = "peacock feather fan", chance = 100000 },  -- 24631
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 10 },  -- 2152
	{ id = "assassin star", chance = 49057, minCount = 1, maxCount = 15 },  -- 7368
	{ id = "concentrated demonic blood", chance = 37736 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "small amethyst", chance = 28302, minCount = 1, maxCount = 3 },  -- 2150
	{ id = "demonic essence", chance = 26415 },  -- 6500
	{ id = "soul orb", chance = 20755 },  -- 5944
	{ id = "ultimate health potion", chance = 20755, minCount = 1, maxCount = 5 },  -- 8473
	{ id = 2124, chance = 16981 },  -- crystal ring
	{ id = "great mana potion", chance = 16981, minCount = 1, maxCount = 5 },  -- 7590
	{ id = "great spirit potion", chance = 9434, minCount = 1, maxCount = 5 },  -- 8472
	{ id = "moonlight rod", chance = 9434 },  -- 2186
	{ id = "red gem", chance = 9434 },  -- 2156
	{ id = "gold ingot", chance = 3774 },  -- 9971
	{ id = "green gem", chance = 3774 },  -- 2155
	{ id = "oriental shoes", chance = 3774 },  -- 24637
	{ id = "assassin dagger", chance = 1887 },  -- 7404
	{ id = 6300, chance = 1887 },  -- death ring
	{ id = "necrotic rod", chance = 1887 },  -- 2185
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -25 },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -700, range = 7, effect = CONST_ANI_DEATH, target = true },
	{ name = "ignite", interval = 2000, chance = 20, range = 7, radius = 1, target = true, shootEffect = CONST_ANI_FIRE },
	{ name = "big death wave", interval = 4000, chance = 18, minDamage = 0, maxDamage = -500 }, -- review later
	{ name = "aggressivelavawave", interval = 5000, chance = 19, minDamage = 0, maxDamage = -200 }, -- review later
	{ name = "combat", interval = 6000, chance = 20, type = COMBAT_FIREDAMAGE, range = 5, radius = 7, target = true, minDamage = -100, maxDamage = -250, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 55,
	armor = 55,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 280, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, areaEffect = CONST_ME_MAGIC_RED , speed = 420},
	{ name = "invisible", interval = 1000, chance = 100, duration = 10000, areaEffect = CONST_ME_MAGIC_BLUE },
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