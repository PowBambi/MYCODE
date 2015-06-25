he initial appearance of a door is usually "Nearby [an item described] leads [item described direction]." The description of a door is usually "[if open]It stands open[otherwise]It is closed[end if][if locked] and locked[otherwise] and unlocked[end if]."
To say (item - a thing) direction:
let place be a random room;
let the place be the other side of the item;
if the place is visited, say "[way through the item] to [the place in lower case]";
otherwise say "[way through the item]".
Instead of attacking a closed door: say "[The noun] reverberates but does not open."
Understand "knock on [something]" or "knock [something]" as attacking. Understand the commands "bang" and "tap" and "rap" as "knock".
Before printing the name of an open door (called target) when looking or going:
if the target is a staircase, do nothing;
otherwise say "open ".
To decide what direction is the way through (threshold - a door):
let far side be the other side of threshold;
let way be the best route from the location to the far side, using even locked doors;
if way is a direction, decide on the way;
decide on inside.
Instead of looking under something which is carried by the player:
say "Since you are holding [the noun], it stands to reason that nothing of interest could be concealed beneath."
Instead of looking under something which is worn by the player:
say "Underneath there is only yourself."
Instead of looking under a door:
say "[The noun] meets the floor with very little space to spare."