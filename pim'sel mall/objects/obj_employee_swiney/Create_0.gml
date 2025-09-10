/// @desc set level and stuff

event_inherited();

name = "Swiney";
leveldesc = ["Hire Swiney to help you!",
"Hire Swiney to help you!",
"Upgrade Swiney to Lv2 for faster walking\nand serving speed",
"Upgrade Swiney to Lv3 for faster walking\nand serving speed",
"Upgrade Swiney to Lv4 for faster walking\nand serving speed",
"Upgrade Swiney to Lv5 for faster walking\nand serving speed",
"Upgrade Swiney to Lv6 for faster walking\nand serving speed",
"Upgrade Swiney to Lv7 for faster walking\nand serving speed"];
levelprice = [60,
50,
20,
40,
3000,
5000,
80,
100];
levelcurrency = [1,
1,
1,
1,
0,
0,
1,
1];

levelservicesp = [1,1,0.9,0.8,0.7,0.6,0.5,0.45];
levelwalksp = [1,120,140,150,160,170,175,180];

//set the level
level = 0; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

if (level >= 0) {
	walksp = (levelwalksp[level]);
	servicesp = levelservicesp[level];
}