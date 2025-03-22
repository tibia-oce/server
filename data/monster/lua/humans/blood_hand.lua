-- Version: 10.10
-- Monster: https://tibia.fandom.com/wiki/Blood_Hand
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Blood_Hand
---


local mType = Game.createMonsterType("Blood Hand")
local monster = {}

monster.description = "a blood hand"
monster.experience = 750
monster.outfit = {
	lookType = 552,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}


monster.health = 700
monster.maxHealth = 700
monster.race = "blood"
monster.corpse = 21257
monster.speed = 96
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
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
	{ text = "Blood for the dark god!", yell = false },
	{ text = "Die, filth!", yell = false },
	{ text = "For the Blood God!", yell = false },
}

monster.loot = {
	{ id = "gold coin", chance = 100000, minCount = 1, maxCount = 135 },  -- 2148
	{ id = "blood tincture in a vial", chance = 15629 },  -- 21245
	{ id = "book of necromantic rituals", chance = 10133 },  -- 11237
	{ id = "lancet", chance = 9990 },  -- 21242
	{ id = "incantation notes", chance = 9752 },  -- 21246
	{ id = "horoscope", chance = 7926 },  -- 21243
	{ id = "pieces of magic chalk", chance = 6401 },  -- 21247
	{ id = "strong mana potion", chance = 5988 },  -- 7589
	{ id = "necrotic rod", chance = 3129 },  -- 2185
	{ id = "mystic turban", chance = 1080 },  -- 2663
	{ id = "spellbook of enlightenment", chance = 1032 },  -- 8900
	{ id = "white piece of cloth", chance = 905 },  -- 5909
	{ id = "red piece of cloth", chance = 651 },  -- 5911
	{ id = "red gem", chance = 524 },  -- 2156
	{ id = "boots of haste", chance = 111 },  -- 2195
	{ id = "skull staff", chance = 48 },  -- 2436
	{ id = "noble axe", chance = 16 },  -- 7456
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -158, condition = { type = CONDITION_POISON, totalDamage = 80, interval = 4000 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -50, maxDamage = -100, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 10, speed = -600, radius = 4, effect = CONST_ME_BLOCKHIT, target = true, duration = 15000 },
	-- bleed
	{ name = "condition", type = CONDITION_BLEEDING, interval = 2000, chance = 15, minDamage = -120, maxDamage = -160, radius = 6, effect = CONST_ME_HITAREA, target = false },
}

monster.defenses = {
	defense = 25,
	armor = 48,
	mitigation = 1.10,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 70, maxDamage = 90, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "effect", interval = 2000, chance = 10, radius = 1, effect = CONST_ME_INSECTS, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)