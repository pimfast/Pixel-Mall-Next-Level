/// @desc

audio_play_sound(mus_pixelmall_upgrade,100,1)

instance_create_layer(room_width/2,room_height-64,"Instances",obj_button_startday)
global.mode = "upgrade"
obj_report.dir = "left"

obj_game.background_day_alpha = 0
obj_button_pause.sprite_index = spr_button_back

with (obj_employeeparent) {
	x = myxspot
	y = myyspot
}

with (obj_shopparent) {
	if (level == 0) {
		sprite_index = asset_get_index("spr_store_"+string(shopname)+"_lvl1")
		image_alpha = 0.5
	}
}