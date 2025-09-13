/// @desc

if (dir == "up") {ypos -= 0.1;}
if (dir == "down") {ypos += 0.1;}
if (ypos <= -0.5) {dir = "down";}
if (ypos >= 0.5) {dir = "up";}

y = starty + ypos;