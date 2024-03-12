/// @desc

if (time_hours < 21) {
	draw_text((room_width/3)*2,0,string(time_hours)+":"+string(time_minutes))
} else {
	draw_text((room_width/3)*2,0,"End")
	instance_create_layer(0,room_height-64,"Instances",obj_startday_button)
}

time_seconds++

if (time_seconds >= 15) {time_seconds = 0; time_minutes++}
if (time_minutes >= 60) {time_minutes = 0; time_hours++}