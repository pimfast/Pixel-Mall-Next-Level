/// @desc music & time handling

//mouse sprites
var _touchingbutton = instance_position(mouse_x,mouse_y,obj_buttonparent);
if (!_touchingbutton) {
	if (global.mode == "upgrade") {
		_touchingbutton = instance_position(mouse_x,mouse_y,obj_upgradeableparent);
		if (!_touchingbutton) || (_touchingbutton.level <= -1) {
			_touchingbutton = false;
		}
	} else {
		_touchingbutton = instance_position(mouse_x,mouse_y,obj_customer);
		if (!_touchingbutton) || (_touchingbutton.state != "waitingfor_shop") {
			_touchingbutton = instance_position(mouse_x,mouse_y,obj_shopparent);
			if (!_touchingbutton) || (_touchingbutton.myemployee != noone) || (_touchingbutton.attended == true) || (_touchingbutton.level <= 0) {
				_touchingbutton = instance_position(mouse_x,mouse_y,obj_miscpartparent);
				if (!_touchingbutton) || (_touchingbutton.displayname == "Elevators") {
					_touchingbutton = false;
				}
			}
		}
	}
}

if (_touchingbutton) {
	window_set_cursor(cr_handpoint);
} else {
	window_set_cursor(cr_default);
}


switch (room) {
	case rm_title:
		if (!audio_is_playing(mus_pixelmall_title) && !audio_is_playing(mus_pixelmallmaybe_musicbox)) {
			audio_play_sound(mus_pixelmall_title,100,1);
		}
		break
	case rm_game:
		if (global.mode == "game") {
			//time go
			var _daytimelength = 21; //closing time, default 21
			var _minutelength = 12; //how many seconds make a minute, default 12
			var _hourlength = 60; //how many minutes make an hour, default 60
			
			if (time_hours < _daytimelength) {time_seconds++;}
			
			if (time_seconds >= _minutelength) {time_seconds = 0; time_minutes++;}
			if (time_minutes >= _hourlength) {time_minutes = 0; time_hours++;}
			
			//set the create customer timer
			if (alarm_get(0) == -1) {
				if (global.level <= 10) {
					alarm[0] = (levelcustomerinterval[global.level] * 60); //alarm_set(0,irandom_range(300,1500))
				} else {
					alarm[0] = levelcustomerinterval[10];
				}
			}
			
			//public class FruitPrettyFacilityUserGenerator extends PrettyFacilityUserGenerator {
			//    public boolean canGenerateFacilityUser(float stageTime, float currentScore, int currentUserCount, boolean isBlocked) {
			//        boolean result;
			//        if (isBlocked) {
			//            return false;
			//        }
			//        if (getMaxFacilityUserCount() > 0 && currentUserCount >= getMaxFacilityUserCount()) {
			//            return false;
			//        }
			//        float resultSpawnInterval = getSpawnInterval() + ((500.0f - currentScore) / getAffectByScore());
			//        if (resultSpawnInterval < getMinSpawnInterval()) {
			//            result = stageTime - getSpawnTimer() > getMinSpawnInterval();
			//        } else {
			//            result = stageTime - getSpawnTimer() > resultSpawnInterval;
			//        }
			//        return result;
			//    }
			//}
			
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