/// @desc set level and sprites

event_inherited(); 

myfg = asset_get_index(object_get_name(object_index)+"b");

labelX = 24;
labelY = -24;

displayname = "Elevators";
levelpic = [0,
0,
spr_pic_elevator01_lvl2,
spr_pic_elevator01_lvl3,
spr_pic_elevator01_lvl4,
spr_pic_elevator01_lvl5];
leveldesc = [0,
"The Speed of the lifts would be increased.",
"The Speed of the lifts would be increased.",
"The Speed of the lifts would be increased.",
"The Speed of the lifts would be increased.",
"The Speed of the lifts would be increased."];
levelprice = [0,
0,
50,
100,
100,
100];
levelcurrency = [0,
0,
1,
1,
1,
1];

levelcharge = [0,0,0,0,0,0];
levelrating = [0,0,0,0,0,0];
leveltime = [0,0,0,0,0,0];

levelspeed = [0,2,4,6,8,9392]; //made up numbers

//set the level
level = 1; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

servicecharge = levelcharge[level];
servicerating = levelrating[level];
servicetime = leveltime[level];