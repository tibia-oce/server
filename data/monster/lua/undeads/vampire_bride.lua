-- Version: 8.40
-- Monster: https://tibia.fandom.com/wiki/Vampire_Bride
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Vampire_Bride
---


local mType = Game.createMonsterType("Vampire Bride")
local monster = {}

monster.description = "a vampire bride"
monster.experience = 1050
monster.outfit = {
	lookType = 312,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 1200
monster.maxHealth = 1200
monster.race = "blood"
monster.corpse = 9658
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	canWalkOnFire = false,
	canWalkOnPoison = true}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Kneel before your Mistress!", yell = false },
	{ text = "Dead is the new alive.", yell = false },
	{ text = "Come, let me kiss you, darling. Oh wait, I meant kill.", yell = false },
	{ text = "Enjoy the pain - I know you love it.", yell = false },
	{ text = "Are you suffering nicely enough?", yell = false },
	{ text = "You won't regret you came to me, sweetheart.", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 93606, minCount = 1, maxCount = 149 },  -- 2148
	{ id = "strong mana potion", chance = 10282 },  -- 7589
	{ id = "platinum coin", chance = 9995 },  -- 2152
	{ id = "vampire teeth", chance = 9968 },  -- 10602
	{ id = "moonlight rod", chance = 5182 },  -- 2186
	{ id = "blood preservation", chance = 5021 },  -- 12405
	{ id = "strong health potion", chance = 4829 },  -- 7588
	{ id = "emerald bangle", chance = 1056 },  -- 2127
	{ id = "small diamond", chance = 1041, minCount = 1, maxCount = 2 },  -- 2145
	{ id = 9808, chance = 1023 },  -- todo: rusted armor does not exist in items.xml
	{ id = "velvet tapestry", chance = 999 },  -- 9837
	{ id = "hibiscus dress", chance = 993 },  -- 8873
	{ id = "boots of haste", chance = 216 },  -- 2195
	{ id = 7733, chance = 177 },  -- flower bouquet
	{ id = "mysterious voodoo skull", chance = 131 },  -- 5669
	{ id = "blood goblet", chance = 94 },  -- 9447
	{ id = "leather whip", chance = 30 },  -- 13293
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -190 },
	{ name = "combat", interval = 3000, chance = 15, type = COMBAT_LIFEDRAIN, minDamage = -60, maxDamage = -130, range = 1, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -60, maxDamage = -150, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 4000, chance = 5, type = COMBAT_DEATHDAMAGE, minDamage = -60, maxDamage = -150, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_HEARTS, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -60, maxDamage = -150, range = 7, shootEffect = CONST_ANI_ENERGY, target = true },
}

monster.defenses = {
	defense = 20,
	armor = 55,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 10 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)