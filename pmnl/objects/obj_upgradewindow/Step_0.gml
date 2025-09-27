/// @desc

var _scale = image_xscale;
var _animpositions = [0,1.2,1];
var _animsp = 0.10; //factors of 10 only
if (dir = -1) && (targetpos == 1) {_animsp = 0.05};
if (dir = 1) && (targetpos == 2) {_animsp = 0.05};

if (_scale != _animpositions[targetpos]) {
	if (image_xscale < _animpositions[targetpos]) {
		image_xscale += _animsp;
		image_yscale += _animsp;
	}
	if (_scale > _animpositions[targetpos]) {
		image_xscale -= _animsp;
		image_yscale -= _animsp;
	}
} else {
	if (dir == 1) {
		if (targetpos+1 < array_length(_animpositions)) {
			targetpos += 1;
		}
	} else {
		if (targetpos > 0) {
			targetpos -= 1;
		} else {
			instance_destroy(confirmbutton);
			instance_destroy(buymorebutton);
			instance_destroy(closebutton);
			instance_destroy();
			exit;
		}
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

closebutton.x = x+(115*image_xscale);
closebutton.y = y-(199*image_yscale);
closebutton.image_xscale = image_xscale;
closebutton.image_yscale = image_yscale;