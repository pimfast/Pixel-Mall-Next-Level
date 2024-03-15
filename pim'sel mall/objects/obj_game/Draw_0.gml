/// @desc

if (time_hours >= 21) {
	instance_create_layer(0,room_height-64,"Instances",obj_button_startday)
}

draw_text((room_width/3)*2,0,time)