-- Version: 8.00
-- Monster: https://tibia.fandom.com/wiki/Yakchal
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Yakchal
---


local mType = Game.createMonsterType("Yakchal")
local monster = {}

monster.description = "Yakchal"
monster.experience = 4400
monster.outfit = {
	lookType = 149,
	lookHead = 9,
	lookBody = 0,
	lookLegs = 85,
	lookFeet = 85,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 5750
monster.maxHealth = 5750
monster.race = "blood"
monster.corpse = 20546
monster.speed = 110
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
	staticAttackChance = 50,
	targetDistance = 4,
	runHealth = 100,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Ice Golem", chance = 13, interval = 1000, count = 4 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "YOU BETTER DIE TO MY MINIONS BECAUSE YOU'LL WISH YOU DID IF I COME FOR YOU!", yell = true },
	{ text = "DESTROY THE INFIDELS", yell = true },
	{ text = "You are mine!", yell = false },
	{ text = "I will make you all pay!", yell = false },
	{ text = "No one will stop my plans!", yell = false },
	{ text = "You are responsible for this!", yell = false },
}

monster.loot = {
	{ id = "shard", chance = 100000 },  -- 7290
	{ id = "gold coin", chance = 98089, minCount = 1, maxCount = 283 },  -- 2148
	{ id = "blue piece of cloth", chance = 77070 },  -- 5912
	{ id = "mastermind potion", chance = 59873 },  -- 7440
	{ id = "gold ingot", chance = 36306 },  -- 9971
	{ id = "crystal sword", chance = 15924 },  -- 7449
	{ id = "glacier kilt", chance = 13376 },  -- 7896
	{ id = "glacier robe", chance = 12102 },  -- 7897
	{ id = "dragon necklace", chance = 10828 },  -- 2201
	{ id = "great mana potion", chance = 9554 },  -- 7590
	{ id = "skull staff", chance = 7006 },  -- 2436
	{ id = "life ring", chance = 5732 },  -- 2168
	{ id = "bullseye potion", chance = 5096 },  -- 7443
	{ id = "pair of earmuffs", chance = 5096 },  -- 7459
	{ id = "berserk potion", chance = 3822 },  -- 7439
	{ id = "queen's sceptre", chance = 3185 },  -- 7410
	{ id = "boots of haste", chance = 1274 },  -- 2195
	{ id = "green mushroom", chance = 637 },  -- 2796
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -389 },
	{ name = "combat", interval = 2000, chance = 18, type = COMBAT_ICEDAMAGE, minDamage = 0, maxDamage = -430, radius = 4, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEAREA, target = true },
	{ name = "combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -300, range = 7, radius = 3, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_HITAREA, target = true },
	{ name = "speed", interval = 2000, chance = 10, speed = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 20,
	armor = 15,
	mitigation = 1.74,
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)