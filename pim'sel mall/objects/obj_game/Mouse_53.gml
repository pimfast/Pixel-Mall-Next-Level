/// @desc stores/customers

//check for buttons, check for other stuff if no extraneous buttons are being clicked
var _button = instance_position(mouse_x,mouse_y,obj_buttonparent);
if (_button == noone) {
	if (global.mode == "upgrade") {
		var _upgradeselection = instance_position(mouse_x,mouse_y,obj_upgradeableparent);
		if (_upgradeselection != noone) {
			//upgrade something
			if (!instance_exists(obj_upgradewindow)) && (_upgradeselection.level >= 0) && (_upgradeselection.level < (array_length(_upgradeselection.leveldesc) - 1)) {
				var _shopmenu = instance_create_layer(room_width/2,(room_height/2)+22,"UI_Instances",obj_upgradewindow);
				_shopmenu.selectedmallpart = _upgradeselection;
				_shopmenu.mallpartlevel = _upgradeselection.level;
			}
		}
	} else {
		//check for customers
		var _customer = instance_position(mouse_x,mouse_y,obj_customer);
		if (_customer != noone) && (_customer.state != "waitingfor_employee") {
			//run customer script
			if (_customer.moveable == true) {
				audio_play_sound(sfx_pixelmall_dragStart,1,0);
				global.heldcustomer = _customer.id;
				_customer.beingmoved = true;
				_customer.image_blend = make_color_hsv(255,0,50);
				_customer.image_xscale *= 1.25;
				_customer.image_yscale *= 1.25;
			}
		} else {
			//check for stores
			var _shop = instance_position(mouse_x,mouse_y,obj_shopparent);
			if (_shop != noone) {
				//get the closest employee, if they're available, order them here, if not, get the next one
				if (_shop.level >= 1) {
					if (_shop.attended == false) && (_shop.tobeattended == false) && (_shop.myemployee == noone) {
						var _n = noone;
						var _d, _t; //d for closest distance, t for check distance
						var _samelevel = false; //set to true when a floor match is found
						with (obj_employeeparent) {
							if (level >= 1) && (attending == noone) {
								_t = point_distance(x, y, _shop.x, _shop.y);
								if (_samelevel == true) {
									if (y == _shop.y) && (_t < _d) { //If distance is less than current target distance, then apply new distance and instance id
										_d = _t;
								        _n = id;
								    }
								} else {
								    if (_n == noone) || (_t < _d) || (y == _shop.y)  {
										if (y == _shop.y) {
											_samelevel = true;
										}
										_d = _t;
								        _n = id;
								    }
								}
							}
						}
						_shop.myemployee = _n;
						if (_shop.myemployee != noone) {
							if (_shop.myemployee.target != noone) {
								_shop.myemployee.target.myemployee = noone;
							}
							_shop.myemployee.target = _shop.id;
						}
						//make sure the employees old target store doesn't consider the employee as myemployee
						
						//for (var i = 0; i < instance_number(obj_employeeparent); i++) {
						//	_shop.myemployee = instance_nearest(_shop.x, _shop.y, obj_employeeparent)
						//	if (_shop.myemployee.attending == noone) || (_shop.myemployee.attending == _shop.id) {
						//		_shop.myemployee.target = _shop.id
						//		break;
						//	} else {
						//		_shop.myemployee = noone
						//		//remove them as an option and try again (this isn't working :(!)
						//		//i dont have time to read the code right now
						//		//but it should just check through the employees
						//		//and keep counting until it finds one that's not busy
						//		instance_deactivate_object(instance_nearest(_shop.x,_shop.y,obj_employeeparent))
						//	}
						//	//instance_activate_all() //holy shit wait this is supposed to be outside isn't it
						//}
						//instance_activate_all()
					}

					if (_shop.serving != noone) {
						if (_shop.myemployee != noone) {
							audio_play_sound(sfx_pixelmall_bubble,1,0)
						} else {
							audio_play_sound(sfx_pixelmall_dragStart,1,0)
						}
					}
				}
			}
		}
	}
}