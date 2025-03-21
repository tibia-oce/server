-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Rupture
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Rupture
---


local mType = Game.createMonsterType("Rupture")
local monster = {}

monster.description = "Rupture"
monster.experience = 112000
monster.outfit = {
	lookType = 875,
	lookHead = 77,
	lookBody = 79,
	lookLegs = 3,
	lookFeet = 85,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 23564
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

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"RuptureResonance",
	-- "RuptureHeal",
	-- "HeartBossDeath",
-- }

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
	{ id = "gold coin", chance = 0, maxCount = 200 },  -- 2148
	{ id = "gold token", chance = 0, maxCount = 4 },  -- 25377
	{ id = "mysterious remains", chance = 0 },  -- 26165
	{ id = "odd organ", chance = 0 },  -- 26166
	{ id = "plasma pearls", chance = 0 },  -- 26162
	{ id = "platinum coin", chance = 0, minCount = 15, maxCount = 35 },  -- 2152
	{ id = "violet crystal shard", chance = 0, maxCount = 3 },  -- 18414
	{ id = "green crystal shard", chance = 0, maxCount = 3 },  -- 18415
	{ id = "blue crystal shard", chance = 0, maxCount = 3 },  -- 18413
	{ id = "great mana potion", chance = 0, minCount = 5, maxCount = 10 },  -- 7590
	{ id = "great spirit potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8472
	{ id = "ultimate health potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8473
	{ id = "small sapphire", chance = 0, maxCount = 10 },  -- 2146
	{ id = "small diamond", chance = 0, maxCount = 10 },  -- 2145
	{ id = "small topaz", chance = 0, maxCount = 10 },  -- 9970
	{ id = "blue gem", chance = 0 },  -- 2158
	{ id = "red gem", chance = 0 },  -- 2156
	{ id = "ring of green plasma", chance = 0 },  -- 26187
	{ id = 26189, chance = 0 },  -- ring of red plasma
	{ id = 26133, chance = 0 },  -- void boots
	{ id = "chaos mace", chance = 0 },  -- 7427
	{ id = "green gem", chance = 0 },  -- 2155
	{ id = "yellow gem", chance = 0 },  -- 2154
	{ id = 26185, chance = 0 },  -- ring of blue plasma
	{ id = "small emerald", chance = 0, maxCount = 10 },  -- 2149
	{ id = 26200, chance = 0 },  -- collar of red plasma
	{ id = 7632, chance = 0 },  -- giant shimmering pearl
	{ id = "lightning headband", chance = 0 },  -- 7901
	{ id = "shadow sceptre", chance = 0 },  -- 7451
	{ id = "violet gem", chance = 0 },  -- 2153
	{ id = "amber staff", chance = 0 },  -- 7426
	{ id = "lightning legs", chance = 0 },  -- 7895
	{ id = "small amethyst", chance = 0, maxCount = 10 },  -- 2150
	{ id = 26198, chance = 0 },  -- collar of blue plasma
	{ id = 26130, chance = 0 },  -- tiara of power
	{ id = "collar of green plasma", chance = 0 },  -- 26199
	{ id = "ruthless axe", chance = 0 },  -- 6553
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -250, maxDamage = -1000 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -800, length = 10, spread = 0, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -150, maxDamage = -300, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "rupture wave", interval = 2000, chance = 20, minDamage = -700, maxDamage = -1100, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -600, length = 9, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "anomaly break", interval = 2000, chance = 40, target = false },
}

monster.defenses = {
	defense = 100,
	armor = 100,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 150, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE, target = false },
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