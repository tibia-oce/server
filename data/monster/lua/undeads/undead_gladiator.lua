-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Undead_Gladiator
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Undead_Gladiator
---


local mType = Game.createMonsterType("Undead Gladiator")
local monster = {}

monster.description = "an undead gladiator"
monster.experience = 800
monster.outfit = {
	lookType = 306,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1000
monster.maxHealth = 1000
monster.race = "undead"
monster.corpse = 8909
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	canWalkOnFire = true,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Let's battle it out in a duel!", yell = false },
	{ text = "Bring it!", yell = false },
	{ text = "I'll fight here in eternity and beyond.", yell = false },
	{ text = "I will not give up!", yell = false },
	{ text = "Another foolish adventurer who tries to beat me.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 95312, minCount = 1, maxCount = 149 },  -- 2148
	{ id = "throwing star", chance = 14761, minCount = 1, maxCount = 18 },  -- 2399
	{ id = 2419, chance = 10754 },  -- scimitar
	{ id = "broken gladiator shield", chance = 5221 },  -- 10573
	{ id = "belted cape", chance = 5157 },  -- 8872
	{ id = "brass legs", chance = 4965 },  -- 2478
	{ id = "brass armor", chance = 4852 },  -- 2465
	{ id = "hunting spear", chance = 4575 },  -- 3965
	{ id = "plate armor", chance = 2259 },  -- 2463
	{ id = "plate legs", chance = 2230 },  -- 2647
	{ id = "two handed sword", chance = 1939 },  -- 2377
	{ id = "protection amulet", chance = 1932 },  -- 2200
	{ id = "dark helmet", chance = 1350 },  -- 2490
	{ id = "health potion", chance = 419 },  -- 7618
	{ id = "knight axe", chance = 256 },  -- 2430
	{ id = "crusader helmet", chance = 185 },  -- 2497
	{ id = "flask of warrior's sweat", chance = 178 },  -- 5885
	{ id = "stealth ring", chance = 50 },  -- 2165
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -250 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -135, range = 7, shootEffect = CONST_ANI_WHIRLWINDSWORD, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 35,
	mitigation = 1.54,
	{ name = "invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)