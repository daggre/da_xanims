# da_xanims
## Name
Daggre Actual's X-Anims Script

## Description
This script provides a framework for using/building custom raw animation
scenarios, it provides a tree-based hotkey ui for rapid usage, and is built on a
queue system which allows users to chain animations together.

## Installation
Clone the da_xanims repository into your servers resources folder or wherever
you wish to place the resource. Add "ensure da_xanims" to your preferred
config. (Default: server.cfg) Be sure you have all dependencies installed.

## Usage
Once you are in game, press 'X' to bring up the X-Anims menu. A small window
will appear in the bottom right of your screen, the menu will have a list of
descriptions prefixed by a keyboard key. Press the key to navigate the menu.
You can press any key that is not an option to exit the menu and return to
controlling your character

Once you activate an animation, depending on the animation you have chosen, you
will see the character perform the animation. Some animations are one-shot,
meaning that they will play and finish without any further input. Some
animations are custom scenarios. Once you have entered one of these scenarios,
your character will reach an idle state, whether that is holding a lit cigar or
leaning against a wall, from the idle state you may press 'X' to open the menu
and choose the next animation in that scenario. If you are in an animation
scenario, you may press 'X' to bring up the menu and 'C' to cancel or exit the
scenario at any time.

Some scenarios allow you to transition into different scenarios. For example,
if you have your hands behind your head in a standing hostage pose, you will
have the option to kneel down, or sit down. If you choose either of these
options you will proceed into a different idle state with different contextual
options.

All animations are conditional. You can only perform them based on the
conditions of your surroundings or state of your character. Are you dead? You
probably wont have any options. Are you on horseback or holding a weapon, you
might have some unique options based on the weapon or speed at which you are
riding. It is rather hard to drink a canteen while running.

Animations can, and many do, have scripted actions. These scripted actions may
depend on the framework you are running. Did you drink from the river, it might
quench your thirst - if your framework supports thirst.

## Plugins
The X-Anims script provides the ability to add plugins, or additional animation
scenarios to the menu. There are a number of plugins that are already supported
and they can be purchased by contacting me.

Additionally, it is possible to create your own animations using this framework.
There will be more info and resources added for how to design animations inside
the framework, but until I write that up you will need to contact me for
support.

## Support
Contact details TBA

## Dependencies
da_lib

## Authors and acknowledgment
daggre_actual

## Project status
Project is in early release.
