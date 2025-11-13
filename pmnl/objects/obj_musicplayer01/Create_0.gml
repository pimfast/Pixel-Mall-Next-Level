/// @desc set level and sprites

event_inherited();

labelX = 30;
labelY = 15;

myusecount = 0;

displayname = "Music Player";
levelpic = [0,
spr_pic_musicplayer01_lvl1,
spr_pic_musicplayer01_lvl2,
spr_pic_musicplayer01_lvl3,
spr_pic_musicplayer01_lvl4,
spr_pic_musicplayer01_lvl5];
leveldesc = [0,
"Customers won't become impatient while\nactive, can only be used once a day.",
"Customers won't become impatient while\nactive, can be used 3 times a day.",
"Customers won't become impatient while\nactive, can be used 5 times a day.",
"Customers won't become impatient while\nactive, can be used 7 times a day.",
"Customers won't become impatient while\nactive, can be used 9 times a day."];
levelprice = [0,
5000,
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
leveltime = [0,15,15,15,15,15];

leveluses = [0,1,3,5,7,9];
active = false;
activelength = 480; //random placeholder number
bubrate = 30; //also random

//set the level
level = 0; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

servicecharge = levelcharge[level];
servicerating = levelrating[level];
servicetime = leveltime[level];