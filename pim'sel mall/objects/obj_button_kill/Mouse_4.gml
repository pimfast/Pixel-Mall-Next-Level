/// @desc

if (global.mode == "game") {
	audio_play_sound(sfx_pixelmall_click,1,0)
	with (obj_employeeparent) {
		alarm[0] = -1
		attending = noone
	}
	with (obj_shopparent) {
		serving = noone
		attended = false
		tobeattended = false
		myemployee = noone
	}
	with (obj_customerbubble) {
		instance_destroy()
	}
	with (obj_customer) {
		instance_create_layer(x,y,"Instances",obj_bloodsplatter)
		audio_play_sound(sfx_killsplosion,1,0)
		instance_destroy()
	}
	global.customerline = [noone,noone,noone,noone,noone]
	global.checkoutline = [noone,noone,noone,noone]
}