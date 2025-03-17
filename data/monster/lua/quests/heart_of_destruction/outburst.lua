-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Outburst
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Outburst
---


local mType = Game.createMonsterType("Outburst")
local monster = {}

monster.description = "Outburst"
monster.experience = 50000
monster.outfit = {
	lookType = 876,
	lookHead = 79,
	lookBody = 3,
	lookLegs = 94,
	lookFeet = 3,
	lookAddons = 3,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 1227,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 23564
monster.speed = 250
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
	"OutburstCharge",
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
	{ id = "energy ball", chance = 0 },  -- 26179
	{ id = "energy drink", chance = 0, maxCount = 5 },  -- 26201
	{ id = "gold coin", chance = 0, maxCount = 200 },  -- 2148
	{ id = "gold token", chance = 0, maxCount = 4 },  -- 25377
	{ id = "instable proto matter", chance = 0 },  -- 26172
	{ id = "mysterious remains", chance = 0 },  -- 26165
	{ id = "platinum coin", chance = 0, minCount = 15, maxCount = 35 },  -- 2152
	{ id = "blue crystal shard", chance = 0, maxCount = 3 },  -- 18413
	{ id = "violet crystal shard", chance = 0, maxCount = 3 },  -- 18414
	{ id = "ultimate health potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8473
	{ id = "green crystal shard", chance = 0, maxCount = 3 },  -- 18415
	{ id = "great mana potion", chance = 0, minCount = 5, maxCount = 10 },  -- 7590
	{ id = "great spirit potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8472
	{ id = "small amethyst", chance = 0, maxCount = 10 },  -- 2150
	{ id = "yellow gem", chance = 0 },  -- 2154
	{ id = "blue gem", chance = 0 },  -- 2158
	{ id = "small ruby", chance = 0, maxCount = 10 },  -- 2147
	{ id = "small sapphire", chance = 0, maxCount = 10 },  -- 2146
	{ id = 26133, chance = 0 },  -- void boots
	{ id = "red gem", chance = 0 },  -- 2156
	{ id = "small emerald", chance = 0, maxCount = 10 },  -- 2149
	{ id = "chaos mace", chance = 0 },  -- 7427
	{ id = "green gem", chance = 0 },  -- 2155
	{ id = 26185, chance = 0 },  -- ring of blue plasma
	{ id = "small topaz", chance = 0, maxCount = 10 },  -- 9970
	{ id = 7632, chance = 0 },  -- giant shimmering pearl
	{ id = "ring of green plasma", chance = 0 },  -- 26187
	{ id = 26189, chance = 0 },  -- ring of red plasma
	{ id = 26198, chance = 0 },  -- collar of blue plasma
	{ id = "lightning headband", chance = 0 },  -- 7901
	{ id = "collar of green plasma", chance = 0 },  -- 26199
	{ id = "bonebreaker", chance = 0 },  -- 7428
	{ id = "amber staff", chance = 0 },  -- 7426
	{ id = 26200, chance = 0 },  -- collar of red plasma
	{ id = 26130, chance = 0 },  -- tiara of power
	{ id = "war axe", chance = 0 },  -- 2454
	{ id = "lightning robe", chance = 0 },  -- 7898
	{ id = "violet gem", chance = 0 },  -- 2153
	{ id = "lightning legs", chance = 0 },  -- 7895
	{ id = "crystalline sword", chance = 0 },  -- 18450
	{ id = "composite hornbow", chance = 0 },  -- 8855
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -1800 },
	{ name = "big energy purple wave", interval = 2000, chance = 25, minDamage = -700, maxDamage = -1300, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -600, radius = 4, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -800, maxDamage = -1300, length = 8, spread = 0, effect = CONST_ME_HITAREA, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -900, length = 8, spread = 0, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "big skill reducer", interval = 2000, chance = 25, target = false },
	{ name = "anomaly break", interval = 2000, chance = 40, target = false },
}

monster.defenses = {
	defense = 100,
	armor = 100,
	--	mitigation = ???,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)