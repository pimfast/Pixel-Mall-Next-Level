/// @desc

//set the level
level = -1 //0 = not purchased, set to ndv01 or 02 on day start. -1 = scaffolding. -2 = nothing

//establish shoppness
shopname = string_delete(object_get_name(object_index),1,4) //remove "obj_"
shoptype = string_letters(shopname) //remove the numbers

//add this store in the list of stores a customer can request (change this later so it's only on this list if it's above level 1)
array_push(global.shoptions,string_letters(shopname))

serving = noone

attended = false
tobeattended = false

lvl0sprite = spr_ndv01
lvlminus1sprite = spr_ndv03

if (global.mode == "upgrade") {
	image_alpha = 0.5
	sprite_index = asset_get_index("spr_store_"+string(shopname)+"_lvl"+string(level+1))
} else {
	if (level == 0) {
		sprite_index = lvl0sprite
	}
	//not sure if the scaffolding is a sprite for the shop or a background that the shop is in front of
	//on one hand, when the store is level 0 and transparent during upgrade time, you shouldn't see scaffolding
	//on the other hand, if there is a store that's as wide as two, then it will only cover half
	//actually i guess i could just make a double sprite for that. nevermind!
	if (level == -1) {
		sprite_index = spr_ndv03
	}
	if (level <= -2) {
		sprite_index = noone
	}
}