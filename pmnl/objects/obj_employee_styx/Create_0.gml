/// @desc set level and stuff

event_inherited();

name = "Styx";
leveldesc = ["Hire Styx to help you!",
"Hire Styx to help you!",
"Upgrade Styx to Lv2 for faster walking\nand serving speed",
"Upgrade Styx to Lv3 for faster walking\nand serving speed",
"Upgrade Styx to Lv4 for faster walking\nand serving speed",
"Upgrade Styx to Lv5 for faster walking\nand serving speed",
"Upgrade Styx to Lv6 for faster walking\nand serving speed",
"Upgrade Styx to Lv7 for faster walking\nand serving speed"];
levelprice = [0,
3000,
5000,
10000,
20000,
35000,
10,
15];
levelcurrency = [0,
0,
0,
0,
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