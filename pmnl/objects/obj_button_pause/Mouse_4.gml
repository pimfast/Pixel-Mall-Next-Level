/// @desc

audio_play_sound(sfx_pixelmall_click,1,0)
if (!instance_exists(obj_upgradewindow)) && (obj_report.dir == "left") {
	switch (global.mode) {
		case "game":
			audio_pause_all();
			if (show_question("Paused. Press \"Yes\" to return to title.\n(Note that progress will be reset upon doing so.)")) {
				audio_resume_all();
				audio_group_stop_all(ag_mus);
				global.level = 1;
				obj_game.alarm[0] = -1;
				room_goto(rm_title);
			}
			audio_resume_all();
			//changemoney(+150)
			//changerating(+0.5)
			//audio_play_sound(sfx_pixelmall_moneyUp,1,0)
			break;
		case "upgrade":
			audio_pause_all();
			if (show_question("Are you sure?\nNote that in this build, progress is lost upon returning to the menu.")) {
				audio_resume_all();
				audio_group_stop_all(ag_mus);
				global.level = 1;
				obj_game.alarm[0] = -1;
				room_goto(rm_title);
			}
			audio_resume_all();
			break;
	}
}