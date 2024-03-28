// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addtofirstopenslot(customer) {
	for (var i = 0; i < array_length(global.customerline); i++) {
		if (global.customerline[i] == noone) {
			global.customerline[i] = customer.id
			show_debug_message(customer.id)
			break
		}
	}
}

function whereinlineami(customer) {
	for (var i = 0; i < array_length(global.customerline); i++) {
		if (global.customerline[i] == customer.id) {
			return(i);
		}
	}
	return(false);
}

function outofline(customer) {
	for (var i = 0; i < array_length(global.customerline); i++) {
		if (global.customerline[i] == customer.id) {
			global.customerline[i] = noone
			break
		}
	}
}