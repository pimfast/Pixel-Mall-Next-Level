/// @desc

draw_self()

draw_set_font(fnt_2)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_dkgray)

draw_text_transformed(x,y,"OK",image_xscale*1.5,image_yscale*1.5,0)

//calculate mall price (this isn't at all how it's supposed to work)
if (upgradewindow.selectedmallpart.level == 0) {
	upgradeprice = 1000
} else {
	upgradeprice = upgradewindow.selectedmallpart.level*800
}

if (global.money < upgradeprice) {
	image_blend = make_color_hsv(255,0,50);
}