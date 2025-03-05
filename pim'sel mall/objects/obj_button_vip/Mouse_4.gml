/// @desc

if (global.mode == "game") {
	audio_play_sound(sfx_pixelmall_click,1,0)
	var _newcustomer = instance_create_layer(room_width,463,"Instances",obj_customer)
	_newcustomer.class = "vip"
	_newcustomer.shopstops = 3
	if (irandom(9) == 9) {_newcustomer.shopstops++}
	if (irandom(9) == 9) {_newcustomer.shopstops++}
	_newcustomer.customertype = string(irandom(2)+1)
	_newcustomer.sprite_index = asset_get_index("spr_"+_newcustomer.class+"_"+_newcustomer.customertype+"_walk_"+_newcustomer.substate)
	//audio_play_sound(sfx_pixelmall_vip,1,0)
}