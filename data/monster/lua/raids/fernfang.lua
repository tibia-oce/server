-- Version: 7.5
-- Monster: https://tibia.fandom.com/wiki/Fernfang
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Fernfang
---


local mType = Game.createMonsterType("Fernfang")
local monster = {}

monster.description = "Fernfang"
monster.experience = 600
monster.outfit = {
	lookType = 206,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 400
monster.maxHealth = 400
monster.race = "blood"
monster.corpse = 18285
monster.speed = 120
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 50,
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
	targetDistance = 4,
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

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "War Wolf", chance = 13, interval = 1000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You desecrated this place!", yell = false },
	{ text = "Yoooohuuuu!", yell = false },
	{ text = "I will cleanse this isle!", yell = false },
	{ text = "Grrrrrrr", yell = false },
}

monster.loot = {
	{ id = "book of prayers", chance = 100000 },  -- 10563
	{ id = "gold coin", chance = 100000, minCount = 4, maxCount = 99 },  -- 2148
	{ id = "platinum coin", chance = 97826, minCount = 1, maxCount = 3 },  -- 2152
	{ id = "star herb", chance = 91304 },  -- 2800
	{ id = "rope belt", chance = 56522 },  -- 12448
	{ id = "power ring", chance = 45652 },  -- 2166
	{ id = "yellow gem", chance = 45652 },  -- 2154
	{ id = "safety pin", chance = 41304 },  -- 12449
	{ id = "blank rune", chance = 17391 },  -- 2260
	{ id = "bread", chance = 13043 },  -- 2689
	{ id = "green tunic", chance = 13043 },  -- 2652
	{ id = "strong mana potion", chance = 13043 },  -- 7589
	{ id = "brown flask", chance = 10870 },  -- 2015
	{ id = 2044, chance = 10870 },  -- lamp
	{ id = 2401, chance = 10870 },  -- staff
	{ id = "wolf tooth chain", chance = 8696 },  -- 2129
	{ id = "sling herb", chance = 6522 },  -- 2802
	{ id = "wooden whistle", chance = 6522 },  -- 5786
	{ id = "life crystal", chance = 2174 },  -- 2177
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -50 },
	{ name = "combat", interval = 1000, chance = 13, type = COMBAT_HOLYDAMAGE, minDamage = -65, maxDamage = -180, range = 7, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYDAMAGE, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -20, maxDamage = -45, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 15,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 10, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 7, effect = CONST_ME_MAGIC_RED, speed = 240},
	{ name = "outfit", interval = 1000, chance = 5, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 14000, outfitMonster = "War Wolf" },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 70 },
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