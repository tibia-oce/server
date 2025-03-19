-- Version: 9.10
-- Monster: https://tibia.fandom.com/wiki/Groam
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Groam
---


local mType = Game.createMonsterType("Groam")
local monster = {}

monster.description = "Groam"
monster.experience = 180
monster.outfit = {
	lookType = 413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 736,
	bossRace = RARITY_NEMESIS,
}

monster.health = 400
monster.maxHealth = 400
monster.race = "blood"
monster.corpse = 12684
monster.speed = 280
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50,
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
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 60,
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
	{ text = "I sjaw the eyes of the djeep!", yell = false },
	{ text = "I mjake sjure yjou wjill njot sjufer the sjame fjate Ij djid!", yell = false },
	{ text = "Yjou, intrjuder!!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 86957, minCount = 5, maxCount = 87 },  -- 2148
	{ id = "hunting spear", chance = 26087, minCount = 1, maxCount = 5 },  -- 3965
	{ id = "life ring", chance = 26087 },  -- 2168
	{ id = "fish fin", chance = 8696 },  -- 5895
	{ id = "rusty armor", chance = 8696 },  -- todo: rusted armor does not exist in items.xml
	{ id = "flask of rust remover", chance = 4348 },  -- 9930
	{ id = "heavy trident", chance = 4348 },  -- 13838
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 34, attack = 45 },
	{ name = "combat", interval = 1000, chance = 11, type = COMBAT_DROWNDAMAGE, minDamage = -15, maxDamage = -100, range = 5, shootEffect = CONST_ANI_SPEAR, effect = CONST_ME_LOSEENERGY, target = true },
}

monster.defenses = {
	defense = 20,
	armor = 12,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
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