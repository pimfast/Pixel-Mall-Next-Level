/// @desc

if (go == "big") {
	image_xscale += (0.1*scalerate)
	image_yscale += (0.1*scalerate)
} else {
	image_xscale -= (0.1*scalerate)
	image_yscale -= (0.1*scalerate)
}

if (1 == 1 /*replace with (!sprite_index == spr_bubble_hourglass) later*/) {
	if (image_xscale <= 1) {go = "big"}
	if (image_xscale >= 1.5) {go = "small"}
}