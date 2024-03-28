/// @desc

if (time_hours >= 21) {
	instance_create_layer(0,room_height-64,"Instances",obj_button_startday)
}

draw_text(5,0,"Lv "+string(global.level))
draw_text(47,0,"H♥ "+string(global.rating))
draw_text(101,0,"$ "+string(global.money))
draw_text(178,0,"^ "+string(global.pixelmoney))
draw_text(240,0,"D"+string(global.day))
draw_text(265,0,"T"+time)