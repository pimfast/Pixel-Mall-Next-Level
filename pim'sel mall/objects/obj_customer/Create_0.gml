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

//happy/mad
mood = "happy"
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
	class = "vip"
	customertype = "pixelmallguy"
} else {
	class = "customer"
	customertype = string(irandom(5)+1) //number between 1 and 6
}
sprite_index = asset_get_index("spr_"+class+"_"+customertype+"_walk")