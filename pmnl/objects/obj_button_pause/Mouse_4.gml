/// @desc

audio_play_sound(sfx_pixelmall_click,1,0);
if (!instance_exists(obj_upgradewindow)) && (obj_report.dir == "left") {
	switch (global.mode) {
		case "game":
			audio_pause_all();
			if (show_question("Paused. Press \"Yes\" to return to title.\n(Note that the day's progress will be undone\n and all employee/shop levels will be reset upon doing so.)")) {
				audio_resume_all();
				audio_group_stop_all(ag_mus);
				
				//global.level = 1;
				//global.day = 1;
				global.customerline = [noone,noone,noone,noone,noone];
				global.checkoutline = [noone,noone,noone,noone];
				obj_game.time_seconds = 0;
				obj_game.time_minutes = 0;
				obj_game.time_hours = 9;
				
				obj_game.alarm[0] = -1;
				room_goto(rm_title);
			}
			audio_resume_all();
			break;
		case "upgrade":
			audio_pause_all();
			if (show_question("Are you sure?\nNote that in this build, all employee/shop levels are reset upon quitting or returning to the menu.")) {
				audio_resume_all();
				audio_group_stop_all(ag_mus);
				
				//global.level = 1;
				//global.day = 1;
				obj_game.time_seconds = 0;
				obj_game.time_minutes = 0;
				obj_game.time_hours = 9;
				
				obj_game.alarm[0] = -1;
				room_goto(rm_title);
			}
			audio_resume_all();
			break;
	}
}