-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Anomaly
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Anomaly
---


local mType = Game.createMonsterType("Anomaly")
local monster = {}

monster.description = "anomaly"
monster.experience = 50000
monster.outfit = {
	lookType = 876,
	lookHead = 38,
	lookBody = 79,
	lookLegs = 76,
	lookFeet = 79,
	lookAddons = 1,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 1219,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 290000
monster.maxHealth = 290000
monster.race = "venom"
monster.corpse = 23564
monster.speed = 200
monster.manaCost = 0

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"AnomalyTransform",
	-- "HeartBossDeath",
-- }

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

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ id = "curious matter", chance = 0 },  -- 26167
	{ id = "energy drink", chance = 0, maxCount = 5 },  -- 26201
	{ id = "frozen lightning", chance = 0 },  -- 26175
	{ id = "gold coin", chance = 0, maxCount = 200 },  -- 2148
	{ id = "gold token", chance = 0, maxCount = 4 },  -- 25377
	{ id = "mysterious remains", chance = 0 },  -- 26165
	{ id = "platinum coin", chance = 0, minCount = 15, maxCount = 35 },  -- 2152
	{ id = "violet crystal shard", chance = 0, maxCount = 3 },  -- 18414
	{ id = "blue crystal shard", chance = 0, maxCount = 3 },  -- 18413
	{ id = "green crystal shard", chance = 0, maxCount = 3 },  -- 18415
	{ id = "great mana potion", chance = 0, minCount = 5, maxCount = 10 },  -- 7590
	{ id = "great spirit potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8472
	{ id = "ultimate health potion", chance = 0, minCount = 5, maxCount = 10 },  -- 8473
	{ id = "small ruby", chance = 0, maxCount = 10 },  -- 2147
	{ id = "blue gem", chance = 0 },  -- 2158
	{ id = "small topaz", chance = 0, maxCount = 10 },  -- 9970
	{ id = 26133, chance = 0 },  -- void boots
	{ id = 7632, chance = 0 },  -- giant shimmering pearl
	{ id = "green gem", chance = 0 },  -- 2155
	{ id = "small emerald", chance = 0, maxCount = 10 },  -- 2149
	{ id = 26189, chance = 0 },  -- ring of red plasma
	{ id = "small amethyst", chance = 0, maxCount = 10 },  -- 2150
	{ id = "ring of green plasma", chance = 0 },  -- 26187
	{ id = "yellow gem", chance = 0 },  -- 2154
	{ id = "red gem", chance = 0 },  -- 2156
	{ id = "small diamond", chance = 0, maxCount = 10 },  -- 2145
	{ id = 26185, chance = 0 },  -- ring of blue plasma
	{ id = 26198, chance = 0 },  -- collar of blue plasma
	{ id = "shadow sceptre", chance = 0 },  -- 7451
	{ id = "lightning headband", chance = 0 },  -- 7901
	{ id = 26200, chance = 0 },  -- collar of red plasma
	{ id = "chaos mace", chance = 0 },  -- 7427
	{ id = "lightning legs", chance = 0 },  -- 7895
	{ id = "lightning robe", chance = 0 },  -- 7898
	{ id = "spellbook of warding", chance = 0 },  -- 8901
	{ id = "violet gem", chance = 0 },  -- 2153
	{ id = "collar of green plasma", chance = 0 },  -- 26199
	{ id = "crystalline sword", chance = 0 },  -- 18450
	{ id = 26130, chance = 0 },  -- tiara of power
	{ id = "ruthless axe", chance = 0 },  -- 6553
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -1400 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -300, maxDamage = -600, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "anomaly wave", interval = 2000, chance = 25, minDamage = -500, maxDamage = -900, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1000, length = 9, spread = 0, effect = CONST_ME_EXPLOSIONHIT, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -600, length = 9, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "anomaly break", interval = 2000, chance = 40, target = false },
}

monster.defenses = {
	defense = 100,
	armor = 100,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_HEALING, minDamage = 150, maxDamage = 400, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)