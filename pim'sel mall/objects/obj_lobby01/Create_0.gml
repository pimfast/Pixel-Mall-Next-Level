/// @desc

if (global.level < 10) {
	sprite_index = asset_get_index("spr_lobby01_lvl"+string(global.level));
} else {
	sprite_index = asset_get_index("spr_lobby01_lvl10");
};