/// @desc

//audio_play_sound(sfx_pixelmall_click,1,0)
if (!instance_exists(obj_button_tutorial)) {
	if (audio_group_get_gain(ag_mus) != 0) {
		audio_group_set_gain(ag_mus,0,0)
		audio_group_set_gain(ag_sfx,0,0)
	} else {
		audio_group_set_gain(ag_mus,1,0)
		audio_group_set_gain(ag_sfx,1,0)
	}
}