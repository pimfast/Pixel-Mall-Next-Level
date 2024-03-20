/// @desc

if (time_hours >= 21) {
	instance_create_layer(0,room_height-64,"Instances",obj_button_startday)
}

draw_text(20,0,"Lv"+string(global.level))
draw_text(50,0,"H♥"+string(global.rating))
draw_text(80,0,"$"+string(global.money))
draw_text(150,0,"^"+string(global.pixelmoney))
draw_text(210,0,"D"+string(global.day))
draw_text(240,0,"T"+time)