/// @desc

if (beingmoved == true) {
	var customerstore = instance_position(mouse_x,mouse_y,obj_shopparent)
	if (customerstore != noone) {
		if (desiredstore == customerstore.shoptype) && (customerstore.level >= 1) && (customerstore.serving == noone) {
			x = customerstore.x+15
			y = customerstore.y
		} else {
			x = mouse_x;
			y = mouse_y+15;
		}
	} else {
		x = mouse_x;
		y = mouse_y+15;
	}
	//delay upsettation while held
	if (alarm_get(0) != -1) {
		alarm[0]++;
	}
	if (alarm_get(1) != -1) {
		alarm[1]++;
	}
}

//if (shopped >= 1) && (substate != "upset") {
//	substate = "shopped"
//}

//if (instance_exists(customerbubble)) {
//	customerbubble.x = x
//	customerbubble.y = y-40
//}

var _elvposition = 32;

switch (state) {
	case "goingto_enter":
		//walk to elevator
		var spotinline = whereinlineami(self,global.customerline);
		//v doesn't work because 0 and false are the same thing duh
		//if (spotinline == false) {
		//	break
		//}
		if (x > (70+32*(spotinline))) {
			x -= walksp;
		} else {
			state = "waitingfor_shop";
			sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_idle_"+substate);
			desiredstore = array_get(global.shoptions,irandom(array_length(global.shoptions)-1));
			
			customerbubble = instance_create_layer(x,y-40,"Game",obj_customerbubble);
			customerbubble.sprite_index = asset_get_index("spr_customerbubble_"+string(desiredstore));
			customerbubble.thinker = self.id;
			alarm_set(0,360)
			if (class == "vip") {
				alarm_set(0,alarm_get(0)/2);
			}
			alarm[1] = -1;
		}
		break;
	case "waitingfor_shop":
		//request a random shop and show a bubble for it
		moveable = true
		break;
	case "waitingfor_employee":
		//show a ! bubble unless there's an employee here,
		//in which case change to processing state
		image_alpha = 1;
		moveable = false;
		if (shopimat != noone) {
			if (shopimat.attended == true) && (shopimat.serving == self.id) {
				state = "processing";
				alarm[0] = -1;
				alarm[1] = -1;
			}
			if (shopimat.tobeattended == true) && (shopimat.serving == self.id) {
				customerbubble.sprite_index = spr_customerbubble_waiting;
				alarm[0] = -1;
				alarm[1] = -1;
			}
		}
		break;
	case "waitingfor_checkoutline":
		//check if space exists in the checkout line, if so, set it as yourself
		moveable = false;
		customerbubble.sprite_index = spr_customerbubble_linefull;
		if (array_contains(global.checkoutline,noone)) {
			state = "goingto_counter";
			sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk_"+substate);
			addtofirstopenslot(self,global.checkoutline)
			shopimat.serving = noone;
			shopimat = noone;
		}
		break;
	case "processing":
		//do nothing. when employee is finished the state will be goingto_counter, goingto_exit, or waitingfor_employee
		moveable = false
		if (shopimat == obj_counter01) {
			if (shopimat.myemployee.alarm[0] == -1) {
				//start talking
				customerbubble.sprite_index = noone;
				audio_play_sound(sfx_pixelmall_cashier,1,0);
				shopimat.myemployee.alarm[0] = 60/shopimat.myemployee.servicesp;
			}
		} else {
			if (shopimat.myemployee.alarm[0] == -1) {
				//start talking
				customerbubble.sprite_index = spr_customerbubble_purchasing;
				audio_play_sound(sfx_pixelmall_inStore,1,0);
				shopimat.myemployee.alarm[0] = 180/shopimat.myemployee.servicesp;
			}
		}
		break;
	case "goingto_counter":
		//walk to counter
		moveable = false;
		image_alpha = 0.5;
		customerbubble.sprite_index = noone;
		sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk_"+substate);
		
		if (y == 463) {
			image_xscale = -1;
			
			spotinline = whereinlineami(self,global.checkoutline)
			if (x < (255-(32*spotinline))) {
				x += walksp;
			} else {
				//i think i need to finish the line thing before this can be foolproof
				shopimat = obj_counter01
				//if i am at the front of the checkout line set it to be serving me
				if (self.id == array_first(global.checkoutline)) {
					shopimat.serving = self.id;
					alarm_set(alarm[1],360);
					alarm[1] = -1;
					customerbubble.sprite_index = spr_customerbubble_request;
					state = "waitingfor_employee";
				} else {
					//if i am not at the front of the line check if the next space is noone
					//if it's not noone, do nothing
					//if it is noone, set it as self and make the position it wasaa buhh noone
					if (spotinline-1 >= 0) {
						if (global.checkoutline[spotinline-1] == noone) {
							global.checkoutline[spotinline-1] = self.id;
							global.checkoutline[spotinline] = noone;
							//wait does this code work well? i don't think it should
							//but i haven't noticed anything wrong
						}
					}
				}
			}
		} else {
			if (x > _elvposition) {
				image_xscale = 1;
				x -= walksp;
			} else {
				sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_elevator_"+substate);
				image_xscale = -1;
				y += elvsp;
			}
		}
		break;
	case "goingto_exit":
		//walk outside and destroy self
		moveable = false;
		instance_destroy(customerbubble);
		image_alpha = 1;
		sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk_"+substate);
		if (lineonlycontains(noone,global.checkoutline)) {
			//free the employee working at the checkout line
			if (shopimat != noone) /*(!array_contains(global.checkoutline,obj_customer.id))*/ {
				//if the array does not have a customer, then,
				//mark employee as not busy
				if (shopimat.myemployee != noone) {
					//needs to be in this if statement for some probably really good reason
					shopimat.myemployee.attending = noone;
				}
					show_debug_message(asset_get_index("spr_"+class+"_"+customertype+"_walk_"+substate));
			
				//mark the checkout as not attended by employee
				shopimat.attended = false
				shopimat.myemployee = noone
			}
			//shopimat has to be set to noone in here otherwise cashier gets stuck
			shopimat = noone;
		}
		
		//remove self from checkoutline and customerline in case of early anger
		outofline(self,global.customerline);
		outofline(self,global.checkoutline);
		
		if (y == 463) {
			if (x < room_width+20) {
				x += walksp;
				image_xscale = -1;
			} else {
				instance_destroy();
			}
		} else {
			if (x > _elvposition) {
				x -= walksp;
				image_xscale = 1;
			} else {
				sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_elevator_"+substate);
				image_xscale = -1;
				y += elvsp;
			}
		}
		break;
}