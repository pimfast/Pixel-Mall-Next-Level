/// @desc losing patience...

//if (!instance_exists(customerbubble)) {
//	customerbubble = instance_create_layer(x+15,y-40,"Instances",obj_customerbubble)
//}
if (tutorialmode == false) {
	if (customerbubble.sprite_index == spr_customerbubble_request) {
		customerbubble.sprite_index = spr_customerbubble_request_urgent
	} else {
		customerbubble.sprite_index = asset_get_index("spr_customerbubble_"+string(desiredstore)+"_urgent")
	}
	alarm_set(1,360)
}