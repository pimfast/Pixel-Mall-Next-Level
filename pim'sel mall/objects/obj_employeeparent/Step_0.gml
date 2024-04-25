/// @desc

var elvposition = 31

if (alarm[0] = -1) {
	sprite_index = asset_get_index("spr_employee_"+name+"_idle")
} else {
	sprite_index = asset_get_index("spr_employee_"+name+"_busy")
}

if (target != noone) {
	
	var targetx = target.x
	if (target != obj_counter.id) {
		targetx = target.x-15
	}
	var targety = target.y
	
	if (target.serving != noone) && (target.serving.state != "waitingfor_checkoutline") {
		target.tobeattended = true
		attending = target.id
	}
	//go to the place
	if (targety == y) {
		if (x < targetx) {
			sprite_index = asset_get_index("spr_employee_"+name+"_walk")
			if (x + walksp > targetx) {
				x = targetx
			} else {
				x += walksp
			}
		}
		if (x > targetx) {
			sprite_index = asset_get_index("spr_employee_"+name+"_walk")
			if (x - walksp < targetx) {
				x = targetx
			} else {
				x -= walksp
			}
		}
		if (x == targetx) {
			target.attended = true
			if (target.serving != noone) && (target.serving.state != "waitingfor_checkoutline") {
				target.tobeattended = false
			} else {
				//if there's noone here, i ain't busy
				attending = noone
				target.attended = false
			}
			target = noone
		}
	} else {
		//walk to the elevator
		if (x > elvposition) {
			sprite_index = asset_get_index("spr_employee_"+name+"_walk")
			if (x - walksp < elvposition) {
				x = elvposition
			} else {
				x -= walksp
			}
		}
		if (x < elvposition) {
			sprite_index = asset_get_index("spr_employee_"+name+"_walk")
			if (x + walksp > elvposition) {
				x = elvposition
			} else {
				x += walksp
			}
		}
		
		//go up or down the elevator
		if (x == elvposition) {
			//if it's lower, go down the elevator
			if (targety > y) {
				sprite_index = asset_get_index("spr_employee_"+name+"_elevator")
				if (y - elvsp > targety) {
					y = targety
				} else {
					y += elvsp
				}
			}
			//if it's higher, go up the elevator
			if (targety < y) {
				sprite_index = asset_get_index("spr_employee_"+name+"_elevator")
				if (y - elvsp < targety) {
					y = targety
				} else {
					y -= elvsp
				}
			}
		}
	}
}

//if (place_meeting (x+hsp,y,obj_wall) {
//	while (!place_meeting(x+sign(hsp),y,obj_wall)) {
//		x = x + sign(hsp)
//	}
//	hsp = 0
//}
//
//if ((x + walksp) < target.x-15) {
//	while (!place_meeting(x+sign(hsp),y,obj_wall)) {
//		x = x + sign(hsp)
//	}
//	hsp = 0
//}