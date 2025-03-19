-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Deepling_Scout
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Deepling_Scout
---


local mType = Game.createMonsterType("Deepling Scout")
local monster = {}

monster.description = "a deepling scout"
monster.experience = 160
monster.outfit = {
	lookType = 413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 240
monster.maxHealth = 240
monster.race = "blood"
monster.corpse = 12684
monster.speed = 65
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 50,
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
	{ text = "Njaaarh!!", yell = false },
	{ text = "Begjone, intrjuder!!", yell = false },
	{ text = "Djon't djare stjare injo the eyes of the djeep!", yell = false },
	{ text = "Ljeave this sjacred pljace while you cjan", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 75936, minCount = 1, maxCount = 50 },  -- 2148
	{ id = "hunting spear", chance = 14999, minCount = 1, maxCount = 3 },  -- 3965
	{ id = "life ring", chance = 2025 },  -- 2168
	{ id = "rusty armor", chance = 958 },  -- todo: rusted armor does not exist in items.xml
	{ id = "heavy trident", chance = 485 },  -- 13838
	{ id = "eye of a deepling", chance = 302 },  -- 13870
	{ id = "fish fin", chance = 296 },  -- 5895
	{ id = "small emerald", chance = 122 },  -- 2149
	{ id = "flask of rust remover", chance = 113 },  -- 9930
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -105, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_DROWNDAMAGE, minDamage = 0, maxDamage = -110, range = 7, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.56,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)