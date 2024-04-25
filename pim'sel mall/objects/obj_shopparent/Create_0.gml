/// @desc

//set the level
level = 0 //0 = not purchased, set to ndv01 or 02 on day start. -1 = not something you can see or buy

//establish shoppness
shopname = string_delete(object_get_name(object_index),1,4) //remove "obj_"
shoptype = string_letters(shopname) //remove the numbers

//add this store in the list of stores a customer can request (change this later so it's only on this list if it's above level 1)
array_push(global.shoptions,string_letters(shopname))

serving = noone

attended = false
tobeattended = false

lvl0sprite = spr_ndv01

if (global.mode == "upgrade") {
	image_alpha = 0.5
	sprite_index = asset_get_index("spr_store_"+string(shopname)+"_lvl"+string(level+1))
} else {
	if (level == 0) {
		sprite_index = lvl0sprite
	}
}