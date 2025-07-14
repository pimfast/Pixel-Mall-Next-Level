/// @desc

state = "goingto_enter"
//states:
//goingto_enter
//waitingfor_shop
//waitingfor_employee
//waitingfor_checkoutline
//processing
//goingto_counter
//goingto_exit

shopimat = noone;

substate = "normal"; //normal, upset, shopped
tutorialmode = false;

//find the first open slot in customer line and mark it filled and keep track that thats this's spot
addtofirstopenslot(self,global.customerline);
//line_pos

walksp = 1; //doesn't work if it's increased more :( needs employee parents code
elvsp = walksp; /**obj_elevator.spd*/

moveable = false;
beingmoved = false;

billmoney = 0;
billrating = 0;
if (irandom(99) == 0) {
	class = "vip";
	shopstops = 3;
} else {
	class = "customer";
	shopstops = 1;
}
if (irandom(5) == 0) {shopstops++;}
if (irandom(5) == 0) {shopstops++;}
//global.money = string(shopstops)
if (class = "vip") {
	//audio_play_sound(sfx_pixelmall_vip,1,0) sound effect in game alarm event
	customertype = string(irandom(2)+1); //number between 1 and 3
} else {
	customertype = string(irandom(6)+1); //number between 1 and 7
}

sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk_"+substate);