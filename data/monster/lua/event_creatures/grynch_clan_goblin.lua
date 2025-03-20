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
	{ id = "gold coin", chance = 55275, minCount = 1, maxCount = 16 },  -- 2148
	{ id = "christmas present bag", chance = 30071 },  -- 6497
	{ id = "snowball", chance = 15117, minCount = 1, maxCount = 3 },  -- 2111
	{ id = "red apple", chance = 9921, minCount = 1, maxCount = 3 },  -- 2674
	{ id = "cookie", chance = 7921, minCount = 1, maxCount = 5 },  -- 2687
	{ id = "orange", chance = 5121, minCount = 1, maxCount = 2 },  -- 2675
	{ id = "lump of cake dough", chance = 4934 },  -- 6277
	{ id = "walnut", chance = 2003, minCount = 1, maxCount = 4 },  -- 7909
	{ id = "egg", chance = 1065, minCount = 1, maxCount = 2 },  -- 2695
	{ id = "candy cane", chance = 987, minCount = 1, maxCount = 3 },  -- 2688
	{ id = 3910, chance = 961 },  -- snowman package
	{ id = "peanut", chance = 937, minCount = 1, maxCount = 5 },  -- 7910
	{ id = "scarf", chance = 771 },  -- 2661
	{ id = "bat wing", chance = 603, minCount = 1, maxCount = 3 },  -- 5894
	{ id = "bottle", chance = 524 },  -- 2007
	{ id = "explorer brooch", chance = 512 },  -- 4873
	{ id = "gingerbreadman", chance = 416 },  -- 6501
	{ id = "broom", chance = 413 },  -- 2551
	{ id = "chicken feather", chance = 413, minCount = 1, maxCount = 3 },  -- 5890
	{ id = "honeycomb", chance = 352 },  -- 5902
	{ id = "cherry", chance = 309, minCount = 1, maxCount = 4 },  -- 2679
	{ id = 5792, chance = 125 },  -- die
	{ id = "watch", chance = 119 },  -- 2036
	{ id = "blank rune", chance = 114 },  -- 2260
	{ id = 2162, chance = 114 },  -- magic light wand
	{ id = "cream cake", chance = 108 },  -- 6394
	{ id = "picture", chance = 108 },  -- 1852
	{ id = 2102, chance = 105 },  -- flower bowl
	{ id = 2072, chance = 102 },  -- lute
	{ id = "valentine's cake", chance = 99 },  -- 6393
	{ id = "scarab coin", chance = 90 },  -- 2159
	{ id = "piggy bank", chance = 87 },  -- 2114
	{ id = "orichalcum pearl", chance = 84 },  -- 5022
	{ id = "mirror", chance = 76 },  -- 2560
	{ id = 2120, chance = 73 },  -- rope
	{ id = "small white pillow", chance = 73 },  -- 1684
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