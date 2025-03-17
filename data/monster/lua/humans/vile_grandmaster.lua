-- Version: 10.80
-- Monster: https://tibia.fandom.com/wiki/Vile_Grandmaster
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Vile_Grandmaster
---


local mType = Game.createMonsterType("Vile Grandmaster")
local monster = {}

monster.description = "a vile grandmaster"
monster.experience = 1500
monster.outfit = {
	lookType = 268,
	lookHead = 59,
	lookBody = 19,
	lookLegs = 95,
	lookFeet = 94,
	lookAddons = 1,
	lookMount = 0,
}


monster.health = 1700
monster.maxHealth = 1700
monster.race = "blood"
monster.corpse = 22023
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Is that the best, you can throw at me?", yell = false },
	{ text = "I've seen orcs tougher than you!", yell = false },
	{ text = "I will end this now!", yell = false },
	{ text = "Your gods won't help you!", yell = false },
	{ text = "You'll make a fine trophy!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99943, minCount = 1, maxCount = 173 },  -- 2148
	{ id = "platinum coin", chance = 73678, minCount = 1, maxCount = 2 },  -- 2152
	{ id = "meat", chance = 9634 },  -- 2666
	{ id = "scroll of heroic deeds", chance = 7868 },  -- 12466
	{ id = "great health potion", chance = 7008 },  -- 7591
	{ id = "wedding ring", chance = 5173 },  -- 2121
	{ id = "small ruby", chance = 3533 },  -- 2147
	{ id = "small sapphire", chance = 3533 },  -- 2146
	{ id = "small notebook", chance = 2397 },  -- 12406
	{ id = "red piece of cloth", chance = 2202 },  -- 5911
	{ id = "war hammer", chance = 2133 },  -- 2391
	{ id = "crown armor", chance = 1170 },  -- 2487
	{ id = "fire sword", chance = 872 },  -- 2392
	{ id = "crown legs", chance = 780 },  -- 2488
	{ id = "crown helmet", chance = 619 },  -- 2491
	{ id = "platinum amulet", chance = 390 },  -- 2171
	{ id = "crown shield", chance = 298 },  -- 2519
	{ id = "piggy bank", chance = 149 },  -- 2114
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 10, maxDamage = -260 },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 20, minDamage = -150, maxDamage = -225, radius = 4, shootEffect = CONST_ANI_THROWINGKNIFE, effect = CONST_ME_DRAWBLOOD, target = true },
}

monster.defenses = {
	defense = 50,
	armor = 40,
	mitigation = 1.48,
	{ name = "combat", interval = 4000, chance = 15, type = COMBAT_HEALING, minDamage = 220, maxDamage = 280, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
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