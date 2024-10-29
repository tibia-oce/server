local mType = Game.createMonsterType("Falcon Knight")
local monster = {}

monster.description = "a falcon knight"
monster.experience = 5985
monster.outfit = {
	lookType = 1001,
	lookHead = 57,
	lookBody = 96,
	lookLegs = 38,
	lookFeet = 105,
	lookAddons = 1,
	lookMount = 0
}


monster.health = 9000
monster.maxHealth = 9000
monster.race = "undead"
monster.corpse = 26691
monster.speed = 350
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}


monster.strategiesTarget = {
	nearest = 100,
}
monster.events = {
	"playerAttackSound"
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Mmmhaarrrgh!", yell = false}
}

monster.loot = {
	{id = 2671, chance = 70080, maxCount = 8}, -- ham
	{id = "soul orb", chance = 35000},
	{id = "great mana potion", chance = 33000, maxCount = 3},
	{id = "great health potion", chance = 33000, maxCount = 3},
	{id = "small amethyst", chance = 24950, maxCount = 3},
	{id = "assassin star", chance = 24670, maxCount = 10},
	{id = "small diamond", chance = 15700, maxCount = 3},
	{id = "small ruby", chance = 15333, maxCount = 3},
	{id = "small emerald", chance = 15110, maxCount = 3},
	{id = "onyx arrow", chance = 14480, maxCount = 15},
	{id = "small topaz", chance = 4580, maxCount = 3},
	{id = "titan axe", chance = 3000},
	{id = 7633, chance = 3000}, -- giant shimmering pearl (brown)
	{id = "spiked squelcher", chance = 2200},
	{id = "knight armor", chance = 1980},
	{id = "falcon crest", chance = 1250},
	{id = "war axe", chance = 1230},
	{id = "violet gem", chance = 1060},
	{id = "green gem", chance = 880},
	{id = "golden armor", chance = 840},
	{id = "mastermind shield", chance = 620},
	{id = "heavy mace", chance = 460},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -400},
	{name ="combat", interval = 2000, chance = 18, type = COMBAT_EARTHDAMAGE, minDamage = -400, maxDamage = -500, radius = 2, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2000, chance = 14, type = COMBAT_HOLYDAMAGE, minDamage = -290, maxDamage = -360, length = 5, spread = 3, effect = CONST_ME_BLOCKHIT, target = false}
}

monster.defenses = {
	defense = 86,
	armor = 86
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -10},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
