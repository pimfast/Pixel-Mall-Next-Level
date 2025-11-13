/// @desc make a note

var _newmusbubble = instance_create_layer(0,y,"Game",obj_musicbubble);
_newmusbubble.spd = random_range(0.5,1.5);
_newmusbubble.x = (0 - _newmusbubble.sprite_width);
_newmusbubble.y = (y + irandom(50));
_newmusbubble.image_angle = irandom(360);

alarm[1] = bubrate + irandom_range(-5,5);