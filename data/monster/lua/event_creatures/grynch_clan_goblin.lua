-- Version: 7.9
-- Monster: https://tibia.fandom.com/wiki/Grynch_Clan_Goblin
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Grynch_Clan_Goblin
---


local mType = Game.createMonsterType("Grynch Clan Goblin")
local monster = {}

monster.description = "a grynch clan goblin"
monster.experience = 4
monster.outfit = {
	lookType = 61,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 80
monster.maxHealth = 80
monster.race = "blood"
monster.corpse = 6002
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 0,
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
	hostile = false,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 0,
	targetDistance = 11,
	runHealth = 80,
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
	{ text = "T'was not me hand in your pocket!", yell = false },
	{ text = "Look! Cool stuff in house. Let's get it!", yell = false },
	{ text = "Uhh! Nobody home! <chuckle>", yell = false },
	{ text = "Me just borrowed it!", yell = false },
	{ text = "Me no steal! Me found it!", yell = false },
	{ text = "Me had it for five minutes. It's family heirloom now!", yell = false },
	{ text = "Nice human won't hurt little, good goblin?", yell = false },
	{ text = "Gimmegimme!", yell = false },
	{ text = "Invite me in you lovely house plx!", yell = false },
	{ text = "Other Goblin stole it!", yell = false },
	{ text = "All presents mine!", yell = false },
	{ text = "Me got ugly ones purse", yell = false },
	{ text = "Free itans plz!", yell = false },
	{ text = "Not me! Not me!", yell = false },
	{ text = "Guys, help me here! Guys? Guys???", yell = false },
	{ text = "That only much dust in me pocket! Honest!", yell = false },
	{ text = "Can me have your stuff?", yell = false },
	{ text = "Halp, Big dumb one is after me!", yell = false },
	{ text = "Uh, So many shiny things!", yell = false },
	{ text = "Utani hur hur hur!", yell = false },
	{ text = "Mee? Stealing? Never!!!", yell = false },
	{ text = "Oh what fun it is to steal a one-horse open sleigh!", yell = false },
	{ text = "Must have it! Must have it!", yell = false },
	{ text = "Where me put me lockpick?", yell = false },
	{ text = "Catch me if you can!", yell = false },
}

monster.loot = {
	{ id = 2639, chance = 4000 }, -- picture
	{ id = 2950, chance = 5000 }, -- lute
	{ id = 2983, chance = 500 }, -- flower bowl
	{ id = "snowball", chance = 7000, maxCount = 5 }, -- snowball
	{ id = "piggy bank", chance = 1000 },
	{ id = "gold coin", chance = 22500, maxCount = 22 },
	{ id = "scarab coin", chance = 500, maxCount = 2 },
	{ id = 3047, chance = 4000 }, -- magic light wand
	{ id = "blank rune", chance = 5000 },
	{ id = "witchesbroom", chance = 1500 }, -- witchesbroom
	{ id = "mirror", chance = 1000 }, -- mirror
	{ id = "scarf", chance = 4000 },
	{ id = "red apple", chance = 700, maxCount = 3 },
	{ id = "orange", chance = 7000, maxCount = 3 },
	{ id = 2679, chance = 7000, maxCount = 4}, -- "cherry"
	{ id = "cookie", chance = 7000, maxCount = 5 },
	{ id = "candy cane", chance = 5000, maxCount = 3 },
	{ id = 3606, chance = 5000, maxCount = 2 }, -- egg
	{ id = "explorer brooch", chance = 4000 },
	{ id = "orichalcum pearl", chance = 500, maxCount = 2 },
	{ id = 5792, chance = 1000 }, -- die
	{ id = "chicken feather", chance = 4000, maxCount = 5 },
	{ id = "bat wing", chance = 4000, maxCount = 3 },
	{ id = "honeycomb", chance = 4000 },
	{ id = "lump of cake dough", chance = 7000, maxCount = 3 },
	{ id = "valentine's cake", chance = 1500 },
	{ id = "christmas present bag", chance = 7000 },
	{ id = "gingerbreadman", chance = 4000, maxCount = 2 },
	{ id = "walnut", chance = 3500, maxCount = 5 },
	{ id = "peanut", chance = 3500, maxCount = 100 },
}

monster.attacks = {}

monster.defenses = {
	defense = 12,
	armor = 5,
	mitigation = 0.25,
	{ name = "speed", interval = 1000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 200},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)