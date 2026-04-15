/// @desc

draw_self();

if (buttoncount == 1) {
	draw_set_font(fnt_2);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text_color(room_width/2,room_height/3,"Click again to reset save", c_white, c_white, c_white, c_white, messalph);
	messalph -= 0.01;
	if (messalph <= 0) {
		buttoncount -= 1;
		messalph = 1;
	}
}