/// @desc drag customers

if (global.heldcustomer != noone) {
	global.heldcustomer.beingmoved = false
	global.heldcustomer.image_blend = -1
	global.heldcustomer.image_xscale = 1
	global.heldcustomer.image_yscale = 1
	
	var customerstore = instance_position(global.heldcustomer.x,global.heldcustomer.y,obj_shopparent)
	if (customerstore != noone) {
		if (global.heldcustomer.desiredstore == customerstore.shoptype) && (customerstore.level >= 1) {
			if (customerstore.serving == noone) {
				if (global.heldcustomer.shopimat != noone) {
					global.heldcustomer.shopimat.serving = noone
				}
				
				audio_play_sound(sfx_pixelmall_dragSnap,1,0)
				audio_play_sound(sfx_pixelmall_dragSuccess,1,0)
				global.heldcustomer.x = customerstore.x+15
				global.heldcustomer.y = customerstore.y
				outofline(global.heldcustomer,global.customerline)
				
				customerstore.serving = global.heldcustomer.id
				global.heldcustomer.shopimat = customerstore
				
				global.heldcustomer.alarm[0] = 360
				global.heldcustomer.alarm[1] = -1
				global.heldcustomer.sprite_index = asset_get_index("spr_"+global.heldcustomer.class+"_"+global.heldcustomer.customertype+"_talk_"+global.heldcustomer.substate)
				global.heldcustomer.customerbubble.sprite_index = spr_customerbubble_request
				global.heldcustomer.state = "waitingfor_employee"
			} else {
				//make error sound, return to previous place
				audio_play_sound(sfx_pixelmall_dragCancel,1,0)
				if (global.heldcustomer.shopimat != noone) {
					global.heldcustomer.x = global.heldcustomer.shopimat.x+15
					global.heldcustomer.y = global.heldcustomer.shopimat.y
				} else {
					global.heldcustomer.x = 70+32*(whereinlineami(global.heldcustomer,global.customerline))
					global.heldcustomer.y = 463
				}
			}
		} else {
			//make error sound, return to previous place
			audio_play_sound(sfx_pixelmall_dragCancel,1,0)
			if (global.heldcustomer.shopimat != noone) {
				global.heldcustomer.x = global.heldcustomer.shopimat.x+15
				global.heldcustomer.y = global.heldcustomer.shopimat.y
			} else {
				global.heldcustomer.x = 70+32*(whereinlineami(global.heldcustomer,global.customerline))
				global.heldcustomer.y = 463
			}
		}
	} else {
		//make error sound, return to previous place
		audio_play_sound(sfx_pixelmall_dragCancel,1,0)
		if (global.heldcustomer.shopimat != noone) {
			global.heldcustomer.x = global.heldcustomer.shopimat.x+15
			global.heldcustomer.y = global.heldcustomer.shopimat.y
		} else {
			global.heldcustomer.x = 70+32*(whereinlineami(global.heldcustomer,global.customerline))
			global.heldcustomer.y = 463
		}
	}
	global.heldcustomer = noone
}