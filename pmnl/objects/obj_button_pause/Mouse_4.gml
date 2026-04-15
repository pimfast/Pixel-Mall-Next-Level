/// @desc

if (!instance_exists(obj_upgradewindow)) && (obj_report.dir == "left") {
	switch (global.mode) {
		case "game":
			audio_pause_all();
			if (show_question("Paused. Press \"Yes\" to return to title.\n(Note that the day's progress will be reset upon doing so.)")) {
				audio_stop_all();
				audio_play_sound(sfx_pixelmall_click,1,0);
				
				//in case the player quits on day 1
				global.money = obj_game.startofdaymoney;
				global.rating = obj_game.startofdayrating;
				
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
			audio_stop_all();
			audio_play_sound(sfx_pixelmall_click,1,0);
				
			obj_game.time_seconds = 0;
			obj_game.time_minutes = 0;
			obj_game.time_hours = 9;
				
			obj_game.alarm[0] = -1;
			room_goto(rm_title);
			break;
	}
	audio_play_sound(sfx_pixelmall_click,1,0);
}