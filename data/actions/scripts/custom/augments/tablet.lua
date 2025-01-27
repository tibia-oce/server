local AUGMENTS = {
    -- Elemental Damage
    [27860] = {augment = "Elemental Augment [1]"},
    [27861] = {augment = "Elemental Augment [2]"},
    [27862] = {augment = "Elemental Augment [3]"},
    [27863] = {augment = "Elemental Augment [4]"},
    -- Physical Damage
    [27853] = {augment = "PhysicalAugment", tier = 1, value = 2},
    [27854] = {augment = "PhysicalAugment", tier = 2, value = 4},
    [27855] = {augment = "PhysicalAugment", tier = 3, value = 6},
    [27856] = {augment = "PhysicalAugment", tier = 4, value = 8},
    -- Skills
    [27870] = {augment = "SkillsAugment", tier = 1, value = 2},
    [27871] = {augment = "SkillsAugment", tier = 2, value = 4},
    [27872] = {augment = "SkillsAugment", tier = 3, value = 6},
    [27873] = {augment = "SkillsAugment", tier = 4, value = 8},
    -- Healing
    [27857] = {augment = "HealingAugment", tier = 1, value = 5},
    [27858] = {augment = "HealingAugment", tier = 2, value = 10},
    [27859] = {augment = "HealingAugment", tier = 3, value = 15},
    -- Magic Level
    [27849] = {augment = "MagicLevelAugment", tier = 1, value = 2},
    [27850] = {augment = "MagicLevelAugment", tier = 2, value = 4},
    [27851] = {augment = "MagicLevelAugment", tier = 3, value = 6},
    [27852] = {augment = "MagicLevelAugment", tier = 4, value = 8},
    -- Health
    [27846] = {augment = "HealthAugment", tier = 1, value = 5},
    [27847] = {augment = "HealthAugment", tier = 2, value = 10},
    [27848] = {augment = "HealthAugment", tier = 3, value = 15},
    -- Marksman's Focus
    [27864] = {augment = "MarksmanFocusAugment", tier = 1, value = 25},
    [27865] = {augment = "MarksmanFocusAugment", tier = 2, value = 35},
    [27866] = {augment = "MarksmanFocusAugment", tier = 3, value = 50},
    -- Spellweaver's Bond
    [27843] = {augment = "SpellweaverBondAugment", tier = 1, value = 15},
    [27844] = {augment = "SpellweaverBondAugment", tier = 2, value = 20},
    [27845] = {augment = "SpellweaverBondAugment", tier = 3, value = 30},
    -- Warrior's Guard
    [27867] = {augment = "WarriorGuardAugment", tier = 1, value = 10},
    [27868] = {augment = "WarriorGuardAugment", tier = 2, value = 15},
    [27869] = {augment = "WarriorGuardAugment", tier = 3, value = 25}
 }
 
-- List of items that cannot be augmented
local INVALID_ITEMS = {
    1, 2, 3, 4, 5, 6, 7, 10, 11, 13, 14, 15, 19, 21, 26, 27, 28, 35, 43
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target:isItem() then return false end
    
    local augmentData = AUGMENTS[item:getId()]
    if not augmentData then return false end

    local augment = Augment(augmentData.augment)
    if not augment then return false end
    
    local newItem = player:addItem(target:getId(), 1)
    if not newItem then return false end
    
    newItem:addAugment(augment)
    target:remove(1)
    item:remove(1)
    
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
    return true

end

-- function onUse(player, item, fromPosition, target, toPosition, isHotkey)
--     if not target or not target:isItem() then
--         return false
--     end

--     local targetId = target:getId()
--     if table.contains(INVALID_ITEMS, targetId) then
--         player:sendCancelMessage("This item cannot be augmented.")
--         return false
--     end

--     local augmentData = AUGMENTS[item:getId()]
--     if not augmentData then 
--         return false 
--     end

--     -- Create augment
--     local augment = Augment(augmentData.name)
--     if not augment then
--         return false
--     end

--     -- Create new item with augment
--     local newItem = player:addItem(targetId, 1)
--     if not newItem then
--         return false
--     end
    
--     newItem:addAugment(augment)
--     target:remove(1)
--     item:remove(1)
    
--     player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
--     return true
-- end
