/// @desc

draw_self();

draw_set_font(fnt_2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_dkgray);

draw_text_transformed(x,y,"OK",image_xscale*1.5,image_yscale*1.5,0);

if (!upgradewindow.selectedmallpart.levelcurrency[upgradewindow.mallpartlevel+1]) {
	if (global.money < upgradewindow.selectedmallpart.levelprice[upgradewindow.mallpartlevel+1]) {
		image_blend = make_color_hsv(255,0,50);
	} else {
		//this only really needs to be here to account for debug mode
		image_blend = make_color_hsv(0,0,255);
	}
} else {
	if (global.pixelmoney < upgradewindow.selectedmallpart.levelprice[upgradewindow.mallpartlevel+1]) {
		image_blend = make_color_hsv(255,0,50);
	} else {
		//this only really needs to be here to account for debug mode
		image_blend = make_color_hsv(0,0,255);
	}
}