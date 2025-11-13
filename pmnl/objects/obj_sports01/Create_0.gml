/// @desc set level and sprites

event_inherited();

displayname = "Sports Store";
leveldesc = [0,
"Service Charge $10",
"Service Charge $10 > $20\nShorter serving time",
"Service Charge $20 > $35\nShorter serving time",
"Service Charge $35 > $45\nShorter serving time",
"Service Charge $45 > $55\nShorter serving time"];
levelprice = [0,
1000,
2000,
2000,
7000,
9000];
levelcurrency = [0,
0,
0,
0,
0,
0];

levelcharge = [0,10,20,35,45,55];
levelrating = [0,0.1,0.1,0.1,0.1,0.1];
leveltime = [0,4,3.5,3,2.5,2];

//set the level
level = 1; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

//lvl0sprite = spr_ndv01;
//lvlminus1sprite = spr_ndv03;

//if (level >= 0) {
servicecharge = levelcharge[level];
servicerating = levelrating[level];
servicetime = leveltime[level];
//}