/// @desc create customer

if (time != "End") && (array_contains(global.customerline,noone)) {
	var newcustomer = instance_create_layer(room_width,468,"Instances",obj_customer)
	if (global.day == 1) && (time_hours == 9) && (time_minutes <= 1) {
		newcustomer.tutorialmode = true
	}
}