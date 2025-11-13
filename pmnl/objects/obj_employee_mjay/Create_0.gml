/// @desc set level and stuff

event_inherited();

displayname = "M-Jay";
leveldesc = ["Hire M-Jay to help you!",
"Hire M-Jay to help you!",
"Upgrade M-Jay to Lv2 for faster walking\nand serving speed",
"Upgrade M-Jay to Lv3 for faster walking\nand serving speed",
"Upgrade M-Jay to Lv4 for faster walking\nand serving speed",
"Upgrade M-Jay to Lv5 for faster walking\nand serving speed",
"Upgrade M-Jay to Lv6 for faster walking\nand serving speed",
"Upgrade M-Jay to Lv7 for faster walking\nand serving speed"];
levelprice = [300,
300,
40,
60,
80,
100,
120,
140];
levelcurrency = [1,
1,
1,
1,
1,
1,
1,
1];

levelservicesp = [1,1,0.9,0.8,0.7,0.6,0.5,0.45];
levelwalksp = [1,150,170,190,200,210,220,225];

//set the level
level = 0; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

if (level >= 0) {
	walksp = (levelwalksp[level]);
	servicesp = levelservicesp[level];
}