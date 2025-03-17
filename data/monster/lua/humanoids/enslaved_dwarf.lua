-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Enslaved_Dwarf
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Enslaved_Dwarf
---


local mType = Game.createMonsterType("Enslaved Dwarf")
local monster = {}

monster.description = "an enslaved dwarf"
monster.experience = 2700
monster.outfit = {
	lookType = 494,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3800
monster.maxHealth = 3800
monster.race = "blood"
monster.corpse = 16063
monster.speed = 135
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
	staticAttackChance = 70,
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
	{ text = "Bark!", yell = false },
	{ text = "Blood!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 2, maxCount = 149 },  -- 2148
	{ id = "platinum coin", chance = 100000, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "brown mushroom", chance = 14816, minCount = 1, maxCount = 2 },  -- 2789
	{ id = "small amethyst", chance = 10540, minCount = 1, maxCount = 2 },  -- 2150
	{ id = "iron ore", chance = 10514 },  -- 5880
	{ id = "small emerald", chance = 9841, minCount = 1, maxCount = 2 },  -- 2149
	{ id = "great mana potion", chance = 5969 },  -- 7590
	{ id = "great health potion", chance = 5916 },  -- 7591
	{ id = "shiny stone", chance = 5432 },  -- 11227
	{ id = "drill bolt", chance = 5109, minCount = 1, maxCount = 5 },  -- 18436
	{ id = "brown crystal splinter", chance = 4732, minCount = 1, maxCount = 2 },  -- 18417
	{ id = "war hammer", chance = 3845 },  -- 2391
	{ id = "red crystal fragment", chance = 3711 },  -- 18420
	{ id = "ancient shield", chance = 3254 },  -- 2532
	{ id = "green crystal splinter", chance = 3227 },  -- 18416
	{ id = "guardian shield", chance = 2581 },  -- 2515
	{ id = "green crystal shard", chance = 1990 },  -- 18415
	{ id = "axe ring", chance = 1963 },  -- 2208
	{ id = "glorious axe", chance = 1694 },  -- 7454
	{ id = 13757, chance = 1237 },  -- coal
	{ id = "titan axe", chance = 1076 },  -- 7413
	{ id = "tower shield", chance = 457 },  -- 2528
	{ id = "sapphire hammer", chance = 350 },  -- 7437
	{ id = "warrior helmet", chance = 350 },  -- 2475
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -501 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -340, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -250, range = 7, radius = 3, shootEffect = CONST_ANI_EXPLOSION, effect = CONST_ME_EXPLOSIONHIT, target = true },
	{ name = "drunk", interval = 2000, chance = 20, radius = 5, effect = CONST_ME_BLOCKHIT, target = false, duration = 6000 },
	{ name = "enslaved dwarf skill reducer 1", interval = 2000, chance = 5, target = false },
	{ name = "enslaved dwarf skill reducer 2", interval = 2000, chance = 5, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 60,
	mitigation = 1.88,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 396, maxDamage = 478, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -3 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)