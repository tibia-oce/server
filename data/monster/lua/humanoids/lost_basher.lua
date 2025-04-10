-- Version: 9.80
-- Monster: https://tibia.fandom.com/wiki/Lost_Basher
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Lost_Basher
---


local mType = Game.createMonsterType("Lost Basher")
local monster = {}

monster.description = "a lost basher"
monster.experience = 2300
monster.outfit = {
	lookType = 538,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 2600
monster.maxHealth = 2600
monster.race = "blood"
monster.corpse = 19963
monster.speed = 130
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
	staticAttackChance = 80,
	targetDistance = 1,
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
	{ text = "Yhouuuu!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 99992, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 69932 },  -- 2152
	{ id = 13757, chance = 20236 },  -- coal
	{ id = "bloody dwarven beard", chance = 17408 },  -- 20107
	{ id = "lost basher's spike", chance = 15046 },  -- 20106
	{ id = "brown mushroom", chance = 14925, minCount = 1, maxCount = 2 },  -- 2789
	{ id = "great mana potion", chance = 12202 },  -- 7590
	{ id = "red hair dye", chance = 11924 },  -- 20135
	{ id = "wimp tooth chain", chance = 11856 },  -- 20127
	{ id = "basalt figurine", chance = 10223 },  -- 20137
	{ id = "small topaz", chance = 10111 },  -- 9970
	{ id = "bonecarving knife", chance = 10073 },  -- 20110
	{ id = "ultimate health potion", chance = 9682 },  -- 8473
	{ id = "basalt fetish", chance = 8207 },  -- 20136
	{ id = "bone fetish", chance = 7432 },  -- 20111
	{ id = "iron ore", chance = 4935 },  -- 5880
	{ id = "piggy bank", chance = 3949 },  -- 2114
	{ id = "black shield", chance = 3415 },  -- 2529
	{ id = "dwarven ring", chance = 2415 },  -- 2213
	{ id = "pair of iron fists", chance = 1565 },  -- 20108
	{ id = "blue crystal shard", chance = 1339 },  -- 18413
	{ id = "buckle", chance = 1128 },  -- 20109
	{ id = "knight axe", chance = 880 },  -- 2430
	{ id = "terra boots", chance = 790 },  -- 7886
	{ id = "knight legs", chance = 572 },  -- 2477
	{ id = "spiked squelcher", chance = 376 },  -- 7452
	{ id = "fire axe", chance = 308 },  -- 2432
	{ id = "chaos mace", chance = 196 },  -- 7427
	{ id = "war axe", chance = 60 },  -- 2454
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -351 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 0, maxDamage = -220, range = 7, radius = 3, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "drunk", interval = 2000, chance = 15, radius = 4, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_SOUND_RED, target = true, duration = 6000 },
	{ name = "speed", interval = 2000, chance = 15, speed = -650, radius = 2, effect = CONST_ME_ENERGYHIT, target = false, duration = 15000 },
}

monster.defenses = {
	defense = 30,
	armor = 57,
	mitigation = 1.62,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 250, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
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