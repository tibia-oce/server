-- Version: 9.60
-- Monster: https://tibia.fandom.com/wiki/Armadile
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Armadile
---


local mType = Game.createMonsterType("Armadile")
local monster = {}

monster.description = "an armadile"
monster.experience = 3200
monster.outfit = {
	lookType = 487,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 3800
monster.maxHealth = 3800
monster.race = "undead"
monster.corpse = 18378
monster.speed = 220
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
	canPushItems = false,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Creak!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 3, maxCount = 199 },  -- 2148
	{ id = "platinum coin", chance = 95365, minCount = 1, maxCount = 7 },  -- 2152
	{ id = "great health potion", chance = 15426, minCount = 1, maxCount = 2 },  -- 7591
	{ id = "strong health potion", chance = 15223, minCount = 1, maxCount = 2 },  -- 7588
	{ id = "great mana potion", chance = 15088, minCount = 1, maxCount = 2 },  -- 7590
	{ id = "mana potion", chance = 14885, minCount = 1, maxCount = 3 },  -- 7620
	{ id = "strong mana potion", chance = 14817, minCount = 1, maxCount = 2 },  -- 7589
	{ id = "crystalline spikes", chance = 14547 },  -- 18432
	{ id = "battle stone", chance = 11773 },  -- 12403
	{ id = "envenomed arrow", chance = 10859, minCount = 1, maxCount = 10 },  -- 18437
	{ id = "drill bolt", chance = 7240, minCount = 1, maxCount = 5 },  -- 18436
	{ id = 13757, chance = 6664 },  -- coal
	{ id = "green crystal fragment", chance = 5886, minCount = 1, maxCount = 2 },  -- 18421
	{ id = "green crystal splinter", chance = 3857, minCount = 1, maxCount = 2 },  -- 18416
	{ id = "terra boots", chance = 2470 },  -- 7886
	{ id = "titan axe", chance = 1725 },  -- 7413
	{ id = 2169, chance = 1184 },  -- time ring
	{ id = "bonebreaker", chance = 1015 },  -- 7428
	{ id = "tower shield", chance = 541 },  -- 2528
	{ id = "crystalline armor", chance = 338 },  -- 8878
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -150 },
	{ name = "drunk", interval = 2000, chance = 10, radius = 4, effect = CONST_ME_FIREAREA, target = true, duration = 5000 },
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 15, minDamage = -200, maxDamage = -400, radius = 4, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 66,
	mitigation = 1.96,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 45 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)