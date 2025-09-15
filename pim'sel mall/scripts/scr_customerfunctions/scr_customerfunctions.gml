// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lineonlycontains(value,line) {
	for (var i = 0; i < array_length(line); i++) {
		if (line[i] != value) {
			return(false);
		}
	}
	return(true);
}

function addtofirstopenslot(customer,line) {
	for (var i = 0; i < array_length(line); i++) {
		if (line[i] == noone) {
			line[i] = customer.id;
			show_debug_message(customer.id)
			break;
		}
	}
}

function addtolastopenslot(customer,line) {
	for (var i = array_length(line); i > 0; i--) {
		if (line[i] == noone) {
			line[i] = customer.id;
			//show_debug_message(customer.id)
			break;
		}
	}
}

function whereinlineami(customer,line) {
	for (var i = 0; i < array_length(line); i++) {
		if (line[i] == customer.id) {
			return(i);
		}
	}
	return(-1);
}

function outofline(customer,line) {
	for (var i = 0; i < array_length(line); i++) {
		if (line[i] == customer.id) {
			line[i] = noone;
			break;
		}
	}
}