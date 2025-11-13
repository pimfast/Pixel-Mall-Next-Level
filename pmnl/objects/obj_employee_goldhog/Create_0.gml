/// @desc set level and stuff

event_inherited();

displayname = "Goldhog";
leveldesc = ["Goldhog automatically collects money",
"Goldhog automatically collects money",
"Upgrade Goldhog to make him collects\nmoney faster",	//so...
"Upgrade Goldhog to make him collects\nmoney faster"];	//do we keep the typos?
levelprice = [200,
200,
100,
200];
levelcurrency = [1,
1,
1,
1];

levelservicesp = [1,1,0.9,0.8];
levelwalksp = [1,120,140,150];

//set the level
level = 0; //0 = not purchased. -1 = not available for purchase. -2 = nothin, not high enough

if (level >= 0) {
	walksp = (levelwalksp[level]);
	servicesp = levelservicesp[level];
}