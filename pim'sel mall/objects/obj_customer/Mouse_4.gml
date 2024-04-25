/// @desc

if (moveable == true) {
	audio_play_sound(sfx_pixelmall_dragStart,1,0)
	global.heldcustomer = self.id
	beingmoved = true
	image_blend = make_color_hsv(255,0,50)
	image_xscale *= 1.25
	image_yscale *= 1.25
}