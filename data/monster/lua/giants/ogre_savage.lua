-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Ogre_Savage
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ogre_Savage
---


local mType = Game.createMonsterType("Ogre Savage")
local monster = {}

monster.description = "an ogre savage"
monster.experience = 950
monster.outfit = {
	lookType = 858,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1400
monster.maxHealth = 1400
monster.race = "blood"
monster.corpse = 22147
monster.speed = 110
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
	{ text = "You tasty!", yell = false },
	{ text = "Must! Chop! Food! Raahh!", yell = false },
	{ text = "UGGA UGGA!!", yell = true },
}

monster.loot = {
	{ id = "gold coin", chance = 99443, minCount = 1, maxCount = 154 },  -- 2148
	{ id = "ogre ear stud", chance = 19618 },  -- 24844
	{ id = "ogre nose ring", chance = 17391 },  -- 24845
	{ id = "strong health potion", chance = 15350 },  -- 7588
	{ id = "skull fetish", chance = 9544 },  -- 24847
	{ id = "cookie", chance = 8271, minCount = 1, maxCount = 5 },  -- 2687
	{ id = "mysterious fetish", chance = 6416 },  -- 2194
	{ id = "jalapeno pepper", chance = 3844, minCount = 1, maxCount = 2 },  -- 8844
	{ id = "small ruby", chance = 2996, minCount = 1, maxCount = 3 },  -- 2147
	{ id = "small topaz", chance = 2996, minCount = 1, maxCount = 2 },  -- 9970
	{ id = "onyx chip", chance = 2969, minCount = 1, maxCount = 2 },  -- 24849
	{ id = "opal", chance = 2121, minCount = 1, maxCount = 2 },  -- 24850
	{ id = "war hammer", chance = 1326 },  -- 2391
	{ id = "ogre choppa", chance = 1060 },  -- 24828
	{ id = "berserk potion", chance = 504 },  -- 7439
	{ id = "shamanic mask", chance = 398 },  -- 24848
	{ id = "dreaded cleaver", chance = 27 },  -- 7419
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -269, condition = { type = CONDITION_FIRE, totalDamage = 6, interval = 9000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -70, maxDamage = -180, range = 7, shootEffect = CONST_ANI_POISON, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 32,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 80, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)