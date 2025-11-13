/// @desc

if (active) {
	with (obj_customer) {
		if (alarm[0] != -1) || (alarm[1] != -1) {
			alarm[0] = patienceTime;
			alarm[1] = -1;
		}
	}
}