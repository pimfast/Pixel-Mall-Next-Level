/// @desc

//if (variable_instance_exists(self,"customerbubble")) && (customerbubble.sprite_index != noone) {
//	var _bubblename = string(customerbubble.sprite_index);
//	var _newname = _bubblename;
//	if (string_ends_with(_bubblename,"_urgent")) {
//		_newname = string_delete(_bubblename,string_pos("_urgent",_bubblename),7);
//		customerbubble.sprite_index = asset_get_index(_newname);
//		show_debug_message("oldname: "+_bubblename);
//		show_debug_message("newname: "+_newname);
//	}
//}
//urgent = true;
//urgent = false;

if (thinker.alarm[1] != -1) {
	scalerate = 0.5;
	if (!string_ends_with(string(sprite_index),"_urgent")) {
		if (sprite_index == spr_customerbubble_request) {
			sprite_index = spr_customerbubble_request_urgent;
		} else {
			sprite_index = asset_get_index("spr_customerbubble_"+string(thinker.desiredstore)+"_urgent");
		}
	}
} else {
	if (string_ends_with(string(sprite_index),"_urgent")) {
		if (sprite_index == spr_customerbubble_request_urgent) {
			sprite_index = spr_customerbubble_request;
		} else {
			sprite_index = asset_get_index("spr_customerbubble_"+string(thinker.desiredstore));
		}
	}
	
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

////delete probably
//if (string_count("urgent",string(sprite_index)) >= 1) {
//	scalerate = 0.5;
//} else {
//	if (sprite_index == spr_customerbubble_purchasing) || (sprite_index == spr_customerbubble_waiting) || (sprite_index == spr_customerbubble_linefull) || (sprite_index == spr_customerbubble_linefull_urgent) {
//		scalerate = 0;
//		image_xscale = 1;
//		image_yscale = 1;
//		if (sprite_index == spr_customerbubble_waiting) || (sprite_index == spr_customerbubble_linefull) ||(sprite_index == spr_customerbubble_linefull_urgent) {
//			if (dir == "up") {ypos -= 0.2;}
//			if (dir == "down") {ypos += 0.2;}
//			if (ypos <= -42) {dir = "down";}
//			if (ypos >= -38) {dir = "up";}
//		}
//	} else {
//		scalerate = 0.25;
//	}
//}

//x = thinker.x;
//y = thinker.y+ypos;

//if (go == "big") {
//	image_xscale += (0.1*scalerate);
//	image_yscale += (0.1*scalerate);
//} else {
//	image_xscale -= (0.1*scalerate);
//	image_yscale -= (0.1*scalerate);
//}
//if (image_xscale <= 1) {go = "big";}
//if (image_xscale >= 1.5) {go = "small";}