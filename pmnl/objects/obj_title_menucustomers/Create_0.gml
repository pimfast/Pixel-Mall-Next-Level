/// @desc

if (global.level <= 4) {
	sprite_index = asset_get_index("spr_menucustomers_lvl"+string(global.level));
} else {
	if (global.level >= 10) {
		sprite_index = spr_menucustomers_lvl6;
	} else {
		sprite_index = spr_menucustomers_lvl5;
	}
}