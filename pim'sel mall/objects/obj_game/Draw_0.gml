/// @desc

switch (room) {
	case rm_title:
		draw_set_font(fnt_2)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_set_color(c_white)
		draw_text(230,322,"Play")
		draw_text(38,345,20)
		draw_text(5,385,">name<")
		break
	case rm_game:
		draw_set_font(fnt_1)
		draw_set_halign(fa_left)
		draw_set_valign(fa_middle)
		var uipositiony = 12
		
		//hud
		draw_set_color(c_black)
		draw_text(30,11,string(global.level))
		
		draw_set_halign(fa_center)
		draw_set_color(c_yellow)
		var ratingstring = string(global.rating)
		if (string_count(".",ratingstring) == 0) {
			ratingstring = ratingstring+".0"
		} else {
			ratingstring = string_delete(ratingstring,string_pos(".",ratingstring)+2,1)
		}
		draw_text(75,uipositiony,ratingstring)
		
		draw_text(138,uipositiony,string(global.money))
		
		draw_set_color(#05D1FF)
		draw_text(208,uipositiony,string(global.pixelmoney))

		draw_set_color(#C0EA0C)
		draw_text(258,uipositiony,string(global.day))
		
		var timestring = time
		if (time != "End") {
			if (time_hours < 10) {
				timestring = "0"+timestring
			}
			if (time_minutes < 10) {
				timestring = string_insert("0",timestring,string_pos(":",timestring)+1)
			}
		}
		draw_text(298,uipositiony,timestring)
		
		//more time = less alpha
		//layer_background_alpha(layer_background_get_id(layer_get_id("Background_Day")),lerp(0, 1, time_hours))
		layer_background_alpha(layer_background_get_id(layer_get_id("Background_Day")),background_day_alpha)
		if (time_hours >= 12) {background_day_alpha -= 0.000075}
		break
}