-- Version: 6.4
-- Monster: https://tibia.fandom.com/wiki/Hero
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Hero
---


local mType = Game.createMonsterType("Hero")
local monster = {}

monster.description = "a hero"
monster.experience = 1200
monster.outfit = {
	lookType = 73,
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
monster.corpse = 20415
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Let's have a fight!", yell = false },
	{ text = "I will sing a tune at your grave.", yell = false },
	{ text = "Have you seen princess Lumelia?", yell = false },
	{ text = "Welcome to my battleground!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 60386, minCount = 1, maxCount = 100 },  -- 2148
	{ id = 1949, chance = 45074 },  -- scroll
	{ id = 2544, chance = 26956, minCount = 1, maxCount = 13 },  -- arrow
	{ id = "red rose", chance = 20352 },  -- 2744
	{ id = "grapes", chance = 20178 },  -- 2681
	{ id = "bow", chance = 13022 },  -- 2456
	{ id = 7364, chance = 11513, minCount = 1, maxCount = 4 },  -- sniper arrow
	{ id = "meat", chance = 8573 },  -- 2666
	{ id = "green tunic", chance = 7953 },  -- 2652
	{ id = "wedding ring", chance = 5167 },  -- 2121
	{ id = "scroll of heroic deeds", chance = 5043 },  -- 12466
	{ id = 2120, chance = 2047 },  -- rope
	{ id = "red piece of cloth", chance = 2015 },  -- 5911
	{ id = "two handed sword", chance = 1588 },  -- 2377
	{ id = 2071, chance = 1581 },  -- lyre
	{ id = "scarf", chance = 1112 },  -- 2661
	{ id = "war hammer", chance = 955 },  -- 2391
	{ id = "small notebook", chance = 935 },  -- 12406
	{ id = "great health potion", chance = 748 },  -- 7591
	{ id = "crown armor", chance = 620 },  -- 2487
	{ id = "crown legs", chance = 591 },  -- 2488
	{ id = "might ring", chance = 512 },  -- 2164
	{ id = "fire sword", chance = 472 },  -- 2392
	{ id = "crown helmet", chance = 433 },  -- 2491
	{ id = "crown shield", chance = 197 },  -- 2519
	{ id = "piggy bank", chance = 79 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -240 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -120, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 35,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = -20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
