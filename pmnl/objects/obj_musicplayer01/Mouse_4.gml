/// @desc

if (global.mode == "game") {
	if (myusecount > 0) {
		audio_play_sound(sfx_pixelmall_click,1,0);
		
		audio_play_sound(mus_pixelmall_musicbox,100,1);
		audio_pause_sound(mus_pixelmall_gameplay1);
		audio_pause_sound(mus_pixelmall_gameplay2);
		
		myusecount -= 1;
		active = true;
		alarm[0] = activelength;
		alarm[1] = 1;
	} else {
		audio_play_sound(sfx_pixelmall_dragCancel,1,0);
	}
}