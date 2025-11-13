/// @desc set level and stuff

event_inherited();

displayname = "Pinky";
leveldesc = ["Hire Pinky to help you!",
"Hire Pinky to help you!",
"Upgrade Pinky to Lv2 for faster walking\nand serving speed",
"Upgrade Pinky to Lv3 for faster walking\nand serving speed",
"Upgrade Pinky to Lv4 for faster walking\nand serving speed",
"Upgrade Pinky to Lv5 for faster walking\nand serving speed",
"Upgrade Pinky to Lv6 for faster walking\nand serving speed",
"Upgrade Pinky to Lv7 for faster walking\nand serving speed"];
levelprice = [0,
0,
3000,
5000,
10000,
20000,
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
level = 1; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

//if (level >= 0) {
	walksp = (levelwalksp[level]);
	servicesp = levelservicesp[level];
//}