-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Glooth_Bomb
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Glooth_Bomb
---


local mType = Game.createMonsterType("Glooth Bomb")
local monster = {}

monster.description = "a glooth bomb"
monster.experience = 2600
monster.outfit = {
	lookType = 680,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 250000
monster.maxHealth = 250000
monster.race = "blood"
monster.corpse = 21887
monster.speed = 40
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 3,
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
}

monster.loot = {
	{ id = "gold coin", chance = 62500, minCount = 4, maxCount = 86 },  -- 2148
	{ id = "great health potion", chance = 37500, minCount = 6, maxCount = 13 },  -- 7591
	{ id = "great mana potion", chance = 37500, minCount = 10, maxCount = 13 },  -- 7590
	{ id = "great spirit potion", chance = 37500, minCount = 4, maxCount = 11 },  -- 8472
	{ id = "platinum coin", chance = 37500, minCount = 22, maxCount = 27 },  -- 2152
	{ id = "moohtant horn", chance = 31250, maxCount = 2 },  -- 23571
	{ id = "small ruby", chance = 18750 },  -- 2147
	{ id = "yellow gem", chance = 12500 },  -- 2154
	{ id = "red piece of cloth", chance = 6250 },  -- 5911
	{ id = "ring of healing", chance = 6250 },  -- 2214
	{ id = "small diamond", chance = 6250, maxCount = 5 },  -- 2145
	{ id = "small topaz", chance = 6250, maxCount = 3 },  -- 9970
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 110, attack = 50 },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -230, length = 3, spread = 0, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -200, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 2000, chance = 19, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -225, radius = 5, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -150, maxDamage = -235, range = 7, radius = 4, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 45,
	armor = 40,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_HEALING, minDamage = 50, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 85 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 85 },
	{ type = COMBAT_EARTHDAMAGE, percent = 85 },
	{ type = COMBAT_FIREDAMAGE, percent = 85 },
	{ type = COMBAT_LIFEDRAIN, percent = 85 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 85 },
	{ type = COMBAT_ICEDAMAGE, percent = 85 },
	{ type = COMBAT_HOLYDAMAGE, percent = 85 },
	{ type = COMBAT_DEATHDAMAGE, percent = 85 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)