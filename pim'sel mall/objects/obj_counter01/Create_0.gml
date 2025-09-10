/// @desc set level and sprites

event_inherited();

name = "Counter";
levelpic = [0,
0,
spr_pic_counter01_lvl2,
spr_pic_counter01_lvl3,
spr_pic_counter01_lvl4,
spr_pic_counter01_lvl5];
leveldesc = [0,
"Shorter serving time",
"Shorter serving time",
"Shorter serving time",
"Shorter serving time",
"Shorter serving time"];
levelprice = [0,
0,
3000,
5000,
7000,
9000];
levelcurrency = [0,
0,
0,
0,
0,
0];

levelcharge = [0,0,0,0,0,0];
levelrating = [0,0,0,0,0,0];
leveltime = [0,1,0.8,0.6,0.4,0.25];

//set the level
level = 1; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

//lvl0sprite = spr_ndv01;
//lvlminus1sprite = spr_ndv03;

servicecharge = levelcharge[level];
servicerating = levelrating[level];
servicetime = leveltime[level];