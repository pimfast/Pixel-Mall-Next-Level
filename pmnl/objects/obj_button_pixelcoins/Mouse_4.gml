/// @desc

if (!instance_exists(obj_button_tutorial)) {
	audio_play_sound(sfx_pixelmall_click,1,0);
	if (global.debugmode) {
		global.pixelmoney++;
		savegame(global.gameUser);
	} else {
		if (show_question("Would you like to watch a video for +50 pixel coins?")) {
			url_open("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
			global.pixelmoney += 50;
			savegame(global.gameUser);
		}
		audio_play_sound(sfx_pixelmall_click,1,0);
	}
}