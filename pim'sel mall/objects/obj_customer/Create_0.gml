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

shopimat = noone

substate = "normal" //normal, upset, shopped
tutorialmode = false

//find the first open slot in customer line and mark it filled and keep track that thats this's spot
addtofirstopenslot(self,global.customerline)
//line_pos

walksp = 1
elvsp = walksp/**obj_elevator.spd*/

moveable = false
beingmoved = false

shopped = 0

//todo: make the checkout use this in it's calculation and delete the "shopped" variable
//shopstops = irandom(2)+1
//or maybe
//shopstops = irandom_range(1,global.level)

if (irandom(99) == 1) {
	audio_play_sound(sfx_pixelmall_vip,1,0)
	class = "vip"
	customertype = "pixelmallguy"
} else {
	class = "customer"
	customertype = string(irandom(6)+1) //number between 1 and 7
}
sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk_"+substate)