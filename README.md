# Noodle
This is a simple game where your character must move
to avoid obstacles and to hit targets.

## Todo list
- [x] export to mobile and figure out touch controls
    - [x] get android emulator and apk export to work
    - [x] how to make responsive resolution?
- [ ] make something cool happen when you capture obstacles in a tail circle
- [ ] make an enemy that very slowly chases you
- [ ] create a different creep enemy
- [ ] squiggle/shake gesture to quickly retract the tail, or some other kind of error correction mechanic.
- [ ] add logic and labels for health and kill counters
    - [ ] fix overlap of score and timer 
- [ ] replace legacy creep assets
- [ ] add targets that collide with the head to grant bonus points (power ups)
    - [ ] why can I pick up powerups before pressing start?
    - [ ] why don't they respawn?
- [ ] port actionrpg hiteffects to complete the hurtbox script (animatedSprite -> HitEffect.png, audiostreamplayer -> Hit.wav)


## notes
to enable editable children to force some scene children overrides, right click in project pane
sdkmanager --sdk_root=C:\Users\lucas\AppData\Local\Android\Sdk "platform-tools" "build-tools;30.0.3" "platforms;android-29" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;21.4.7075529"

## Copying
- [ ] remove this after replacing assets
`art/House In a Forest Loop.ogg` Copyright &copy; 2012 [HorrorPen](https://opengameart.org/users/horrorpen), [CC-BY 3.0: Attribution](http://creativecommons.org/licenses/by/3.0/). Source: https://opengameart.org/content/loop-house-in-a-forest

Images are from "Abstract Platformer". Created in 2016 by kenney.nl, [CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.kenney.nl/assets/abstract-platformer

Font is "Xolonium". Copyright &copy; 2011-2016 Severin Meyer <sev.ch@web.de>, with Reserved Font Name Xolonium, SIL open font license version 1.1. Details are in `fonts/LICENSE.txt`.


# Godot Meeting

## Questions
What does a productionalized/released version of my game look like?
* gameplay loop, audience, devices, theme (ramen), goal license

# gameplay loop:
** ourobouras shapes: something cool should happen.
** wow moment!
** tail grows longer to a certain length. make weak enemies that suggest ways to hack the loops
then make monsters that no longer fall for it.
# audience
* if I want people to enjoy it:
** depends on testing! QA woot!
** developer bias, I know the whitebox
** have gameplay tests with new people, take notes, all that good stuff.
** go somewhere familiar, hey you wanna play it, then watch!
** all ages should be able to play.
# missing
* visual theme
* decide on input lag for touch, it may be better to have responsiveness


* Is any of it salvagable or should I just start refactoring it?
* Any things to keep an eye out for as I proceed down this path?
* Can you plot a course for the beginner's mind?

How can I do pinpoint performance problems?
* I feel like the creeps slowdown sometimes

Can you suggest a good resource on how to palette swap my creeps?
* I want to try an ikaruga mechanic

The theme is cooking up to be about a dragon in a ramen bowl. Like a nyan cat, but a dragon with ramen.
Any advice or insight on:
* Ripple animations to represent the wet surface of the soup
* need a shader. godot shader, water simulation, animations, particle system is a good option, particsl 2d node atatchedc to player     
* shad3r course and videos!
* free intro to shaders
* shockwave shader

Any advice or insight on my combo system?
* one tailsession is defines the tail from when you start moving until you stop moving.
* all creeps defeated within one tailsession produce bonus points
* enclosing more than 2 creeps in a tailsession (like an ouroboros) defeats them simultaneously, grants bonus points, and terminates the tailsession (like a flourish/finisher). is it as simple as checking if the head intersects any line segments in the tail?


chat links:
[] rewatch the video and capture notes
Geometry.intersect_polyline_with_polygon_2d(polyline: PoolVector2Array, polygon: PoolVector2Array)

https://www.youtube.com/watch?v=mRixyMUr5VM
https://github.com/GDQuest/godot-shaders
https://github.com/GDQuest/godot-visual-effects
https://github.com/GDQuest/learn-gdscript
https://gdquest.github.io/learn-gdscript/staging/


## Android notes
### The setup that worked for me
I encountered this problem today in Godot 3.4.2. Like you, I tried experimented with changing several paths, installing new versions of build_tools and upgrading my JDK. The following finally fixed my issue:

    Uninstall OpenJDK 11 (and OpenJDK 8, if you have it)
    Uninstall Android Studio
    Delete all files from %USER_HOME%\appdata\Local\Android\Sdk
    Reinstall OpenJDK 11
    Install the Android SDK using the command line tools described in Godot's instructions: sdkmanager --sdk_root=<android_sdk_path> "platform-tools" "build-tools;30.0.3" "platforms;android-29" "cmdline-tools;latest" "cmake;3.10.2.4988404" "ndk;21.4.7075529"

I think the most crucial step is deleting the files from %USER_HOME%\appdata\Local\Android\Sdk. 

### then install android studio to get emulator and rest of steps like debug key etc etc
start emulator
cd C:\Users\lucas\AppData\Local\Android\Sdk\platform-tools-2
.\adb.exe install ..\tools\Noodles.apk

### how to run emulator
open android studio
choose virtual device manager from dropdown
run an emulator
click the android button that's now beside the play button

