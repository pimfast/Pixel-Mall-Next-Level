/// @desc

if (time_hours < 21) && (array_contains(global.customerline,noone)) {
	instance_create_layer(320,468,"Instances",obj_customer)
}