-- Version: 10.70
-- Monster: https://tibia.fandom.com/wiki/Depowered_Minotaur
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Depowered_Minotaur
---


local mType = Game.createMonsterType("Depowered Minotaur")
local monster = {}

monster.description = "a depowered minotaur"
monster.experience = 1100
monster.outfit = {
	lookType = 25,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1500
monster.maxHealth = 1500
monster.race = "blood"
monster.corpse = 5969
monster.speed = 106
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I want my power back!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 100 },  -- 2148
	{ id = "platinum coin", chance = 58505, minCount = 1, maxCount = 5 },  -- 2152
	{ id = "minotaur horn", chance = 14393, minCount = 1, maxCount = 2 },  -- 12428
	{ id = "strong health potion", chance = 10654, minCount = 1, maxCount = 3 },  -- 7588
	{ id = "minotaur leather", chance = 10093 },  -- 5878
	{ id = "strong mana potion", chance = 9346, minCount = 1, maxCount = 3 },  -- 7589
	{ id = "meat", chance = 8224 },  -- 2666
	{ id = "small diamond", chance = 5234 },  -- 2145
	{ id = "small ruby", chance = 5047 },  -- 2147
	{ id = "small emerald", chance = 4112 },  -- 2149
	{ id = "small sapphire", chance = 3738 },  -- 2146
	{ id = "mooh'tah plate", chance = 1308 },  -- 23537
	{ id = "cowtana", chance = 935 },  -- 23548
	{ id = "club ring", chance = 748 },  -- 2209
	{ id = "red piece of cloth", chance = 748 },  -- 5911
	{ id = 7401, chance = 561 },  -- minotaur trophy
	{ id = "spiked squelcher", chance = 374 },  -- 7452
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 80, attack = 45 },
	{ name = "melee", interval = 2000, chance = 100, minDamage = -0, maxDamage = -200 },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 1.09,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)