-- Version: 10.90
-- Monster: https://tibia.fandom.com/wiki/Ogre_Brute
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ogre_Brute
---


local mType = Game.createMonsterType("Ogre Brute")
local monster = {}

monster.description = "an ogre brute"
monster.experience = 800
monster.outfit = {
	lookType = 857,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1000
monster.maxHealth = 1000
monster.race = "blood"
monster.corpse = 22143
monster.speed = 102
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
	{ text = "You so juicy!", yell = false },
	{ text = "Smash you face in!!!", yell = false },
	{ text = "You stop! You lunch!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99651, minCount = 1, maxCount = 125 },  -- 2148
	{ id = "ogre ear stud", chance = 18823 },  -- 24844
	{ id = "meat", chance = 14725 },  -- 2666
	{ id = "ogre nose ring", chance = 14604 },  -- 24845
	{ id = "strong health potion", chance = 12280 },  -- 7588
	{ id = "small stone", chance = 5079, minCount = 1, maxCount = 5 },  -- 1294
	{ id = "battle stone", chance = 4743 },  -- 12403
	{ id = "cookie", chance = 3829, minCount = 1, maxCount = 5 },  -- 2687
	{ id = "skull fetish", chance = 3386 },  -- 24847
	{ id = "small ruby", chance = 2351, minCount = 1, maxCount = 2 },  -- 2147
	{ id = "club ring", chance = 2271 },  -- 2209
	{ id = "white pearl", chance = 2230 },  -- 2143
	{ id = "onyx chip", chance = 2002, minCount = 1, maxCount = 2 },  -- 24849
	{ id = "opal", chance = 1679, minCount = 1, maxCount = 2 },  -- 24850
	{ id = "power ring", chance = 1626 },  -- 2166
	{ id = "ogre klubba", chance = 954 },  -- 24827
	{ id = "pot", chance = 269 },  -- 2562
	{ id = "ancient stone", chance = 215 },  -- 10549
	{ id = 9820, chance = 215 },  -- rusty helmet
	{ id = "shamanic mask", chance = 148 },  -- 24848
	{ id = "bonebreaker", chance = 107 },  -- 7428
	{ id = "butcher's axe", chance = 13 },  -- 7412
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -269, condition = { type = CONDITION_FIRE, totalDamage = 6, interval = 9000 } },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -70, maxDamage = -180, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "drunk", interval = 2000, chance = 10, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_TELEPORT, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 41,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 80, maxDamage = 95, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)