-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/War_Golem
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:War_Golem
---


local mType = Game.createMonsterType("War Golem")
local monster = {}

monster.description = "a war golem"
monster.experience = 2310
monster.outfit = {
	lookType = 326,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 4300
monster.maxHealth = 4300
monster.race = "venom"
monster.corpse = 9092
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 3,
	color = 180,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Azerus barada nikto!", yell = false },
	{ text = "Klonk klonk klonk", yell = false },
	{ text = "Engaging Enemy!", yell = false },
	{ text = "Threat level processed.", yell = false },
	{ text = "Charging weapon systems!", yell = false },
	{ text = "Auto repair in progress.", yell = false },
	{ text = "The battle is joined!", yell = false },
	{ text = "Termination initialized!", yell = false },
	{ text = "Rrrtttarrrttarrrtta", yell = false },
	{ text = "Eliminated", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99506, minCount = 1, maxCount = 264 },  -- 2148
	{ id = "ultimate health potion", chance = 10238 },  -- 8473
	{ id = "plate shield", chance = 8958 },  -- 2510
	{ id = "great mana potion", chance = 8877 },  -- 7590
	{ id = "war crystal", chance = 8288 },  -- 10571
	{ id = "morning star", chance = 7904 },  -- 2394
	{ id = "epee", chance = 6720 },  -- 2438
	{ id = "nail", chance = 5258, minCount = 1, maxCount = 5 },  -- 8309
	{ id = "battle shield", chance = 4885 },  -- 2513
	{ id = "two handed sword", chance = 4860 },  -- 2377
	{ id = "rusty armor", chance = 2934 },  -- todo: rusted armor does not exist in items.xml
	{ id = "iron ore", chance = 1769 },  -- 5880
	{ id = "dwarven ring", chance = 1195 },  -- 2213
	{ id = 9976, chance = 1094 },  -- crystal pedestal (red)
	{ id = "life crystal", chance = 1044 },  -- 2177
	{ id = "berserk potion", chance = 973 },  -- 7439
	{ id = "club ring", chance = 867 },  -- 2209
	{ id = "bonebreaker", chance = 736 },  -- 7428
	{ id = "steel boots", chance = 549 },  -- 2645
	{ id = "crystal of power", chance = 116 },  -- 9980
	{ id = "jade hammer", chance = 116 },  -- 7422
	{ id = "lightning boots", chance = 71 },  -- 7893
	{ id = "berserker", chance = 35 },  -- 7403
	{ id = "tin key", chance = 10 },  -- 13292
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -165, maxDamage = -220, range = 7, shootEffect = CONST_ANI_ENERGY, target = false },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, target = false, duration = 3000, outfitMonster = "skeleton" },
	{ name = "war golem electrify", interval = 2000, chance = 15, range = 1, target = false },
	{ name = "war golem skill reducer", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 35,
	mitigation = 1.18,
	{ name = "speed", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_RED, speed = 320},
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)