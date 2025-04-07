-- data/scripts/custom/itemupgrades/crystals.lua
-- Logic for all crystal items (upgrading, augments, rerolls, etc.).
dofile('data/scripts/custom/itemupgrades/augments.lua') -- for removeAllAugments, etc.
local CrystalsAction = Action()

--- Basic validation that the target is a valid upgradable item and not equipped.
-- @param player Player
-- @param item Item
-- @param target Item
-- @param toPosition Position
-- @return boolean
local function validateTarget(player, item, target, toPosition)
    if not target or not target:isItem() or not target:getType():isUpgradable() then
        return false
    end
    if toPosition.y <= CONST_SLOT_AMMO then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "You can't use that on an equipped item!")
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end
    return true
end

--- Check if an item is not mirrored.
-- @param player Player
-- @param target Item
-- @return boolean
local function validateNotMirrored(player, target)
    if target:isMirrored() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "That item is mirrored and can't be modified.")
        return false
    end
    return true
end

--- Check if an item is not unique.
-- @param player Player
-- @param target Item
-- @return boolean
local function validateNotUnique(player, target)
    if target:isUnique() then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Can't modify a Unique item's attributes.")
        return false
    end
    return true
end

--- Handles the Upgrade Crystal (+1 upgrade level attempts).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleUpgradeCrystal(player, item, target)
    local it = ItemType(target.itemid)
    if not it:isUpgradable() then
        return false
    end
    local upg = target:getUpgradeLevel()
    if upg >= US_CONFIG.MAX_UPGRADE_LEVEL then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Maximum upgrade level reached!")
        return false
    end
    local newLevel = upg + 1

    if newLevel >= US_CONFIG.UPGRADE_LEVEL_DESTROY then
        if math.random(100) > US_CONFIG.UPGRADE_DESTROY_CHANCE[newLevel] then
            if player:getItemCount(US_CONFIG.ITEM_UPGRADE_CATALYST) > 0 then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Upgrade failed! The catalyst protected your item.")
                player:removeItem(US_CONFIG.ITEM_UPGRADE_CATALYST, 1)
                item:remove(1)
                player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
                return true
            end
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Item destroyed.")
            target:remove(1)
            item:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    else
        if math.random(100) > US_CONFIG.UPGRADE_SUCCESS_CHANCE[newLevel] then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Upgrade failed! Upgrade level -1.")
            target:reduceUpgradeLevel()
            item:remove(1)
            player:getPosition():sendMagicEffect(CONST_ME_GROUNDSHAKER)
            return true
        end
    end

    target:setUpgradeLevel(newLevel)
    item:remove(1)
    local bonuses = target:getBonusAttributes()

    if target:getItemLevel() == 0 and bonuses and #bonuses > 0 then
        target:setItemLevel(1, true)
    end

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item upgrade level is now +" .. newLevel .. "!")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
    player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
    return true
end

--- Add a new modifier to a common item (becoming rare if it has 2 modifiers).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleAugmentingCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local currentRarityId = target:getRarityId()
    if currentRarityId ~= COMMON then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Augmentation is only for common items.")
        return false
    end

    local bonuses = target:getBonusAttributes() or {}
    if #bonuses >= 2 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item already has the max modifiers for common.")
        return false
    end

    local newRarity = (currentRarityId == COMMON and #bonuses == 1) and RARE or currentRarityId
    local currentItemLevel = target:getItemLevel()
    local existingIds = {}
    for _, b in ipairs(bonuses) do
        table.insert(existingIds, b[1])
    end

    local attrId = rollRandomAttribute(existingIds, currentItemLevel, target:getItemType())
    local attr = US_ENCHANTMENTS[attrId]
    local val = calculateAttributeValue(attr, currentItemLevel)
    target:setCustomAttribute("Slot" .. (target:getLastSlot() + 1), attrId .. "|" .. val)
    target:setAttribute(ITEM_ATTRIBUTE_ACTIONID, target:getActionId())

    if newRarity ~= currentRarityId then
        target:setRarity(newRarity)
        player:sendTextMessage(MESSAGE_INFO_DESCR,
            "Your item upgraded from " .. US_CONFIG.RARITY[currentRarityId].name .. " to " ..
                US_CONFIG.RARITY[newRarity].name .. " with a new modifier: " .. attr.name)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Added a new modifier: " .. attr.name)
    end

    if isCombatEnchantment(attrId) then
        applyAugmentForEnchantment(target, attrId, val)
    end
    item:remove(1)
    return true
end

--- Rerolls the existing modifiers of a (common or rare) item.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleAlterationCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local r = target:getRarityId()
    if r > RARE then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Alteration is only for common/rare items.")
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to alter.")
        return false
    end

    removeAllAugments(target)
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    local newRarity = math.random(1, 2) -- common or rare
    target:setRarity(newRarity)
    local it = ItemType(target.itemid)
    local wt = it:getWeaponType()
    target:rollAttribute(nil, it, wt, true)

    syncItemAugments(target)
    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item altered to " .. target:getRarity().name .. " rarity.")
    return true
end

--- Remove all modifiers from an item.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleScouringCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes.")
        return false
    end

    removeAllAugments(target)
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end
    target:setRarity(COMMON)

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifiers removed (scoured).")
    return true
end

--- Add a new modifier to an item that already has at least one (exaltation).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleExaltationCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item needs at least one existing modifier.")
        return false
    end
    if #bonuses >= 4 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item already has 4 modifiers (max).")
        return false
    end

    local oldRarity = target:getRarityId()
    local newRarity = oldRarity + 1
    if not US_CONFIG.RARITY[newRarity] then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item is already at maximum rarity.")
        return false
    end

    local lvl = target:getItemLevel()
    local existingIds = {}
    for _, b in ipairs(bonuses) do
        table.insert(existingIds, b[1])
    end

    local newId = rollRandomAttribute(existingIds, lvl, target:getItemType())
    local newAttr = US_ENCHANTMENTS[newId]
    local newVal = calculateAttributeValue(newAttr, lvl)

    target:setCustomAttribute("Slot" .. (target:getLastSlot() + 1), newId .. "|" .. newVal)
    target:setRarity(newRarity)
    target:setAttribute(ITEM_ATTRIBUTE_ACTIONID, target:getActionId())
    if isCombatEnchantment(newId) then
        applyAugmentForEnchantment(target, newId, newVal)
    end

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Item exalted from " .. US_CONFIG.RARITY[oldRarity].name .. " to " .. US_CONFIG.RARITY[newRarity].name ..
            " with a new modifier: " .. newAttr.name)
    return true
end

--- Reroll all modifiers and rarity of the item (chaos).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleChaosCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to chaos-reroll!")
        return false
    end

    removeAllAugments(target)
    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    target:rollRarity()
    local it = ItemType(target.itemid)
    local wt = it:getWeaponType()
    target:rollAttribute(nil, it, wt, true)

    syncItemAugments(target)
    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Chaotic energies have rerolled the item to " .. target:getRarity().name .. " rarity!")
    return true
end

--- Copy or apply bonus attributes using the Mind Crystal.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleMindCrystal(player, item, target)
    if not item:hasMemory() then
        local b = target:getBonusAttributes()
        if not b then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Target has no attributes to store.")
            return false
        end
        if target:isUnique() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Can't copy a Unique item's attributes.")
            return false
        end

        local c = Game.createItem(item.itemid, 1)
        local maxAttr = target:getMaxAttributes()
        for i = 1, maxAttr do
            local a = target:getBonusAttribute(i)
            if a then
                c:addAttribute(i, a[1], a[2])
                target:removeCustomAttribute("Slot" .. i)
            end
        end
        c:setMemory(true)
        if player:addItemEx(c) == RETURNVALUE_NOERROR then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Attributes saved into the crystal's memory!")
            item:remove(1)
            target:setRarity(COMMON)
            return true
        end
        return false
    else
        if target:getBonusAttributes() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Target already has attributes.")
            return false
        end
        local maxAttr = target:getMaxAttributes()
        for i = 1, maxAttr do
            local a = item:getBonusAttribute(i)
            if a then
                target:addAttribute(i, a[1], a[2])
            end
        end
        target:updateRarityByBonusCount()
        item:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully applied the stored attributes.")
        return true
    end
end

--- Remove one random modifier from the item.
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleAnnulmentCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes to annul.")
        return false
    end
    local slotToRemove = math.random(1, #bonuses)
    local info = target:getBonusAttribute(slotToRemove)
    local attrName = US_ENCHANTMENTS[info[1]].name

    local saved = {}
    for i = 1, #bonuses do
        if i ~= slotToRemove then
            local a = target:getBonusAttribute(i)
            if a then
                saved[#saved + 1] = {
                    id = a[1],
                    value = a[2]
                }
            end
        end
    end

    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    for i = 1, #saved do
        target:setCustomAttribute("Slot" .. i, saved[i].id .. "|" .. saved[i].value)
    end
    target:updateRarityByBonusCount()

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Annulled the '" .. attrName .. "' modifier from the item.")
    return true
end

--- Duplicate an item (mirroring it).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleMirroredCrystal(player, item, target)
    local copy = Game.createItem(target.itemid, 1)
    copy:setRarity(target:getRarityId())
    copy:setCustomAttribute("upgrade", target:getUpgradeLevel())
    copy:setCustomAttribute("item_level", target:getItemLevel())

    local b = target:getBonusAttributes()
    if b then
        for i = 1, target:getMaxAttributes() do
            local a = target:getBonusAttribute(i)
            if a then
                copy:addAttribute(i, a[1], a[2])
            end
        end
    end

    if target:isUnique() then
        copy:setCustomAttribute("unique", target:getUnique())
    end
    if target:isLimitless() then
        copy:setLimitless(true)
    end

    local attributesToCopy = {ITEM_ATTRIBUTE_ATTACK, ITEM_ATTRIBUTE_DEFENSE, ITEM_ATTRIBUTE_EXTRADEFENSE,
                              ITEM_ATTRIBUTE_ARMOR}
    for _, attrType in ipairs(attributesToCopy) do
        local val = target:getAttribute(attrType)
        if val > 0 then
            copy:setAttribute(attrType, val)
        end
    end

    copy:setMirrored(true)
    if player:addItemEx(copy) == RETURNVALUE_NOERROR then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "A mirrored copy has been created.")
        item:remove(1)
        return true
    end
    return false
end

--- Reroll all modifier values (divining).
-- @param player Player
-- @param item Item
-- @param target Item
-- @return boolean
local function handleDiviningCrystal(player, item, target)
    if not validateNotUnique(player, target) then
        return false
    end
    local bonuses = target:getBonusAttributes()
    if not bonuses or #bonuses == 0 then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "No modifiers to divine!")
        return false
    end

    for i = 1, #bonuses do
        local attr = US_ENCHANTMENTS[bonuses[i][1]]
        local newVal = 1
        if attr.percentage then
            newVal = math.random(1, US_CONFIG.MAX_PERCENTAGE_ROLL)
        elseif attr.VALUES_PER_LEVEL then
            local itemLevel = target:getItemLevel()
            local maxV = math.ceil(itemLevel * attr.VALUES_PER_LEVEL)
            newVal = (maxV < 1) and 1 or math.random(1, maxV)
        end
        target:setCustomAttribute("Slot" .. i, bonuses[i][1] .. "|" .. newVal)
    end

    item:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifier values have been divined anew!")
    return true
end

function CrystalsAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not validateTarget(player, item, target, toPosition) then
        return false
    end
    if not validateNotMirrored(player, target) then
        return true
    end

    local crystals = {
        [US_CONFIG[1][ITEM_UPGRADE_CRYSTAL]] = handleUpgradeCrystal,
        [US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL]] = handleAugmentingCrystal,
        [US_CONFIG[1][ITEM_ALTER_CRYSTAL]] = handleAlterationCrystal,
        [US_CONFIG[1][ITEM_SCOURING_CRYSTAL]] = handleScouringCrystal,
        [US_CONFIG[1][ITEM_EXALT_CRYSTAL]] = handleExaltationCrystal,
        [US_CONFIG[1][ITEM_CHAOS_CRYSTAL]] = handleChaosCrystal,
        [US_CONFIG.ITEM_MIND_CRYSTAL] = handleMindCrystal,
        [US_CONFIG.ITEM_ANNULMENT_CRYSTAL] = handleAnnulmentCrystal,
        [US_CONFIG.ITEM_MIRRORED_CRYSTAL] = handleMirroredCrystal,
        [US_CONFIG.ITEM_DIVINE_CRYSTAL] = handleDiviningCrystal
    }
    local handler = crystals[item.itemid]
    if handler then
        return handler(player, item, target)
    end
    return false
end

CrystalsAction:id(US_CONFIG[1][ITEM_UPGRADE_CRYSTAL], US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL],
    US_CONFIG[1][ITEM_ALTER_CRYSTAL], US_CONFIG[1][ITEM_SCOURING_CRYSTAL], US_CONFIG[1][ITEM_EXALT_CRYSTAL],
    US_CONFIG[1][ITEM_CHAOS_CRYSTAL], US_CONFIG.ITEM_MIND_CRYSTAL, US_CONFIG.ITEM_ANNULMENT_CRYSTAL,
    US_CONFIG.ITEM_MIRRORED_CRYSTAL, US_CONFIG.ITEM_DIVINE_CRYSTAL)
CrystalsAction:register()
