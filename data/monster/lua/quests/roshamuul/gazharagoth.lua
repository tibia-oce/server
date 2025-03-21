
-- Version: 10.30
-- Monster: https://tibia.fandom.com/wiki/Gaz%27haragoth
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Gaz%27haragoth
---


local mType = Game.createMonsterType("Gaz'Haragoth")
local monster = {}

monster.description = "Gaz'Haragoth"
monster.experience = 1000000
monster.outfit = {
	lookType = 591,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 350000
monster.maxHealth = 350000
monster.race = "undead"
monster.corpse = 20228
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
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
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

-- todo(monster events): not yet migrated from xml to lua (or doesn't exist)
-- monster.events = {
--	"GazHaragothHeal",
-- }

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "NO ONE WILL ESCAPE ME!", yell = true },
	{ text = "I'LL KEEP THE ORDER UP!", yell = true },
	{ text = "I've beaten tougher demons then you even know!", yell = true },
	{ text = "You puny humans will be my snacks!", yell = true },
}

monster.loot = {
	{ id = 22614, chance = 0 },  -- nightmare beacon
	{ id = 7632, chance = 0 },  -- giant shimmering pearl
	{ id = "cluster of solace", chance = 0, minCount = 1, maxCount = 14 },  -- 22396
	{ id = "crystal coin", chance = 0, minCount = 1, maxCount = 6 },  -- 2160
	{ id = "dream matter", chance = 0 },  -- 22397
	{ id = "phoenix charm", chance = 0 },  -- 11258
	{ id = "solitude charm", chance = 0 },  -- 11262
	{ id = "spiritual charm", chance = 0 },  -- 11260
	{ id = "twin sun charm", chance = 0 },  -- 11261
	{ id = "unity charm", chance = 0 },  -- 11259
	{ id = "demonic essence", chance = 0 },  -- 6500
	{ id = "unrealized dream", chance = 0, minCount = 1, maxCount = 3 },  -- 22598
	{ id = "red piece of cloth", chance = 0 },  -- 5911
	{ id = "yellow piece of cloth", chance = 0 },  -- 5914
	{ id = "blue crystal splinter", chance = 0, maxCount = 15 },  -- 18418
	{ id = "assassin star", chance = 0, maxCount = 100 },  -- 7368
	{ id = "great mana potion", chance = 0, maxCount = 100 },  -- 7590
	{ id = "great spirit potion", chance = 0, maxCount = 100 },  -- 8472
	{ id = "green crystal splinter", chance = 0, maxCount = 15 },  -- 18416
	{ id = "ultimate health potion", chance = 0, maxCount = 100 },  -- 8473
	{ id = "demon horn", chance = 0 },  -- 5954
	{ id = "blue gem", chance = 0 },  -- 2158
	{ id = "green crystal shard", chance = 0, maxCount = 15 },  -- 18415
	{ id = "brown crystal splinter", chance = 0, maxCount = 15 },  -- 18417
	{ id = "infernal bolt", chance = 0, maxCount = 100 },  -- 6529
	{ id = "life ring", chance = 0 },  -- 2168
	{ id = "blue crystal shard", chance = 0, maxCount = 15 },  -- 18413
	{ id = "violet crystal shard", chance = 0, maxCount = 15 },  -- 18414
	{ id = "crude umbral crossbow", chance = 0 },  -- 22419
	{ id = "crude umbral blade", chance = 0 },  -- 22398
	{ id = "crude umbral axe", chance = 0 },  -- 22404
	{ id = "crude umbral spellbook", chance = 0 },  -- 22422
	{ id = "dream warden mask", chance = 0 },  -- 22610
	{ id = "nightmare horn", chance = 0 },  -- 22608
	{ id = "crude umbral mace", chance = 0 },  -- 22410
	{ id = "demonic tapestry", chance = 0 },  -- 22612
	{ id = "eye pod", chance = 0 },  -- 22613
	{ id = "nightmare hook", chance = 0 },  -- 22616
	{ id = "crude umbral chopper", chance = 0 },  -- 22407
	{ id = "crude umbral bow", chance = 0 },  -- 22416
	{ id = "umbral crossbow", chance = 0 },  -- 22420
	{ id = "boots of haste", chance = 0 },  -- 2195
	{ id = "crude umbral hammer", chance = 0 },  -- 22413
	{ id = "giant sword", chance = 0 },  -- 2393
	{ id = "golden legs", chance = 0 },  -- 2470
	{ id = "magma coat", chance = 0 },  -- 7899
	{ id = "psychedelic tapestry", chance = 0 },  -- 22611
	{ id = "umbral master axe", chance = 0 },  -- 22406
	{ id = "umbral master hammer", chance = 0 },  -- 22415
	{ id = "umbral masterblade", chance = 0 },  -- 22400
	{ id = "umbral slayer", chance = 0 },  -- 22402
	{ id = "crude umbral slayer", chance = 0 },  -- 22401
	{ id = "umbral axe", chance = 0 },  -- 22405
	{ id = "umbral bow", chance = 0 },  -- 22417
	{ id = "umbral hammer", chance = 0 },  -- 22414
	{ id = "umbral mace", chance = 0 },  -- 22411
	{ id = "umbral master crossbow", chance = 0 },  -- 22421
	{ id = "umbral master spellbook", chance = 0 },  -- 22424
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -5000 },
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_ICEDAMAGE, minDamage = -900, maxDamage = -1100, range = 7, radius = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true },
	{ name = "combat", interval = 2000, chance = 13, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -1000, length = 8, spread = 3, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 2000, chance = 19, type = COMBAT_DEATHDAMAGE, minDamage = -100, maxDamage = -800, range = 7, radius = 6, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "melee", interval = 1800, chance = 40, minDamage = 0, maxDamage = -1000 },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -4000, maxDamage = -6000, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 2000, chance = 14, type = COMBAT_FIREDAMAGE, minDamage = -1600, maxDamage = -3400, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2500, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -480, range = 7, radius = 5, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "gaz'haragoth iceball", interval = 2000, chance = 24, minDamage = -1000, maxDamage = -1000, target = false },
	{ name = "gaz'haragoth death", interval = 4000, chance = 6, target = false },
	{ name = "gaz'haragoth paralyze", interval = 2000, chance = 12, target = false },
	{ name = "gaz'haragoth summon", interval = 1000, chance = 100, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 55,
	{ name = "combat", interval = 3000, chance = 35, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 3500, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 4000, chance = 80, effect = CONST_ME_MAGIC_RED, speed = 500},
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)