# Daggre Actual's X-Anims Script (da_xanims)

## Version & Status
v0.8 - Early Release

## Description
This script provides a framework for using/building custom raw animation
scenarios, it provides a tree-based hotkey ui for rapid usage, and is built on a
queue system which allows users to chain animations together. Animations use
environment based conditions and script hooks to create an immersive way to
interact with your game world.

## Usage
Once you are in game, press '**X**' to bring up the X-Anims menu. A small window
will appear in the bottom right of your screen, the menu will have a list of
descriptions followed by an icon of a keyboard key. Press the key to navigate the
menu. Press any unlisted key to exit the menu.

Once you activate an animation, you will see the character perform the animation.
There are various types of animations, some play and exit, others enter into an
interactive scenario. Once you have entered one of these scenarios, your
character will reach an idle state, from the idle state you may press '**X**' to
open the menu and queue the next animation in that scenario. If you wish to exit
an animation scenario, press '**X**' to bring up the menu and press '**C**' to
exit.

Some scenarios allow you to transition into different scenarios which may change
the idle state you return to for the scenario and give you a whole new series of
animations to queue from.

All animations are conditional. You can only perform them based on the
conditions of your surroundings or state of your character. Are you dead? You
probably wont have any options. Are you on horseback or holding a weapon, you
might have some unique options based on the weapon or speed at which you are
riding.

Animations can have scripted actions. Scripted actions require integration with
your server's framework. Scripted actions may occur prior to, during, or upon
finishing an animation. The scripted actions are integrated into features like
the farming and ranching scripts.

## Plugins
The X-Anims script provides the ability to add plugins which are additional
animation scenarios to the menu. There are a number of plugins that are already
supported and they can be purchased. They range from full features, like farming
and ranching to specific categories like animal peds.

Additionally, it is possible to create your own animations or plugins using this
framework. There will be more info and resources added for how to design
animations inside the framework, but until I write that up you will need to
contact me for support.

## Installation
Clone the **da_xanims** repository into your servers resources folder:
```
cd resources
git clone git@github.com:daggre/da_xanims.git
```
Add `ensure da_xanims` to your preferred resource config. (Default: server.cfg)

> [!IMPORTANT]
> Be sure you have all dependencies installed:
> - **da_lib**

## Support
- Discord: daggre
- Discord Server: [da_dev](https://discord.com/invite/JgteBpXGaA)

## Authors and Acknowledgment
- daggre_actual
