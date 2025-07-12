/// @desc

if (dir == "open") {
	//open
	if (image_xscale < 1) {
		image_xscale += 0.10;
	}
	if (image_yscale < 1) {
		image_yscale += 0.10;
	}
} else {
	//close
	if (image_xscale > 0) {
		image_xscale -= 0.10;
	}
	if (image_yscale > 0) {
		image_yscale -= 0.10;
	}
	if (image_xscale <= 0) && (image_yscale <= 0) {
		instance_destroy(confirmbutton);
		instance_destroy(buymorebutton);
		instance_destroy(closebutton);
		instance_destroy();
		exit;
	}
}
confirmbutton.x = x-(75*image_xscale);
confirmbutton.y = y+(100*image_yscale);
confirmbutton.image_xscale = image_xscale*0.9;
confirmbutton.image_yscale = image_yscale*0.9;

buymorebutton.x = x+(75*image_xscale);
buymorebutton.y = y+(100*image_yscale);
buymorebutton.image_xscale = image_xscale*0.9;
buymorebutton.image_yscale = image_yscale*0.9;

closebutton.x = x+(100*image_xscale);
closebutton.y = y-(200*image_yscale);
closebutton.image_xscale = image_xscale;
closebutton.image_yscale = image_yscale;