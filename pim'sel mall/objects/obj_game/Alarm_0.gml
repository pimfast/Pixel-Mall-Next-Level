/// @desc create customer

if (room == rm_game) {
	if (array_contains(global.customerline,noone)) && (time != "End") {
		if (time_hours < 21 || time_minutes < 45) {
			var newcustomer = instance_create_layer(room_width,463,"Instances",obj_customer)
			if (global.day == 1) && (time_hours == 9) && (time_minutes <= 1) {
				newcustomer.tutorialmode = true
			}
		}
	}
}