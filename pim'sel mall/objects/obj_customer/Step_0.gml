/// @desc

switch (state) {
	case "goingto_enter":
		//walk to elevator
		var spotinline = whereinlineami(self)
		if (spotinline == false) {
			break
		}
		if (x > (70+32*spotinline)) {
			x -= walksp
		} else {
			state = "waitingfor_shop"
			sprite_index = asset_get_index("spr_customer"+string(customertype)+"_idle")
			
			desiredstore = array_get(global.shoptions,irandom(array_length(global.shoptions)-1))
			customerbubble = instance_create_layer(x+15,y-40,"Instances",obj_customerbubble)
			customerbubble.sprite_index = asset_get_index("spr_customerbubble_"+string(desiredstore))
			alarm_set(0,360)
		}
		break;
	case "waitingfor_shop":
		//request a random shop and show a bubble for it
		
		break;
	case "waitingfor_employee":
		//show a ! bubble unless there's an employee here,
		//in which case show an hourglass bubble until finished, when
		//finished, change state to either waitingfor_shop or goingto_counter
		//
		//oh also remove self from customer line
		outofline(self)
		break;
	case "goingto_counter":
		//walk to counter
		image_alpha = 0.5
        break;
	case "goingto_exit":
		//walk outside and destroy self
		instance_destroy(customerbubble)
		image_alpha = 1
		sprite_index = asset_get_index("spr_customer"+string(customertype)+"_walkleft")
		outofline(self)
        if (x < 320) && (y > 425) {
			x += walksp
		} else {
			instance_destroy()
		}
		break;
}