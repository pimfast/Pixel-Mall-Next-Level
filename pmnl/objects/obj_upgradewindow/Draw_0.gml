/// @desc

draw_self();

draw_set_font(fnt_2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_dkgray);

//show_debug_message(string(selectedmallpart));
//show_debug_message(string(selectedmallpart.leveldesc));

//preferably we would set this in the create event but then it wouldn't be able to access the data
var _title = selectedmallpart.name+" Lv"+string(mallpartlevel+1);
var _desc = selectedmallpart.leveldesc[mallpartlevel+1];
var _price = selectedmallpart.levelprice[mallpartlevel+1];

//draw text
draw_text_transformed(x,y-(180*image_yscale),_title,image_xscale,image_yscale,0);
draw_set_font(fnt_1);
draw_text_transformed(x,y-(50*image_yscale),_desc,image_xscale,image_yscale,0);
draw_set_font(fnt_2);
draw_set_color(c_white);
draw_text_transformed(x+(15*image_xscale),y+(10*image_yscale),_price,image_xscale*1.5,image_yscale*1.5,0);

//draw related image sprites
var _s;
var _sw;
var _sh;
if (variable_instance_exists(selectedmallpart.id,"levelpic")) {
	//miscellaneous things with unique purchase menu images for each level
	_s = selectedmallpart.levelpic[mallpartlevel+1];
} else {
	if (object_get_parent(selectedmallpart.object_index) == obj_employeeparent) {
		//employees use unique purchase menu images but they stay the same every level
		_s = asset_get_index("spr_"+selectedmallpart.employeename+"_hireicon");
	} else {
		//for shops
		_s = spr_shopupgradebg;
		_sw = sprite_get_width(_s)*image_xscale;
		_sh = sprite_get_height(_s)*image_yscale;
		draw_sprite_stretched(_s,0,x-(_sw/2),y-(_sh/2)-(115*image_yscale),_sw,_sh);
	
		_s = asset_get_index("spr_store_"+string(selectedmallpart.shopname)+"_lvl"+string(mallpartlevel+1));
	}
}
_sw = sprite_get_width(_s)*image_xscale;
_sh = sprite_get_height(_s)*image_yscale;
draw_sprite_stretched(_s,0,x-(_sw/2),y-(_sh/2)-(115*image_yscale),_sw,_sh);

//draw currency sprites
if (!selectedmallpart.levelcurrency[mallpartlevel+1]) {
	_s = spr_icon_money;
} else {
	_s = spr_icon_point;
}
_sw = sprite_get_width(_s)*image_xscale;
_sh = sprite_get_height(_s)*image_yscale;
draw_sprite_stretched(_s,0,x-(_sw/2)-(112*image_xscale),y-(_sh/2)+(9*image_yscale),_sw,_sh);