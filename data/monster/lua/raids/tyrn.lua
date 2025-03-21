-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/Tyrn
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Tyrn
---


local mType = Game.createMonsterType("Tyrn")
local monster = {}

monster.description = "Tyrn"
monster.experience = 6900
monster.outfit = {
	lookType = 562,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 12000
monster.maxHealth = 12000
monster.race = "blood"
monster.corpse = 18970
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "GRRR", yell = true },
	{ text = "GRROARR", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, maxCount = 50 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 5, maxCount = 8 },  -- 2152
	{ id = "wyrm scale", chance = 100000 },  -- 10582
	{ id = "dragon ham", chance = 66667 },  -- 2672
	{ id = "strong mana potion", chance = 66667, maxCount = 5 },  -- 7589
	{ id = "sudden death rune", chance = 66667, maxCount = 5 },  -- 2268
	{ id = "assassin star", chance = 33333, maxCount = 5 },  -- 7368
	{ id = "silver raid token", chance = 33333 },  -- 21400
	{ id = "small emerald", chance = 33333, maxCount = 5 },  -- 2149
	{ id = "small ruby", chance = 33333, maxCount = 5 },  -- 2147
	{ id = "small topaz", chance = 33333, maxCount = 5 },  -- 9970
	{ id = "strong health potion", chance = 33333, maxCount = 5 },  -- 7588
	{ id = "yellow gem", chance = 33333 },  -- 2154
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 70, attack = 130 },
	{ name = "drunk", interval = 2000, chance = 8, radius = 8, effect = CONST_ME_SOUND_YELLOW, target = false, duration = 25000 },
	{ name = "combat", interval = 2000, chance = 33, type = COMBAT_ENERGYDAMAGE, minDamage = -100, maxDamage = -190, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYAREA, target = true },
	{ name = "combat", interval = 2000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -300, range = 7, radius = 4, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONHIT, target = true },
	{ name = "tyrn electrify", interval = 2000, chance = 11, target = false },
	{ name = "tyrn skill reducer", interval = 2000, chance = 14, target = false },
}

monster.defenses = {
	defense = 68,
	armor = 58,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 33, type = COMBAT_HEALING, minDamage = 200, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 11, effect = CONST_ME_ENERGYHIT },
	{ name = "tyrn heal", interval = 1000, chance = 100, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
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