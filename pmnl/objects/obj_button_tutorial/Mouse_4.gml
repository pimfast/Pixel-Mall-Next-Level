/// @desc

audio_play_sound(sfx_pixelmall_click,1,0);
image_index += 1;

if (image_index >= 9) {
	audio_stop_sound(mus_pixelmall_musicbox);
	audio_play_sound(mus_pixelmall_title,100,1);
	//destroy this object after 1 frame (to avoid clicking on extra buttons)
	alarm[0] = 1;
}