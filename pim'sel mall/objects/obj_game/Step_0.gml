/// @desc music & time handling

switch (room) {
	case rm_title:
		if (!audio_is_playing(mus_pixelmall_title) && !audio_is_playing(mus_pixelmallmaybe_musicbox)) {
			audio_play_sound(mus_pixelmall_title,100,1);
		}
		break
	case rm_game:
		if (global.mode == "game") {
			//time go
			var _daytimelength = 21; //default 21
			var _minutelength = 15; //default 15
			var _hourlength = 60; //default 60
			
			if (time_hours < _daytimelength) {time_seconds++;}
			
			if (time_seconds >= _minutelength) {time_seconds = 0; time_minutes++;}
			if (time_minutes >= _hourlength) {time_minutes = 0; time_hours++;}
			
			if (alarm_get(0) == -1) {
				alarm[0] = 840; //alarm_set(0,irandom_range(300,1500))
			}
			
			//time stop
			if (time_hours >= 21) {
				if (time != "End") {
					time = "End";
					audio_play_sound(sfx_pixelmall_dayEnd,1,0);
				}
				if (!instance_exists(obj_customer)) && (obj_report.dir == "left") {
					//check if level up conditions are met
					var _oldlevel = global.level;
					considerlevelup();
					audio_group_stop_all(ag_mus);
					if (global.level > _oldlevel) {
						audio_play_sound(sfx_pixelmall_levelUp,100,0);
					} else {
						audio_play_sound(sfx_pixelmall_report,100,0);
					}
					//calculate earnings
					global.todaysmoney = (global.money - startofdaymoney);
					global.todaysrating = (global.rating - startofdayrating);
					switch (sign(global.todaysmoney)) {
						case 1:
							obj_reportarrow_income.sprite_index = spr_report_up;
							break;
						case -1:
							obj_reportarrow_income.sprite_index = spr_report_down;
							break;
						case 0:
							obj_reportarrow_income.sprite_index = noone;
							break;
					}
					switch (sign(global.todaysrating)) {
						case 1:
							obj_reportarrow_satisfaction.sprite_index = spr_report_up;
							break;
						case -1:
							obj_reportarrow_satisfaction.sprite_index = spr_report_down;
							break;
						case 0:
							obj_reportarrow_satisfaction.sprite_index = noone;
							break;
					}
					//calculate star score rating thing WIP
					var _starrating = 4;
					var _todayscustomers = global.todayshappycustomers+global.todaysupsetcustomers;
					var _danumber;
					obj_reportrating.sprite_index = asset_get_index("spr_reportrating_"+string(_starrating));
					
					obj_report.dir = "right";
				}
			} else {
				time = string(time_hours)+":"+string(time_minutes);
			}
		}
		break;
}