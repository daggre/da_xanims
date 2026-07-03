# da_xanims

## Version & Status

v0.6

## Description

Animation library and queue system for RedM. Provides a tree-based hotkey menu for browsing and activating animation scenarios, built on a queue system that allows chaining animations together. Animations use environment-based conditions to determine availability based on the player's state and surroundings.

## Usage

Once in-game, press **X** to open the X-Anims menu. A small window appears in the bottom-right corner with a list of options — each shows a description and the key to press. Press the key to navigate. Press any unlisted key to close the menu.

When you activate an animation, the character enters the scenario. Some animations play once and exit automatically. Others enter an interactive idle state — from there, press **X** again to queue the next animation in the scenario. Press **X** then **C** to exit the current animation scenario.

Some scenarios allow you to transition into different scenarios, changing the idle state and available animations.

## Conditions

All animations are conditional. Availability depends on factors including:
- **Character state**: dead, swimming, aiming, weapon held, mounted on horseback
- **Gender**: some animations are gender-specific
- **Items carried**: cigar, canteen, guitar, etc.
- **Location**: near a water source, in snow, in an animal stall
- **Active weapon type**: knife, revolver, longarm, etc.
- **Animal ped type**: horse, wolf, dog, raccoon, etc.

If no animations are available in your current state, the menu will be empty.

## Scripted Actions

Animations can have scripted actions that trigger before, during, or after the animation plays. These require integration with your server's framework via the API abstraction layer (`API.*` calls). Scripted actions are used in plugins like farming, ranching, food, and gold panning to add/remove items and handle game logic.

## Included Plugins

Plugins extend the base animation set with additional scenarios. All of the following plugins are available:

| Plugin | Description |
|--------|-------------|
| `animals` | Animations for animal peds (horse, wolf, dog, raccoon, coyote, chicken, eagle) |
| `bankrob` | Bank robbery scenarios (doors, ransacking, vault) |
| `bartending` | Bartender and patron animations with glassware props |
| `farming` | Farming tools, harvest, and carry animations |
| `food` | Eating and drinking animations |
| `goldpan` | Gold panning in rivers and streams |
| `instruments` | Musical instrument animations (guitar, banjo, dance) |
| `medical` | Medical treatment animations |
| `oilfield` | Oilfield work animations |
| `ranching` | Ranch tool and carry animations |
| `smoking` | Smoking animations |

## Installation

Clone or place `da_xanims` in your server's resources folder:
```
resources/[da]/da_xanims
```

Add to `server.cfg` after da_log and da_lib:
```
ensure da_xanims
```

> [!IMPORTANT]
> Dependencies must be started first:
> - **da_log**
> - **da_lib**

## Adding Custom Animations

To add animations to the framework:

1. Create a Lua file in `base/lib/` (for base animations) or `plugin/<name>/lib/` (for a plugin)
2. Define an `AnimLib` entry:
   ```lua
   AnimLib.myanim = {
       id = "myanim",
       name = "My Animation",
       key = "m",
       condition = { standing = true },
       enter = { dict = "my_dict", name = "my_enter_anim", flags = AnimConfig.Flag.HoldLastFrame },
       idles = {
           { dict = "my_dict", name = "my_idle_anim", flags = AnimConfig.Flag.Loop }
       },
       animations = {
           wave = {
               name = "Wave",
               key = "w",
               enter = { dict = "my_dict", name = "my_wave_anim" },
           }
       }
   }
   ```
3. Add the file to `fxmanifest.lua` (or use the `plugin/**/lib/*.lua` wildcard for plugins)
4. Add the animation to the menu tree in `src/menu.lua`
5. Restart the resource: `restart da_xanims`

## Events

Other resources can trigger animations via events:

```lua
-- Queue an animation on the local player
TriggerEvent("da_xanims:queueAnim", "animLibName", "stateName")

-- Cancel the current animation
TriggerEvent("da_xanims:cancelAnim")

-- Force exit the current animation scenario
TriggerEvent("da_xanims:forceExit", wait)

-- Refresh condition cache (call before checking conditions)
TriggerEvent("da_xanims:batchCache")
```

## Animation Flags

Common flags from `AnimConfig.Flag`:

| Flag | Description |
|------|-------------|
| `Loop` | Animation loops continuously |
| `HoldLastFrame` | Freezes on the last frame when done |
| `UpperBody` | Plays only on the upper body |
| `Secondary` | Secondary upper body layer |
| `Gesture` | One-shot gesture |
| `Move` | `UpperBody \| Secondary` |
| `MoveLoop` | `UpperBody \| Secondary \| Loop` |

## Support

- Discord: daggre
- Discord Server: [da_dev](https://discord.com/invite/JgteBpXGaA)

## Authors and Acknowledgment

- daggre_actual (Joshua Nelson)
