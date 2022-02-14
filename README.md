# Noodle
This is a simple game where your character must move
to avoid obstacles and to hit targets.

## Todo list
- [ ] export to mobile and figure out touch controls
- [ ] make something cool happen when you capture obstacles in a tail circle
- [ ] create a different creep enemy
- [ ] squiggle/shake gesture to quickly retract the tail, or some other kind of error correction mechanic.
- [ ] add logic and labels for health and kill counters
- [ ] replace legacy creep assets
- [ ] add targets that collide with the head to grant bonus points (power ups)
- [ ] port actionrpg hiteffects to complete the hurtbox script (animatedSprite -> HitEffect.png, audiostreamplayer -> Hit.wav)


## notes
to enable editable children to force some scene children overrides, right click in project pane


## Copying
- [ ] remove this after replacing assets
`art/House In a Forest Loop.ogg` Copyright &copy; 2012 [HorrorPen](https://opengameart.org/users/horrorpen), [CC-BY 3.0: Attribution](http://creativecommons.org/licenses/by/3.0/). Source: https://opengameart.org/content/loop-house-in-a-forest

Images are from "Abstract Platformer". Created in 2016 by kenney.nl, [CC0 1.0 Universal](http://creativecommons.org/publicdomain/zero/1.0/). Source: https://www.kenney.nl/assets/abstract-platformer

Font is "Xolonium". Copyright &copy; 2011-2016 Severin Meyer <sev.ch@web.de>, with Reserved Font Name Xolonium, SIL open font license version 1.1. Details are in `fonts/LICENSE.txt`.


# Godot Meeting

## Questions
What does a productionalized/released version of my game look like?
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

Any advice or insight on my combo system?
* one tailsession is defines the tail from when you start moving until you stop moving.
* all creeps defeated within one tailsession produce bonus points
* enclosing more than 2 creeps in a tailsession (like an ouroboros) defeats them simultaneously, grants bonus points, and terminates the tailsession (like a flourish/finisher). is it as simple as checking if the head intersects any line segments in the tail?
