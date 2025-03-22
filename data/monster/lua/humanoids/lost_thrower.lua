-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Lost_Thrower
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lost_Thrower
---


local mType = Game.createMonsterType("Lost Thrower")
local monster = {}

monster.description = "a lost thrower"
monster.experience = 1500
monster.outfit = {
	lookType = 539,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1700
monster.maxHealth = 1700
monster.race = "blood"
monster.corpse = 19998
monster.speed = 120
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
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 140 },  -- 2148
	{ id = "platinum coin", chance = 70238 },  -- 2152
	{ id = "broken throwing axe", chance = 15023 },  -- 20131
	{ id = "brown mushroom", chance = 14986, minCount = 1, maxCount = 2 },  -- 2789
	{ id = "mad froth", chance = 14426 },  -- 20134
	{ id = "great health potion", chance = 13932 },  -- 7591
	{ id = "great mana potion", chance = 13723 },  -- 7590
	{ id = "lost bracers", chance = 12394 },  -- 20133
	{ id = "red hair dye", chance = 12237 },  -- 20135
	{ id = 13757, chance = 11900 },  -- coal
	{ id = "bloody dwarven beard", chance = 11691 },  -- 20107
	{ id = "basalt figurine", chance = 8823 },  -- 20137
	{ id = "iron ore", chance = 8599 },  -- 5880
	{ id = "basalt fetish", chance = 7060 },  -- 20136
	{ id = "helmet of the lost", chance = 1576 },  -- 20132
	{ id = "buckle", chance = 762 },  -- 20109
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -301 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -250, range = 7, radius = 1, shootEffect = CONST_ANI_THROWINGSTAR, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, range = 7, radius = 2, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -300, range = 7, radius = 2, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_STUN, target = true },
	{ name = "drunk", interval = 2000, chance = 10, radius = 3, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_EXPLOSIONAREA, target = true, duration = 6000 },
}

monster.defenses = {
	defense = 30,
	armor = 50,
	mitigation = 1.40,
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_HEALING, minDamage = 100, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_TELEPORT },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -5 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)