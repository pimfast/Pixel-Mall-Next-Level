/// @desc

draw_self()

draw_set_font(fnt_2)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_dkgray)

var _title = string(selectedmallpart.shoptype)+" Lv"+string(selectedmallpart.level+1)
var _pic = spr_igloo_hireicon
var _desc = "description"
//calculate mall price (this isn't at all how it's supposed to work)
var _price
if (selectedmallpart.level == 0) {
	_price = 1000
} else {
	_price = selectedmallpart.level*800
}


draw_text_transformed(x,y-(180*image_yscale),_title,image_xscale*1.5,image_yscale*1.5,0)
draw_set_font(fnt_1)
draw_text_transformed(x,y-(50*image_yscale),_desc,image_xscale,image_yscale,0)
draw_set_font(fnt_2)
draw_set_color(c_white)
draw_text_transformed(x+(15*image_xscale),y+(10*image_yscale),_price,image_xscale*1.5,image_yscale*1.5,0)