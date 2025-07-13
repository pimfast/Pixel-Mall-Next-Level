/// @desc move employee

var _elvposition = 32
var _employeename = string_delete(object_get_name(object_index),1,13)

if (alarm[0] = -1) {
	sprite_index = asset_get_index("spr_employee_"+_employeename+"_idle")
} else {
	sprite_index = asset_get_index("spr_employee_"+_employeename+"_busy")
	if (attending == obj_counter01.id) {
		image_xscale = -1
	} else {
		image_xscale = 1
	}
}

if (target != noone) {
	
	var _targetx = target.x
	if (instance_exists(obj_counter01)) {
		if (target != obj_counter01.id) {
			_targetx = target.x-15
		} else {
			_targetx = target.x+5
		}
	}
	var _targety = target.y
	
	if (target.serving != noone) && (target.serving.state == "waitingfor_employee") && (target.serving.state != "waitingfor_shop") {
		target.tobeattended = true
		attending = target.id
	}
	//walk to the place, and do stuff when getting there.
	if (_targety == y) {
		if (x < _targetx) {
			sprite_index = asset_get_index("spr_employee_"+_employeename+"_walk")
			if (x + walksp > _targetx) {
				x = _targetx
			} else {
				x += walksp
			}
		}
		if (x > _targetx) {
			sprite_index = asset_get_index("spr_employee_"+_employeename+"_walk")
			if (x - walksp < _targetx) {
				x = _targetx
			} else {
				x -= walksp
			}
		}
		//when reaching the destination, do some shit
		if (x == _targetx) {
			target.attended = true
			if (target.serving != noone) && (target.serving.state != "waitingfor_checkoutline") && (target.serving.state != "waitingfor_shop") {
				target.tobeattended = false
			} else {
				//if there's noone here, i ain't busy NOT FUCKING TRUE --PIM but isn't it though? --pim
				attending = noone
				target.attended = false
				target.myemployee = noone
			}
			target = noone
		}
	} else {
		//walk to the elevator
		if (x > _elvposition) {
			sprite_index = asset_get_index("spr_employee_"+_employeename+"_walk")
			if (x - walksp < _elvposition) {
				x = _elvposition
			} else {
				x -= walksp
			}
		}
		if (x < _elvposition) {
			sprite_index = asset_get_index("spr_employee_"+_employeename+"_walk")
			if (x + walksp > _elvposition) {
				x = _elvposition
			} else {
				x += walksp
			}
		}
		
		//go up or down the elevator
		if (x == _elvposition) {
			//if it's lower, go down the elevator
			if (_targety > y) {
				sprite_index = asset_get_index("spr_employee_"+_employeename+"_elevator")
				if (y - elvsp > _targety) {
					y = _targety
				} else {
					y += elvsp
				}
			}
			//if it's higher, go up the elevator
			if (_targety < y) {
				sprite_index = asset_get_index("spr_employee_"+_employeename+"_elevator")
				if (y - elvsp < _targety) {
					y = _targety
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