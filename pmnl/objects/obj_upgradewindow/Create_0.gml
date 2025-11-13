/// @desc

image_xscale = 0;
image_yscale = 0;
dir = 1; //1 = forward, -1 = backward
animpositions = [0,1.2,1];
targetpos = 0;

audio_play_sound(sfx_pixelmall_upgrade,1,0);

confirmbutton = instance_create_depth(room_width/2,room_height/2,-200,obj_buttonconfirm);
confirmbutton.upgradewindow = self;

buymorebutton = instance_create_depth(room_width/2,room_height/2,-200,obj_buttonbuymore);
buymorebutton.upgradewindow = self;

closebutton = instance_create_depth(room_width/2,room_height/2,-200,obj_buttonclose);
closebutton.upgradewindow = self;

selectedmallpart = noone;
mallpartlevel = 0;