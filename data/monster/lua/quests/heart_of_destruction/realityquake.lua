-- Version: 10.94
-- Monster: https://tibia.fandom.com/wiki/Realityquake
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Realityquake
---


local mType = Game.createMonsterType("Realityquake")
local monster = {}

monster.description = "Realityquake"
monster.experience = 20000
monster.outfit = {
	lookTypeEx = 1949,
}


monster.health = 110000
monster.maxHealth = 110000
monster.race = "venom"
monster.corpse = 23567
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 20,
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
--	"HeartBossDeath",
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
    { id = "crystallized anger", chance = 100000 },  -- 26163
    { id = "energy bar", chance = 100000, maxCount = 5 },  -- 26191
    { id = "energy vein", chance = 100000 },  -- 26164
    { id = "gold coin", chance = 100000, maxCount = 200 },  -- 2148
    { id = "gold token", chance = 100000, maxCount = 4 },  -- 25377
    { id = "mysterious remains", chance = 100000 },  -- 26165
    { id = "platinum coin", chance = 100000, minCount = 15, maxCount = 35 },  -- 2152
    { id = "green crystal shard", chance = 69643, maxCount = 3 },  -- 18415
    { id = "blue crystal shard", chance = 66071, maxCount = 3 },  -- 18413
    { id = "violet crystal shard", chance = 66071, maxCount = 3 },  -- 18414
    { id = "great mana potion", chance = 58929, minCount = 5, maxCount = 10 },  -- 7590
    { id = "ultimate health potion", chance = 57143, minCount = 5, maxCount = 10 },  -- 8473
    { id = "great spirit potion", chance = 46429, minCount = 5, maxCount = 10 },  -- 8472
    { id = "small emerald", chance = 30357, maxCount = 10 },  -- 2149
    { id = "small topaz", chance = 30357, maxCount = 10 },  -- 9970
    { id = "red gem", chance = 26786 },  -- 2156
    { id = "wand of cosmic energy", chance = 25000 },  -- 2189
    { id = "yellow gem", chance = 23214 },  -- 2154
    { id = 26133, chance = 21429 },  -- void boots
    { id = 26200, chance = 17857 },  -- collar of red plasma
    { id = "blue gem", chance = 16071 },  -- 2158
    { id = "green gem", chance = 16071 },  -- 2155
    { id = "lightning robe", chance = 16071 },  -- 7898
    { id = "small amethyst", chance = 16071, maxCount = 10 },  -- 2150
    { id = 7632, chance = 14286 },  -- giant shimmering pearl
    { id = 26185, chance = 14286 },  -- ring of blue plasma
    { id = "small ruby", chance = 14286, maxCount = 10 },  -- 2147
    { id = "collar of green plasma", chance = 12500 },  -- 26199
    { id = "crystal mace", chance = 10714 },  -- 2445
    { id = 26189, chance = 10714 },  -- ring of red plasma
    { id = "small sapphire", chance = 8929, maxCount = 10 },  -- 2146
    { id = "lightning headband", chance = 7143 },  -- 7901
    { id = 26198, chance = 5357 },  -- collar of blue plasma
    { id = "crystalline armor", chance = 5357 },  -- 8878
    { id = "ring of green plasma", chance = 3571 },  -- 26187
    { id = "violet gem", chance = 3571 },  -- 2153
    { id = "golden legs", chance = 1786 },  -- 2470
    { id = 26130, chance = 1786 },  -- tiara of power
    { id = "vile axe", chance = 1786 },  -- 7388
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -1000 },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -800, length = 10, spread = 0, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -800, length = 10, spread = 0, effect = CONST_ME_BLOCKHIT, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -240, maxDamage = -600, radius = 5, effect = CONST_ME_POFF, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HOLYDAMAGE, minDamage = -240, maxDamage = -600, radius = 5, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYDAMAGE, target = true },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -450, length = 4, spread = 2, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_DEATHDAMAGE, minDamage = -240, maxDamage = -600, radius = 5, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = true },
	{ name = "anomaly break", interval = 2000, chance = 40, target = false },
}

monster.defenses = {
	defense = 100,
	armor = 100,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, radius = 8, effect = CONST_ME_POFF, target = false },
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