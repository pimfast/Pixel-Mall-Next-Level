/// @desc

if (global.level <= 4) {
	sprite_index = asset_get_index("spr_menucar_lvl"+string(global.level));
} else {
	sprite_index = spr_menucar_lvl5;
}