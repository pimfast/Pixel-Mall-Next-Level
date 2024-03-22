/// @desc

switch (state) {
	case "goingto_enter":
		//walk to elevator
		if (x > 70) {
			x -= walksp
		} else {
			state = "waitingfor_shop"
			sprite_index = asset_get_index("spr_customer"+string(customertype)+"_idle")
		}
		break;
	case "waitingfor_shop":
		//request a random shop and show a bubble for it
		
		break;
	case "waitingfor_employee":
		//show a ! bubble unless there's an employee here,
		//in which case show an hourglass bubble until finished, when
		//finished, change state to either waitingfor_shop or goingto_counter
		
		break;
	case "goingto_counter":
		//walk to counter
		
        break;
	case "goingto_exit":
		//walk outside and destroy self
        if (x < 320) {
			x += walksp
		} else {
			instance_destroy()
		}
		break;
}