-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Prince_Drazzak
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Prince_Drazzak
---


local mType = Game.createMonsterType("Prince Drazzak")
local monster = {}

monster.description = "Prince Drazzak"
monster.experience = 210000
monster.outfit = {
	lookType = 12,
	lookHead = 77,
	lookBody = 78,
	lookLegs = 94,
	lookFeet = 55,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 330000
monster.maxHealth = 330000
monster.race = "fire"
monster.corpse = 6068
monster.speed = 240
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 2000,
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
	{ text = "DIE!", yell = true },
	{ text = "All VOCATIONS must DIE!", yell = false },
	{ text = "GET OVER HERE!", yell = true },
	{ text = "CRUSH THEM ALL!", yell = true },
	{ text = "VARIPHOR WILL RULE!", yell = true },
	{ text = "They used you fools to escape and they left ME behind!!??", yell = false },
	{ text = "NOT EVEN AEONS OF IMPRISONMENT WILL STOP ME!", yell = true },
	{ text = "EVEN WITH ALL THAT TIME IN THE PRISON THAT WEAKENED ME, YOU ARE NO MATCH TO ME!", yell = true },
	{ text = "THEY WILL ALL PAY!", yell = true },
}

monster.loot = {
	{ id = "cluster of solace", chance = 100000, minCount = 1, maxCount = 2 },  -- 22396
	{ id = "unrealized dream", chance = 93750, minCount = 2, maxCount = 3 },  -- 22598
	{ id = "demonic essence", chance = 90625 },  -- 6500
	{ id = "platinum coin", chance = 87500, minCount = 10, maxCount = 20 },  -- 2152
	{ id = "green crystal fragment", chance = 43750, maxCount = 3 },  -- 18421
	{ id = "blue crystal shard", chance = 40625, maxCount = 5 },  -- 18413
	{ id = "green gem", chance = 40625 },  -- 2155
	{ id = 7632, chance = 34375 },  -- 7632
	{ id = "violet crystal shard", chance = 34375, maxCount = 5 },  -- 18414
	{ id = "great mana potion", chance = 31250, maxCount = 8 },  -- 7590
	{ id = "cyan crystal fragment", chance = 31250, maxCount = 3 },  -- 18419
	{ id = "dream warden mask", chance = 28125 },  -- 22610
	{ id = "great spirit potion", chance = 28125, maxCount = 8 },  -- 8472
	{ id = "lightning robe", chance = 25000 },  -- 7898
	{ id = "red crystal fragment", chance = 25000, maxCount = 3 },  -- 18420
	{ id = "demon horn", chance = 25000 },  -- 5954
	{ id = "gold coin", chance = 25000, maxCount = 100 },  -- 2148
	{ id = "green crystal shard", chance = 25000, maxCount = 5 },  -- 18415
	{ id = "ultimate health potion", chance = 21875, maxCount = 8 },  -- 8473
	{ id = "ring of healing", chance = 18750 },  -- 2214
	{ id = "steel boots", chance = 15625 },  -- 2645
	{ id = "lightning boots", chance = 15625 },  -- 7893
	{ id = "demonic tapestry", chance = 12500 },  -- 22612
	{ id = "eye pod", chance = 9375 },  -- 22613
	{ id = "noble axe", chance = 9375 },  -- 7456
	{ id = "skull helmet", chance = 9375 },  -- 5741
	{ id = "nightmare blade", chance = 9375 },  -- 7418
	{ id = "nightmare hook", chance = 9375 },  -- 22616
	{ id = "psychedelic tapestry", chance = 6250 },  -- 22611
	{ id = "runed sword", chance = 6250 },  -- 7417
	{ id = "abyss hammer", chance = 3125 },  -- 7414
	{ id = "crystalline armor", chance = 3125 },  -- 8878
	{ id = 2136, chance = 3125 },  -- demonbone amulet
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 190, attack = 100 },
	{ name = "combat", interval = 2000, chance = 18, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -3000, length = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 55,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 1500, maxDamage = 3000, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 35 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 35 },
	{ type = COMBAT_EARTHDAMAGE, percent = 35 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 35 },
	{ type = COMBAT_HOLYDAMAGE, percent = 35 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)