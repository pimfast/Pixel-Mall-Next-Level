/// @desc

if (string_count("urgent",string(sprite_index)) >= 1) {
	scalerate = 1
} else {
	if (sprite_index == spr_customerbubble_waiting) || (sprite_index == spr_customerbubble_purchasing) {
		scalerate = 0
		//image_xscale = 1
		//image_yscale = 1
	} else {
		scalerate = 0.5
	}
}

x = thinker.x
y = thinker.y-40

if (go == "big") {
	image_xscale += (0.1*scalerate)
	image_yscale += (0.1*scalerate)
} else {
	image_xscale -= (0.1*scalerate)
	image_yscale -= (0.1*scalerate)
}
if (image_xscale <= 1) {go = "big"}
if (image_xscale >= 1.5) {go = "small"}