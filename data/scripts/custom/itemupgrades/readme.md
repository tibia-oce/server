# Item Rarity & Crafting System

## System Overview
The Item Rarity & Crafting System enhances equipment items by adding quality levels, upgrade mechanics, and randomly generated attributes. This system creates deeper item progression and customization options for players.

## Core Features

### Item Types & Properties
- **Upgradable Items**: All non-consumable, non-stackable equipment (weapons, armor, shields, helmets, etc.)
- **Item Level**: Determines the power of an item and potential attribute values
- **Upgrade Level**: Items can be enhanced from +0 to +9, improving base stats
- **Rarity Tiers**: Common, Rare, Epic, and Legendary - each allowing more bonus attributes
- **Unique Items**: Special items with preset attribute combinations and unique names
- **Attributes**: Various enchantments that provide special bonuses (stat increases, damage modifiers, etc.)

### Item States
- **Unidentified Items**: Found items must be identified to reveal attributes
- **Mirrored Items**: Perfect copies of existing items
- **Limitless Items**: Items with no level requirement

## Crafting Mechanics

### Crystals System
Players can modify items using various crystal types:

| Crystal Type | Effect |
|-------------|--------|
| Upgrade Crystal | Increases item upgrade level (+1 to +9) |
| Enchantment Crystal | Adds a random attribute to an item |
| Alteration Crystal | Removes the last attribute from an item |
| Cleansing Crystal | Removes all attributes from an item |
| Fortune Crystal | Rerolls values of the last attribute |
| Faith Crystal | Rerolls values of all attributes |
| Mirrored Crystal | Creates an exact copy of an item |
| Mind Crystal | Transfers attributes between items |
| Limitless Crystal | Removes level requirements from an item |
| Void Crystal | Transforms an item into a Unique item |

### Attribute System
- **Attribute Types**:
  - Condition: Stats and buffs (HP, MP, Skills, etc.)
  - Offensive: Damage modifiers and special attacks
  - Defensive: Damage reduction and protection
  - Trigger: Special effects on attack, hit, or kill

- **Probability & Risk**:
  - Upgrades have decreasing success rates at higher levels
  - Failures can reduce upgrade level or destroy items at high levels
  - Upgrade Catalyst can be used to prevent item destruction

## Item Acquisition

- **Monster Drops**:
  - Crystal Fossils drop from high-level monsters (1:8 chance from level 25+ monsters)
  - Unidentified items can be found in monster corpses (1:1 chance)
  - Crystal Extractor is used to extract crystals from fossils

- **Identification**:
  - Scroll of Identification reveals item attributes
  - Identification has a chance to produce Unique items

## Unique Items

The system includes special pre-defined Unique items with thematic attributes:
- Flame Spirit: Melee-focused with life steal and fire damage
- Ice Spirit: Magic-focused with mana regeneration and ice damage
- Terra Spirit: Balanced with HP/MP boosts and earth damage

## Player Benefits

- **Stat Increases**: Upgrade levels increase base stats (attack, defense, armor)
- **Special Effects**: Life steal, elemental damage bonuses, protection against damage types
- **Utility Bonuses**: Experience boosts, gold find, revival chance
- **Combat Triggers**: Elemental strikes, healing effects, buffs upon killing monsters

## Technical Implementation

- **Item Structure**: Uses custom attributes to store item properties
- **Level Calculations**: Item levels determined by base stats and upgrade level
- **Event System**: Combat events trigger special attributes
- **UI Integration**: Detailed item tooltips display all relevant information

## Design Philosophy

This system encourages:
1. Long-term gear progression
2. Strategic equipment choices
3. Resource management for crafting
4. Risk/reward mechanics in upgrades
5. Farming incentives for crystals and rare items

## Example Gameplay Loop

1. Player finds an unidentified item
2. Player identifies it to reveal rarity and attributes
3. Player upgrades the item to improve base stats
4. Player uses various crystals to customize attributes
5. Player risks higher-level upgrades for better stats
6. Player seeks specific crystals to optimize gear
