-- Version: 8.50
-- Monster: https://tibia.fandom.com/wiki/Merikh_the_Slaughterer
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Merikh_the_Slaughterer
---


local mType = Game.createMonsterType("Merikh the Slaughterer")
local monster = {}

monster.description = "Merikh the Slaughterer"
monster.experience = 1500
monster.outfit = {
	lookType = 103,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 2000
monster.maxHealth = 2000
monster.race = "blood"
monster.corpse = 6032
monster.speed = 90
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	canPushCreatures = false,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "green djinn", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Your death will be slow and painful.", yell = false },
}

monster.loot = {
	{ id = "green piece of cloth", chance = 100000, minCount = 1, maxCount = 4 },  -- 5910
	{ id = "jewelled belt", chance = 100000 },  -- 12426
	{ id = "gold coin", chance = 97222, minCount = 9, maxCount = 121 },  -- 2148
	{ id = "noble turban", chance = 63889 },  -- 12442
	{ id = "shiny stone", chance = 58333 },  -- 11227
	{ id = "royal spear", chance = 55556, minCount = 1, maxCount = 3 },  -- 7378
	{ id = "heavy machete", chance = 41667 },  -- 2442
	{ id = "strong mana potion", chance = 41667, minCount = 1, maxCount = 3 },  -- 7589
	{ id = "mystic turban", chance = 36111 },  -- 2663
	{ id = "magma monocle", chance = 8333 },  -- 7900
	{ id = "green gem", chance = 2778 },  -- 2155
	{ id = "small emerald", chance = 2778, maxCount = 2 },  -- 2149
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -304 },
	--fireball
	--heavy magic missile
	--sudden death
	--energy berserk
	--electrifies
}

monster.defenses = {
	defense = 0,
	armor = 0,
	mitigation = 1.29,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 1 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -1 },
	{ type = COMBAT_HOLYDAMAGE, percent = -1 },
	{ type = COMBAT_DEATHDAMAGE, percent = 1 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
