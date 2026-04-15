/// @desc

draw_self();

draw_set_font(fnt_1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
var _sep = 15;
var _w = room_width-10;
switch (image_index) {
	case 5:
		draw_text_ext(room_width/2,room_height/4,loadlanguage(global.lang)[5],_sep,_w);
		draw_text_ext(room_width/2,room_height*0.75,loadlanguage(global.lang)[6],_sep,_w);
		break;
	case 6:
		draw_text_ext(room_width/2,room_height*0.75,loadlanguage(global.lang)[7],_sep,_w);
		draw_text_ext(room_width/2,room_height/4,loadlanguage(global.lang)[8],_sep,_w);
		break;
	case 7:
		draw_text_ext(room_width/2,room_height/4,loadlanguage(global.lang)[9],_sep,_w);
		break;
	case 8:
		draw_text_ext(room_width/2,room_height/2,loadlanguage(global.lang)[10],_sep,_w);
		break;
	default:
		draw_text_ext(room_width/2,room_height/4,loadlanguage(global.lang)[image_index],_sep,_w);
		break;
}