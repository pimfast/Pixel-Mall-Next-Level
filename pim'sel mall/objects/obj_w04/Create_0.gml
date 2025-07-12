/// @desc set level and sprites

event_inherited();

levelname = [0,
"Clothing Store*PHARMACY ACTUALLY*Lv1",
"Clothing Store*PHARMACY i think*Lv2",
"Clothing Store*PHARMACY p sure*Lv3",
"Clothing Store*PHARMACY maybe*Lv4",
"Clothing Store*PHARMACY i dunno*Lv5"];
leveldesc = [0,
"Service Charge $10",
"Service Charge $10 → $20\nShorter serving time",
"Service Charge $20 → $35\nShorter serving time",
"Service Charge $35 → $45\nShorter serving time",
"Service Charge $45 → $55\nShorter serving time"];
levelpic = [0,
1,
spr_Pic_Cashier02];
levelprice = [0,
1000,
2000,
2000,
7000,
9000];

levelcharge = [0,10,20,35,45,55];
levelrating = [0,0.1,0.1,0.1,0.1,0.1];
leveltime = [0,4,3.5,3,2.5,2];

//set the level
level = -1; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

lvl0sprite = spr_ndv02;
lvlminus1sprite = spr_ndv04;

if (level >= 0) {
	servicecharge = levelcharge[level];
	servicerating = levelrating[level];
	servicetime = leveltime[level];
}