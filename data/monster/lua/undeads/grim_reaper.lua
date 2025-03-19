-- Version: 8.20
-- Monster: https://tibia.fandom.com/wiki/Grim_Reaper
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Grim_Reaper
---


local mType = Game.createMonsterType("Grim Reaper")
local monster = {}

monster.description = "a grim reaper"
monster.experience = 5500
monster.outfit = {
	lookType = 300,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3900
monster.maxHealth = 3900
monster.race = "undead"
monster.corpse = 8127
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
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
	staticAttackChance = 80,
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
	{ text = "Death!", yell = false },
	{ text = "Come a little closer!", yell = false },
	{ text = "The end is near!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 98844, minCount = 1, maxCount = 273 },  -- 2148
	{ id = "concentrated demonic blood", chance = 35095 },  -- todo: flask of demonic blood does not exist in items.xml
	{ id = "demonic essence", chance = 10835 },  -- 6500
	{ id = "ultimate health potion", chance = 10038 },  -- 8473
	{ id = "scythe", chance = 9775 },  -- 2550
	{ id = "great mana potion", chance = 9670 },  -- 7590
	{ id = "platinum coin", chance = 5029, minCount = 1, maxCount = 4 },  -- 2152
	{ id = 2162, chance = 4975 },  -- magic light wand
	{ id = "mystical hourglass", chance = 4971 },  -- 10577
	{ id = "dark shield", chance = 3133 },  -- 2521
	{ id = 9808, chance = 2917 },  -- rusty armor (todo: slightly rusted does not exist in items.xml)
	{ id = "orichalcum pearl", chance = 1425, minCount = 1, maxCount = 4 },  -- 5022
	{ id = "underworld rod", chance = 908 },  -- 8910
	{ id = "nightmare blade", chance = 638 },  -- 7418
	{ id = "glacier kilt", chance = 302 },  -- 7896
	{ id = "skullcracker armor", chance = 260 },  -- 8889
	{ id = 6300, chance = 254 },  -- death ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -320 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -165, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -350, maxDamage = -720, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -300, length = 7, spread = 0, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -225, maxDamage = -275, radius = 4, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 30,
	mitigation = 0.64,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 130, maxDamage = 205, target = false },
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 320},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 65 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
