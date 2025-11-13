/// @desc set level and stuff

event_inherited();

displayname = "Igloo";
leveldesc = ["Hire Igloo to help you!",
"Hire Igloo to help you!",
"Upgrade Igloo to Lv2 for faster walking\nand serving speed",
"Upgrade Igloo to Lv3 for faster walking\nand serving speed",
"Upgrade Igloo to Lv4 for faster walking\nand serving speed",
"Upgrade Igloo to Lv5 for faster walking\nand serving speed",
"Upgrade Igloo to Lv6 for faster walking\nand serving speed",
"Upgrade Igloo to Lv7 for faster walking\nand serving speed"];
levelprice = [100,
20,
20,
40,
60,
80,
100,
120];
levelcurrency = [1,
1,
1,
1,
1,
1,
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