/// @desc

draw_self();

draw_set_font(fnt_2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_dkgray);

if (room == rm_title) {
	if (global.debugmode) {
		draw_text_transformed(x,y,"Debug\nEnabled",image_xscale,image_yscale,0);
	} else {
		draw_text_transformed(x,y,"Debug\nDisabled",image_xscale,image_yscale,0);
	}
} else {
	if (!upgradewindow.selectedmallpart.levelcurrency[upgradewindow.mallpartlevel+1]) {
		draw_text_transformed(x,y,"Get\nMoney",image_xscale,image_yscale,0);
	} else {
		draw_text_transformed(x,y,"Get\nShop Points",image_xscale,image_yscale,0);
	}
}