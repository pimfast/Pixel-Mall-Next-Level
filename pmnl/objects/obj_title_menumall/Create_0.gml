/// @desc

if (global.level <= 9) {
	sprite_index = asset_get_index("spr_menumall_lvl"+string(global.level));
} else {
	sprite_index = spr_menumall_lvl10;
}