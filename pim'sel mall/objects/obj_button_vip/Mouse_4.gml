/// @desc

var newcustomer = instance_create_layer(room_width,463,"Instances",obj_customer)
newcustomer.class = "vip"
global.money += 150
audio_play_sound(sfx_pixelmall_moneyUp,1,0)