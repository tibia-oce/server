-- Coordinates the lifecycle of augments triggered by various crystals
-- Orchestrates enchantment operations on items
dofile('data/scripts/custom/itemupgrades/services/EnchantmentService.lua')
dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')

-- EnchantmentManager module
local EnchantmentManager = {}

--- Add a new modifier to a common item (becoming rare if it has 2 modifiers).
-- @param player Player Player using the crystal
-- @param crystal Item Augmenting crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleAugmenting(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateNotUnique(player, target) then
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

    local EnchantmentService = dofile('data/scripts/custom/itemupgrades/services/EnchantmentService.lua')
    EnchantmentService.addAttribute(target, attrId, val)

    if newRarity ~= currentRarityId then
        target:setRarity(newRarity)
        player:sendTextMessage(MESSAGE_INFO_DESCR,
            "Your item upgraded from " .. US_CONFIG.RARITY[currentRarityId].name .. " to " ..
                US_CONFIG.RARITY[newRarity].name .. " with a new modifier: " .. attr.name)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Added a new modifier: " .. attr.name)
    end

    crystal:remove(1)
    return true
end

--- Rerolls the existing modifiers of a (common or rare) item.
-- @param player Player Player using the crystal
-- @param crystal Item Alteration crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleAlteration(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateNotUnique(player, target) then
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

    local EnchantmentService = dofile('data/scripts/custom/itemupgrades/services/EnchantmentService.lua')
    EnchantmentService.removeAllAugments(target)

    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    local newRarity = math.random(1, 2) -- common or rare
    target:setRarity(newRarity)
    local it = ItemType(target.itemid)
    local wt = it:getWeaponType()
    target:rollAttribute(nil, it, wt, true)

    EnchantmentService.syncItemAugments(target)
    crystal:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Item altered to " .. target:getRarity().name .. " rarity.")
    return true
end

--- Remove all modifiers from an item.
-- @param player Player Player using the crystal
-- @param crystal Item Scouring crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleScouring(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no attributes.")
        return false
    end

    local EnchantmentService = dofile('data/scripts/custom/itemupgrades/services/EnchantmentService.lua')
    EnchantmentService.removeAllAugments(target)

    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end
    target:setRarity(COMMON)

    crystal:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifiers removed (scoured).")
    return true
end

--- Add a new modifier to an item that already has at least one (exaltation).
-- @param player Player Player using the crystal
-- @param crystal Item Exalation crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleExaltation(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateNotUnique(player, target) then
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

    local EnchantmentService = dofile('data/scripts/custom/itemupgrades/services/EnchantmentService.lua')
    EnchantmentService.addAttribute(target, newId, newVal)

    target:setRarity(newRarity)

    crystal:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Item exalted from " .. US_CONFIG.RARITY[oldRarity].name .. " to " .. US_CONFIG.RARITY[newRarity].name ..
            " with a new modifier: " .. newAttr.name)
    return true
end

--- Reroll all modifiers and rarity of the item (chaos).
-- @param player Player Player using the crystal
-- @param crystal Item Chaos crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleChaos(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateNotUnique(player, target) then
        return false
    end

    local bonuses = target:getBonusAttributes()
    if not bonuses then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Item has no modifiers to chaos-reroll!")
        return false
    end

    local EnchantmentService = dofile('data/scripts/custom/itemupgrades/services/EnchantmentService.lua')
    EnchantmentService.removeAllAugments(target)

    for i = 1, #bonuses do
        target:removeCustomAttribute("Slot" .. i)
    end

    target:rollRarity()
    local it = ItemType(target.itemid)
    local wt = it:getWeaponType()
    target:rollAttribute(nil, it, wt, true)

    EnchantmentService.syncItemAugments(target)
    crystal:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR,
        "Chaotic energies have rerolled the item to " .. target:getRarity().name .. " rarity!")
    return true
end

--- Copy or apply bonus attributes using the Mind Crystal.
-- @param player Player Player using the crystal
-- @param crystal Item Mind crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleMindCrystal(player, crystal, target)
    if not crystal:hasMemory() then
        local b = target:getBonusAttributes()
        if not b then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Target has no attributes to store.")
            return false
        end
        if target:isUnique() then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Can't copy a Unique item's attributes.")
            return false
        end

        local c = Game.createItem(crystal.itemid, 1)
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
            crystal:remove(1)
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
            local a = crystal:getBonusAttribute(i)
            if a then
                target:addAttribute(i, a[1], a[2])
            end
        end
        target:updateRarityByBonusCount()
        crystal:remove(1)
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Successfully applied the stored attributes.")
        return true
    end
end

--- Remove one random modifier from the item.
-- @param player Player Player using the crystal
-- @param crystal Item Annulment crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleAnnulment(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateNotUnique(player, target) then
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

    crystal:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "Annulled the '" .. attrName .. "' modifier from the item.")
    return true
end

--- Duplicate an item (mirroring it).
-- @param player Player Player using the crystal
-- @param crystal Item Mirrored crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleMirroring(player, crystal, target)
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
        crystal:remove(1)
        return true
    end
    return false
end

--- Reroll all modifier values (divining).
-- @param player Player Player using the crystal
-- @param crystal Item Divine crystal
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleDivining(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateNotUnique(player, target) then
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

    crystal:remove(1)
    player:sendTextMessage(MESSAGE_INFO_DESCR, "All modifier values have been divined anew!")
    return true
end

--- Handle a crystal's effect on an item based on crystal type.
-- @param player Player Player using the crystal
-- @param crystal Item Crystal being used
-- @param target Item Target item
-- @return boolean Success
function EnchantmentManager.handleCrystal(player, crystal, target)
    local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
    if not Crystal.validateTarget(player, crystal, target, target:getPosition()) then
        return false
    end

    if not Crystal.validateNotMirrored(player, target) then
        return true
    end

    local crystalType = Crystal.getType(crystal)

    if crystalType == ITEM_UPGRADE_CRYSTAL then
        local AttributeManager = dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
        return AttributeManager.handleUpgrade(player, crystal, target)
    elseif crystalType == ITEM_AUGMENTING_CRYSTAL then
        return EnchantmentManager.handleAugmenting(player, crystal, target)
    elseif crystalType == ITEM_ALTER_CRYSTAL then
        return EnchantmentManager.handleAlteration(player, crystal, target)
    elseif crystalType == ITEM_SCOURING_CRYSTAL then
        return EnchantmentManager.handleScouring(player, crystal, target)
    elseif crystalType == ITEM_EXALT_CRYSTAL then
        return EnchantmentManager.handleExaltation(player, crystal, target)
    elseif crystalType == ITEM_CHAOS_CRYSTAL then
        return EnchantmentManager.handleChaos(player, crystal, target)
    elseif crystalType == -1 then -- Mirrored Crystal
        return EnchantmentManager.handleMirroring(player, crystal, target)
    elseif crystalType == -2 then -- Mind Crystal
        return EnchantmentManager.handleMindCrystal(player, crystal, target)
    elseif crystalType == -3 then -- Annulment Crystal
        return EnchantmentManager.handleAnnulment(player, crystal, target)
    elseif crystalType == -4 then -- Divine Crystal
        return EnchantmentManager.handleDivining(player, crystal, target)
    end

    return false
end

return EnchantmentManager
