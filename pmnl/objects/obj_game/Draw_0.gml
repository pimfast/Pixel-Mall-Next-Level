/// @desc

switch (room) {
	case rm_title:
		draw_set_font(fnt_2);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_text(253,335,"Play");
		draw_text(53,359,global.pixelmoney);
		draw_text(53,401,global.gameUser);
		
		break;
	case rm_game:
		draw_set_font(fnt_1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		var _uipositiony = 12;
		
		//hud
		draw_set_color(c_black);
		draw_text(30,11,string(global.level));
		
		draw_set_halign(fa_center);
		draw_set_color(c_yellow);
		var _ratingstring = string(global.rating);
		if (string_count(".",_ratingstring) == 0) {
			_ratingstring = _ratingstring+".0";
		} else {
			_ratingstring = string_delete(_ratingstring,string_pos(".",_ratingstring)+2,1);
		}
		draw_text(75,_uipositiony,_ratingstring);
		
		draw_text(138,_uipositiony,string(global.money));
		
		draw_set_color(#05D1FF)
		draw_text(208,_uipositiony,string(global.pixelmoney));

		draw_set_color(#C0EA0C)
		draw_text(258,_uipositiony,string(global.day));
		
		var _timestring = time;
		if (time != "End") {
			if (time_hours < 10) {
				_timestring = "0"+_timestring;
			}
			if (time_minutes < 10) {
				_timestring = string_insert("0",_timestring,string_pos(":",_timestring)+1);
			}
		}
		draw_text(298,_uipositiony,_timestring);
		
		//more time = less alpha
		//layer_background_alpha(layer_background_get_id(layer_get_id("Background_Day")),lerp(0, 1, time_hours))
		layer_background_alpha(layer_background_get_id(layer_get_id("Background_Day")),background_day_alpha);
		if (time_hours >= 12) {background_day_alpha -= 0.00015;}
		break;
}