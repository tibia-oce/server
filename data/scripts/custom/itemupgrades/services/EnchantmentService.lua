-- Business logic for managing augments/modifiers
-- Handles enchantment operations on items
-- EnchantmentService module
local EnchantmentService = {}

--- Apply an augment for a given enchantment.
-- @param item Item Item to apply the enchantment to
-- @param enchantId number Enchantment ID
-- @param enchantValue number Enchantment value
function EnchantmentService.applyAugmentForEnchantment(item, enchantId, enchantValue)
    local Enchantment = dofile('data/scripts/custom/itemupgrades/domain/Enchantment.lua')
    if Enchantment.isCombatEnchantment(enchantId) then
        local augment = Enchantment.createAugmentFromEnchantment(enchantId, enchantValue)
        if augment then
            item:addAugment(augment)
        end
    end
end

--- Add an attribute to an item.
-- @param item Item Item to add attribute to
-- @param attributeId number Attribute ID
-- @param value number Attribute value
-- @param slot number Slot to add to (optional, will use next available if not provided)
function EnchantmentService.addAttribute(item, attributeId, value, slot)
    if not slot then
        slot = item:getLastSlot() + 1
    end
    item:addAttribute(slot, attributeId, value)

    if EnchantmentService.isCombatEnchantment(attributeId) then
        EnchantmentService.applyAugmentForEnchantment(item, attributeId, value)
    end
end

--- Remove all augments from an item.
-- @param item Item Item to remove augments from
function EnchantmentService.removeAllAugments(item)
    local Enchantment = dofile('data/scripts/custom/itemupgrades/domain/Enchantment.lua')
    Enchantment.removeAllAugments(item)
end

--- Synchronize item augments with its bonus attributes.
-- @param item Item Item to synchronize
function EnchantmentService.syncItemAugments(item)
    local Enchantment = dofile('data/scripts/custom/itemupgrades/domain/Enchantment.lua')
    Enchantment.syncItemAugments(item)
end

--- Roll a single random attribute for an item.
-- @param item Item Item to roll attribute for
-- @param player Player Player rolling the attribute (optional)
-- @return boolean Success
function EnchantmentService.rollRandomAttribute(item, player)
    local it = ItemType(item:getId())
    local wt = it:getWeaponType()
    return item:rollAttribute(player, it, wt, false)
end

--- Roll multiple attributes for a complete reroll (unidentify).
-- @param item Item Item to roll attributes for
-- @return boolean Success
function EnchantmentService.rollCompleteAttributes(item)
    local it = ItemType(item:getId())
    local wt = it:getWeaponType()
    return item:rollAttribute(nil, it, wt, true)
end

--- Update an item's rarity based on the number of enchantments.
-- @param item Item Item to update
function EnchantmentService.updateRarityByBonusCount(item)
    item:updateRarityByBonusCount()
end

--- Roll a random rarity for an item.
-- @param item Item Item to roll rarity for
function EnchantmentService.rollRarity(item)
    item:rollRarity()
end

--- Check if an enchantment ID is a combat enchantment.
-- @param enchantId number Enchantment ID
-- @return boolean True if combat enchantment
function EnchantmentService.isCombatEnchantment(enchantId)
    local Enchantment = dofile('data/scripts/custom/itemupgrades/domain/Enchantment.lua')
    return Enchantment.isCombatEnchantment(enchantId)
end

--- Remove an attribute from an item by slot.
-- @param item Item Item to remove attribute from
-- @param slot number Slot to remove
function EnchantmentService.removeAttribute(item, slot)
    if item:getBonusAttribute(slot) then
        item:removeCustomAttribute("Slot" .. slot)
    end
end

--- Copy all attributes from one item to another.
-- @param sourceItem Item Source item
-- @param targetItem Item Target item
-- @return boolean Success
function EnchantmentService.copyAttributes(sourceItem, targetItem)
    local bonuses = sourceItem:getBonusAttributes()
    if not bonuses then
        return false
    end

    for i = 1, #bonuses do
        local attr = sourceItem:getBonusAttribute(i)
        if attr then
            targetItem:addAttribute(i, attr[1], attr[2])
        end
    end

    targetItem:updateRarityByBonusCount()
    return true
end

return EnchantmentService
