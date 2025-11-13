/// @desc set level and stuff

event_inherited();

displayname = "Swifty";
leveldesc = ["Hire Swifty to help you!",
"Hire Swifty to help you!",
"Upgrade Swifty to Lv2 for faster walking\nand serving speed",
"Upgrade Swifty to Lv3 for faster walking\nand serving speed",
"Upgrade Swifty to Lv4 for faster walking\nand serving speed",
"Upgrade Swifty to Lv5 for faster walking\nand serving speed",
"Upgrade Swifty to Lv6 for faster walking\nand serving speed",
"Upgrade Swifty to Lv7 for faster walking\nand serving speed"];
levelprice = [10,
400,
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

levelservicesp = [2,2,1.5,0.8,0.4,0.2,0.15,0.1];	//dang man
levelwalksp = [40,40,140,190,440,640,740,840];	//swifty goes crazy

//set the level
level = 0; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

if (level >= 0) {
	walksp = (levelwalksp[level]);
	servicesp = levelservicesp[level];
}