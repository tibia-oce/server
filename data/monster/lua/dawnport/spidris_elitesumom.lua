-- Version: 9.40
-- Monster: https://tibia.fandom.com/wiki/Spidris_Elite
-- Loot table: https://tibia.fandom.com/wiki/Loot_Statistics:Spidris_Elite
---


local mType = Game.createMonsterType("Spidris Elite Summon")
local monster = {}

monster.name = "Spidris Elite"
monster.description = "a spidris elite"
monster.experience = 4000
monster.outfit = {
	lookType = 457,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 5000
monster.maxHealth = 5000
monster.race = "venom"
monster.corpse = 13870
monster.speed = 197
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
	canPushCreatures = true,
	staticAttackChance = 95,
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
}

monster.loot = {
	{ id = "gold coin", chance = 96394, minCount = 1, maxCount = 200 },  -- 2148
	{ id = "platinum coin", chance = 43181, minCount = 1, maxCount = 6 },  -- 2152
	{ id = "spidris mandible", chance = 29141 },  -- 15485
	{ id = "small ruby", chance = 23550, minCount = 1, maxCount = 5 },  -- 2147
	{ id = "great mana potion", chance = 21529 },  -- 7590
	{ id = "compound eye", chance = 13552 },  -- 15486
	{ id = "ultimate health potion", chance = 11374 },  -- 8473
	{ id = 6300, chance = 4546 },  -- death ring
	{ id = 7632, chance = 2926 },
	{ id = "calopteryx cape", chance = 1428 },  -- 15489
	{ id = "hive scythe", chance = 1324 },  -- 15492
	{ id = "titan axe", chance = 1167 },  -- 7413
	{ id = "violet gem", chance = 1115 },  -- 2153
	{ id = "carapace shield", chance = 993 },  -- 15491
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 75, attack = 82 },
}

monster.defenses = {
	defense = 30,
	armor = 30,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
