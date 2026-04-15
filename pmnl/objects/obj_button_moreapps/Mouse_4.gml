/// @desc

if (!instance_exists(obj_button_tutorial)) {
	audio_play_sound(sfx_pixelmall_click,1,0);
	
	if (window_get_fullscreen()) {
		window_set_fullscreen(false);
	} else {
		window_set_fullscreen(true);
	}
}