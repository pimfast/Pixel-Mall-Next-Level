/// @desc

var _maxlevel = 10
if (global.level <= _maxlevel) {
	obj_reportbuilding.sprite_index = asset_get_index("spr_reportbuilding_lvl"+string(global.level));
} else {
	obj_reportbuilding.sprite_index = asset_get_index("spr_reportbuilding_lvl"+string(_maxlevel));
}