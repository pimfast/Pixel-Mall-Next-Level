/// @desc

if (global.heldcustomer != noone) {
	global.heldcustomer.beingmoved = false
	global.heldcustomer.image_blend = -1
	
	var customerstore = instance_position(global.heldcustomer.x,global.heldcustomer.y,obj_shopparent)
	if (customerstore != noone) {
		if (global.heldcustomer.desiredstore == customerstore.shoptype) {
			if (customerstore.serving == noone) {
				global.heldcustomer.x = customerstore.x+15
				global.heldcustomer.y = customerstore.y
				outofline(global.heldcustomer,global.customerline)
				
				customerstore.serving = global.heldcustomer.id
				global.heldcustomer.shopimat = customerstore
				
				global.heldcustomer.alarm[0] = 360
				global.heldcustomer.alarm[1] = -1
				global.heldcustomer.customerbubble.sprite_index = spr_customerbubble_request
				global.heldcustomer.state = "waitingfor_employee"
			} else {
				//make error sound, return to spot in line
				global.heldcustomer.x = 70+32*(whereinlineami(global.heldcustomer,global.customerline))
				global.heldcustomer.y = 468
			}
		} else {
			//make error sound, return to spot in line
			global.heldcustomer.x = 70+32*(whereinlineami(global.heldcustomer,global.customerline))
			global.heldcustomer.y = 468
		}
	} else {
		//return to spot in line
		global.heldcustomer.x = 70+32*(whereinlineami(global.heldcustomer,global.customerline))
		global.heldcustomer.y = 468
	}
	global.heldcustomer = noone
}