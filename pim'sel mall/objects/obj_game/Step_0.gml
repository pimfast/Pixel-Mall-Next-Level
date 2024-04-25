/// @desc

switch (room) {
	case rm_title:
		if (!audio_is_playing(mus_pixelmall_title)) {
			audio_play_sound(mus_pixelmall_title,100,1)
		}
		break
	case rm_game:
		if (global.mode == "game") {
			//time go
			if (time_hours < 21) {time_seconds++}

			if (time_seconds >= 1/*15*/) {time_seconds = 0; time_minutes++}
			if (time_minutes >= 10/*60*/) {time_minutes = 0; time_hours++}

			if (alarm_get(0) == -1) {
				alarm_set(0,irandom_range(500,1000))
			}

			//time stop
			if (time_hours >= 21) {
				if (time != "End") {
					time = "End"
					global.day++
					audio_play_sound(sfx_pixelmall_dayEnd,1,0)
				}
				if (!instance_exists(obj_customer)) && (obj_report.dir == "left") {
					audio_group_stop_all(ag_mus)
					audio_play_sound(sfx_pixelmall_report,100,0)
					obj_report.dir = "right"
				}
			} else {
				time = string(time_hours)+":"+string(time_minutes)
			}
		}
		break
}