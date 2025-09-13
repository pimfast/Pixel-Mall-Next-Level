/// @desc

if (string_count("urgent",string(sprite_index)) >= 1) {
	scalerate = 0.5;
} else {
	if (sprite_index == spr_customerbubble_purchasing) || (sprite_index == spr_customerbubble_waiting) || (sprite_index == spr_customerbubble_linefull) || (sprite_index == spr_customerbubble_linefull_urgent) {
		scalerate = 0;
		image_xscale = 1;
		image_yscale = 1;
		if (sprite_index == spr_customerbubble_waiting) || (sprite_index == spr_customerbubble_linefull) ||(sprite_index == spr_customerbubble_linefull_urgent) {
			if (dir == "up") {ypos -= 0.2;}
			if (dir == "down") {ypos += 0.2;}
			if (ypos <= -42) {dir = "down";}
			if (ypos >= -38) {dir = "up";}
		}
	} else {
		scalerate = 0.25;
	}
}

x = thinker.x;
y = thinker.y+ypos;

if (go == "big") {
	image_xscale += (0.1*scalerate);
	image_yscale += (0.1*scalerate);
} else {
	image_xscale -= (0.1*scalerate);
	image_yscale -= (0.1*scalerate);
}
if (image_xscale <= 1) {go = "big";}
if (image_xscale >= 1.5) {go = "small";}