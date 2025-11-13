/// @desc

if (!instance_exists(obj_button_tutorial)) {
	if (instance_position(mouse_x,mouse_y,self)) && (mouse_check_button(mb_left)) {
		audio_play_sound(sfx_pixelmall_click,1,0);
		room_goto(rm_game);
	}
}