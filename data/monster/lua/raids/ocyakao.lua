-- Version: 10.20
-- Monster: https://tibia.fandom.com/wiki/Ocyakao
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Ocyakao
---


local mType = Game.createMonsterType("Ocyakao")
local monster = {}

monster.description = "Ocyakao"
monster.experience = 490
monster.outfit = {
	lookType = 259,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 970,
	bossRace = RARITY_NEMESIS,
}

monster.health = 700
monster.maxHealth = 700
monster.race = "blood"
monster.corpse = 7320
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 60000,
	chance = 60,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
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
	{ text = "Chikuva!", yell = false },
	{ text = "Jinuma jamjam!", yell = false },
	{ text = "Grrrr! Kisavuta!", yell = false },
	{ text = "Suvituka siq chuqua!", yell = false },
	{ text = "Kiyosa sipaju!", yell = false },
	{ text = "Aiiee!", yell = false },
}

monster.loot = {
	{ id = 2667 , chance = 100000, maxCount = 5 },  -- fish
	{ id = "gold coin", chance = 100000, maxCount = 65 },  -- 2148
	{ id = "white pearl", chance = 100000 },  -- 2143
	{ id = "white piece of cloth", chance = 100000 },  -- 5909
	{ id = 7441, chance = 62500 },  -- ice cube
	{ id = "bone shield", chance = 37500 },  -- 2541
	{ id = "mace", chance = 37500 },  -- 2398
	{ id = "mammoth whopper", chance = 25000 },  -- 7381
	{ id = "northern pike", chance = 12500 },  -- 2669
	{ id = "green perch", chance = 12500 },  -- 7159
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 25, attack = 50 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 70, maxDamage = -185, range = 7, radius = 3, shootEffect = CONST_ANI_SMALLSTONE, effect = CONST_ME_HITAREA, target = true },
}

monster.defenses = {
	defense = 10,
	armor = 10,
	mitigation = 0.99,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)