/// @desc create customer

if (room == rm_game) {
	if (array_contains(global.customerline,noone)) && (time != "End") {
		if (time_hours < 21 || time_minutes < 45) {
			var _newcustomer = instance_create_layer(room_width+15,463,"Instances",obj_customer);
			if (_newcustomer.class == "vip") {
				audio_play_sound(sfx_pixelmall_vip,1,0);
			}
		}
	}
}