-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/World_Devourer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:World_Devourer
---


local mType = Game.createMonsterType("World Devourer")
local monster = {}

monster.description = "World Devourer"
monster.experience = 77700
monster.outfit = {
	lookType = 875,
	lookHead = 82,
	lookBody = 79,
	lookLegs = 84,
	lookFeet = 94,
	lookAddons = 3,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 1228,
	bossRace = RARITY_NEMESIS,
}

monster.health = 25000
monster.maxHealth = 25000
monster.race = "venom"
monster.corpse = 0
monster.speed = 225
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
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true}

monster.events = {
	"HeartBossDeath",
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "energy bar", chance = 0, maxCount = 5 },  -- 26191
	{ id = "energy drink", chance = 0, maxCount = 5 },  -- 26201
	{ id = "gold coin", chance = 0, minCount = 100, maxCount = 200 },  -- 2148
	{ id = "gold token", chance = 0, minCount = 12, maxCount = 17 },  -- 25377
	{ id = "mysterious remains", chance = 0 },  -- 26165
	{ id = "platinum coin", chance = 0, minCount = 5, maxCount = 35 },  -- 2152
	{ id = "crystallized anger", chance = 0 },  -- 26163
	{ id = "energy vein", chance = 0 },  -- 26164
	{ id = 26133, chance = 0 },  -- void boots
	{ id = "green crystal shard", chance = 0, maxCount = 3 },  -- 18415
	{ id = "blue crystal shard", chance = 0, maxCount = 3 },  -- 18413
	{ id = 26130, chance = 0 },  -- tiara of power
	{ id = "violet crystal shard", chance = 0, maxCount = 3 },  -- 18414
	{ id = "great mana potion", chance = 0, minCount = 5, maxCount = 10 },  -- 7590
	{ id = "great spirit potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8472
	{ id = "ultimate health potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8473
	{ id = "blue gem", chance = 0 },  -- 2158
	{ id = "small ruby", chance = 0, maxCount = 20 },  -- 2147
	{ id = "small sapphire", chance = 0, maxCount = 20 },  -- 2146
	{ id = 26185, chance = 0 },  -- ring of blue plasma
	{ id = "small amethyst", chance = 0, maxCount = 20 },  -- 2150
	{ id = "yellow gem", chance = 0 },  -- 2154
	{ id = "small topaz", chance = 0, maxCount = 20 },  -- 9970
	{ id = "green gem", chance = 0 },  -- 2155
	{ id = "red gem", chance = 0 },  -- 2156
	{ id = "small emerald", chance = 0, maxCount = 20 },  -- 2149
	{ id = 26189, chance = 0 },  -- ring of red plasma
	{ id = "skull staff", chance = 0 },  -- 2436
	{ id = 7632, chance = 0 },  -- giant shimmering pearl
	{ id = "collar of green plasma", chance = 0 },  -- 26199
	{ id = 26200, chance = 0 },  -- collar of red plasma
	{ id = "ring of green plasma", chance = 0 },  -- 26187
	{ id = 26198, chance = 0 },  -- collar of blue plasma
	{ id = "lightning headband", chance = 0 },  -- 7901
	{ id = "bonebreaker", chance = 0 },  -- 7428
	{ id = "amber staff", chance = 0 },  -- 7426
	{ id = "violet gem", chance = 0 },  -- 2153
	{ id = "crystalline armor", chance = 0 },  -- 8878
	{ id = "golden legs", chance = 0 },  -- 2470
	{ id = "composite hornbow", chance = 0 },  -- 8855
	{ id = "devourer core", chance = 0 },  -- 26342
	{ id = "runed sword", chance = 0 },  -- 7417
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -1600 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -800, length = 10, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -400, maxDamage = -800, radius = 4, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_YELLOWENERGY, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -600, maxDamage = -1200, length = 10, spread = 0, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, radius = 8, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "anomaly break", interval = 2000, chance = 40, target = false },
	{ name = "devourer summon", interval = 2000, chance = 25, target = false },
}

monster.defenses = {
	defense = 150,
	armor = 150,
	--	mitigation = ???,
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
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)