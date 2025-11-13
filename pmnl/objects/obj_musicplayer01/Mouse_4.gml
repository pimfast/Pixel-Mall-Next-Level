/// @desc

if (global.mode == "game") {
	if (myusecount > 0) {
		audio_play_sound(sfx_pixelmall_click,1,0);
		myusecount -= 1;
		active = true;
		alarm[0] = activelength;
		alarm[1] = 1;
	}
}