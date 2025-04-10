-- Bootstraps the system (initializes services, managers, bonus modules, etc.)
-- Main entry point for the Item Upgrade System
print(">> Loading item upgrade system")

-- First, create a local flag to prevent duplicate registrations
local initialized = false

local function initializeAugmentIntegration()
    local p = Game.getPlayers()
    for _, pl in ipairs(p) do
        for slot = CONST_SLOT_HEAD, CONST_SLOT_AMMO do
            local it = pl:getSlotItem(slot)
            if it then
                local Augments = dofile('data/scripts/custom/itemupgrades/modules/augments.lua')
                Augments.syncItemAugments(it)
            end
        end
    end
end

local function registerCrystalActions()
    if initialized then
        return
    end

    -- Create a single action handler for all crystals
    local CrystalsAction = Action()

    function CrystalsAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
        -- Handle Crystal Extractor logic
        if item:getId() == US_CONFIG.CRYSTAL_EXTRACTOR and target and target:getId() == US_CONFIG.CRYSTAL_FOSSIL then
            local amount = target:getCount()
            for i = 1, amount do
                if math.random(US_CONFIG.CRYSTAL_BREAK_CHANCE) == 1 then
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Crystal inside broke!")
                else
                    local rand = math.random(100)
                    local crystals = 1
                    if rand <= 20 then
                        crystals = 3
                    elseif rand <= 50 then
                        crystals = 2
                    end
                    for j = 1, crystals do
                        local crystal = math.random(1, #US_CONFIG[1])
                        player:addItem(US_CONFIG[1][crystal])
                    end
                end
            end
            target:remove(amount)
            return true
        end

        -- Handle upgrade crystals
        local Crystal = dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
        if not Crystal.isCrystal(item) then
            return false
        end

        local EnchantmentManager = dofile('data/scripts/custom/itemupgrades/managers/EnchantmentManager.lua')
        return EnchantmentManager.handleCrystal(player, item, target)
    end

    -- Register all crystal IDs in a single call
    CrystalsAction:id(US_CONFIG[1][ITEM_UPGRADE_CRYSTAL], US_CONFIG[1][ITEM_AUGMENTING_CRYSTAL],
        US_CONFIG[1][ITEM_ALTER_CRYSTAL], US_CONFIG[1][ITEM_SCOURING_CRYSTAL], US_CONFIG[1][ITEM_EXALT_CRYSTAL],
        US_CONFIG[1][ITEM_CHAOS_CRYSTAL], US_CONFIG.ITEM_MIND_CRYSTAL, US_CONFIG.ITEM_ANNULMENT_CRYSTAL,
        US_CONFIG.ITEM_MIRRORED_CRYSTAL, US_CONFIG.ITEM_DIVINE_CRYSTAL, US_CONFIG.CRYSTAL_EXTRACTOR)
    CrystalsAction:register()
    initialized = true
end

dofile('data/scripts/custom/itemupgrades/config.lua')
dofile('data/scripts/custom/itemupgrades/helpers.lua')
dofile('data/scripts/custom/itemupgrades/domain/Item.lua')
dofile('data/scripts/custom/itemupgrades/domain/Crystal.lua')
dofile('data/scripts/custom/itemupgrades/domain/Enchantment.lua')
dofile('data/scripts/custom/itemupgrades/modules/augments.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/magicLevelBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/meleeLevelBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/weaponAttackBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/weaponDefenseBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/extraDefenseBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/hitChanceBonus.lua')
dofile('data/scripts/custom/itemupgrades/modules/bonus/armorBonus.lua')
dofile('data/scripts/custom/itemupgrades/services/AttributeService.lua')
dofile('data/scripts/custom/itemupgrades/services/EnchantmentService.lua')
dofile('data/scripts/custom/itemupgrades/managers/AttributeManager.lua')
dofile('data/scripts/custom/itemupgrades/managers/EnchantmentManager.lua')

-- Register crystal actions BEFORE loading events and loot
registerCrystalActions()

-- Register events and loot with modified versions that don't register crystals again
dofile('data/scripts/custom/itemupgrades/events.lua')
dofile('data/scripts/custom/itemupgrades/loot.lua')

initializeAugmentIntegration()
