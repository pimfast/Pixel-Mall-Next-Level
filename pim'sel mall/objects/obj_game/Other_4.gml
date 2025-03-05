/// @desc

if (room == rm_game) {
	if (global.day == 1) {
		startday()
		var _newcustomer = instance_create_layer(room_width+15,463,"Instances",obj_customer)
		_newcustomer.tutorialmode = true
		_newcustomer.shopstops = 2
		_newcustomer.class = "customer"
		_newcustomer.customertype = "1"
		_newcustomer.sprite_index = spr_customer_1_walk_normal
	} else {
		startnight()
		layer_background_alpha(layer_background_get_id(layer_get_id("Background_Day")),0)
	}
}