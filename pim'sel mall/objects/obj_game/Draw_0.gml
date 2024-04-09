/// @desc

if (time_hours >= 21) {
	if (!instance_exists(obj_customer)) {
		if (!audio_is_playing(mus_pixelmallupgradethemereal)) {
			audio_group_stop_all(ag_mus)
			audio_play_sound(mus_pixelmallupgradethemereal,100,1)
		}
		instance_create_layer(room_width/2,room_height-64,"Instances",obj_button_startday)
	}
}

draw_text(5,0,"Lv "+string(global.level))

var ratingstring = string(global.rating)
if (string_count(".",ratingstring) == 0) {
	ratingstring = ratingstring+".0"
} else {
	ratingstring = string_delete(ratingstring,string_pos(".",ratingstring)+2,1)
}
draw_text(47,0,"H "+ratingstring)

draw_text(101,0,"$ "+string(global.money))
draw_text(178,0,"^ "+string(global.pixelmoney))
draw_text(240,0,"D"+string(global.day))

var timestring = time
if (time_hours < 10) {
	timestring = "0"+timestring
}
if (time_minutes < 10) {
	timestring = string_insert("0",timestring,string_pos(":",timestring)+1)
}
draw_text(263,0,"T"+timestring)