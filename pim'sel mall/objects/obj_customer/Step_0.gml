/// @desc

if (beingmoved == true) {
	x = mouse_x
	y = mouse_y
	if (alarm_get(0) != -1) {
		alarm[0]++
	}
	if (alarm_get(1) != -1) {
		alarm[1]++
	}
}

//if (instance_exists(customerbubble)) {
//	customerbubble.x = x
//	customerbubble.y = y-40
//}

switch (state) {
	case "goingto_enter":
		//walk to elevator
		var spotinline = whereinlineami(self,global.customerline)
		//v DOESN'T WORK BECAUSE 0 AND FALSE ARE THE SAME THING!!! DUHH!!!!
		//if (spotinline == false) {
		//	break
		//}
		if (x > (70+32*(spotinline))) {
			x -= walksp
		} else {
			state = "waitingfor_shop"
			sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_idle")
			desiredstore = array_get(global.shoptions,irandom(array_length(global.shoptions)-1))
			
			customerbubble = instance_create_layer(x,y-40,"Instances",obj_customerbubble)
			customerbubble.sprite_index = asset_get_index("spr_customerbubble_"+string(desiredstore))
			customerbubble.thinker = self.id
			alarm_set(0,360)
			alarm[1] = -1
		}
		break;
	case "waitingfor_shop":
		//request a random shop and show a bubble for it
		moveable = true
		break;
	case "waitingfor_employee":
		//show a ! bubble unless there's an employee here,
		//in which case change to processing state
		image_alpha = 1
		moveable = false
		if (shopimat != noone) {
			if (shopimat.attended == true) && (shopimat.serving == self.id) {
				state = "processing"
				alarm[0] = -1
				alarm[1] = -1
			}
			if (shopimat.tobeattended == true) && (shopimat.serving == self.id) {
				customerbubble.sprite_index = spr_customerbubble_waiting
				alarm[0] = -1
				alarm[1] = -1
			}
		}
		break;
	case "waitingfor_checkoutline":
		//check if space exists in the checkout line, if so, set it as yourself
		moveable = false
		customerbubble.sprite_index = spr_customerbubble_linefull
		if (array_contains(global.checkoutline,noone)) {
			state = "goingto_counter"
			sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk")
			addtofirstopenslot(self,global.checkoutline)
			shopimat.serving = noone
			shopimat = noone
		}
		break;
	case "processing":
		//do nothing. when employee is finished the state will be goingto_counter or goingto_exit
		moveable = false
		customerbubble.sprite_index = spr_customerbubble_purchasing
		if (shopimat.myemployee.alarm[0] == -1) {
			//start talking
			shopimat.myemployee.alarm[0] = 240/shopimat.myemployee.servicesp
		}
		break;
	case "goingto_counter":
		//walk to counter
		moveable = false
		image_alpha = 0.5
		customerbubble.sprite_index = noone
		
		if (y == 468) {
			var spotinline = whereinlineami(self,global.checkoutline)
			if (x < (255-(32*spotinline))) {
				x += walksp
			} else {
				//i think i need to finish the line thing before this can be foolproof
				shopimat = obj_counter
				//if i am at the front of the checkout line set it to be serving me
				if (self.id == array_first(global.checkoutline)) {
					shopimat.serving = self.id
					alarm_set(alarm[1],360)
					alarm[1] = -1
					customerbubble.sprite_index = spr_customerbubble_request
					state = "waitingfor_employee"
				} else {
					//if i am not at the front of the line check if the next space is noone
					//if it's not noone, do nothing
					//if it is noone, set it as self and make the position it wasaa buhh noone
					if (spotinline-1 >= 0) {
						if (global.checkoutline[spotinline-1] == noone) {
							global.checkoutline[spotinline-1] = self.id
							global.checkoutline[spotinline] = noone
						}
					}
				}
				sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_idle")
			}
		} else {
			if (x > 31) {
				x -= walksp
			} else {
				y += elvsp
			}
		}
		break;
	case "goingto_exit":
		//walk outside and destroy self
		moveable = false
		instance_destroy(customerbubble)
		image_alpha = 1
		sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk")
		if (lineonlycontains(noone,global.checkoutline)) {
			//free the employee working at the checkout line
			if (shopimat != noone) /*(!array_contains(global.checkoutline,obj_customer.id))*/ {
				//if the array does not have a customer, then,
				//mark employee as not busy
				shopimat.myemployee.attending = noone
			
				//mark the checkout as not attended by employee
				shopimat.attended = false
			}
			shopimat = noone
		}
		
		//remove self from customerline and checkoutline
		outofline(self,global.customerline)
		outofline(self,global.checkoutline)
		
		if (y == 468) {
			if (x < room_width) {
				x += walksp
			} else {
				instance_destroy()
			}
		} else {
			if (x > 31) {
				x -= walksp
			} else {
				y += elvsp
			}
		}
		break;
}