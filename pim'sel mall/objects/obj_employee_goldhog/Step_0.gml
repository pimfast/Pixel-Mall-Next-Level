/// @desc move employee

if (level <= 0) {
	exit;
}

var _effWalksp = walksp / 60;

attending = obj_counter01.id;
obj_counter01.id.attended = true;
obj_counter01.id.myemployee = self.id;

if (alarm[0] == -1) {
	sprite_index = asset_get_index("spr_employee_"+employeename+"_idle");
} else {
	sprite_index = asset_get_index("spr_employee_"+employeename+"_busy");
	if (attending == obj_counter01.id) {
		image_xscale = -1;
	}
}