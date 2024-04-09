/// @desc

//time go
if (time_hours < 21) {time_seconds++}

if (time_seconds >= 15) {time_seconds = 0; time_minutes++}
if (time_minutes >= 60) {time_minutes = 0; time_hours++}

if (alarm_get(0) == -1) {
	alarm_set(0,irandom_range(500,1000))
}

//time stop
if (time_hours >= 21) {
	if (time != "End") {
		time = "End"
		global.day++
		//audio_play_sound(sfx_endday,1,0)
	}
} else {
	time = string(time_hours)+":"+string(time_minutes)
}