/// @desc

state = "goingto_enter"
//states:
//goingto_enter
//waitingfor_shop
//waitingfor_employee
//goingto_counter
//goingto_exit

//happy/mad
mood = "happy"

//find the first open slot in customer line and mark it filled and keep track that thats this's spot
addtofirstopenslot(self)
//line_pos

walksp = 1

moveable = false

customertype = (irandom(5)+1) //number between 1 and 6
sprite_index = asset_get_index("spr_customer"+string(customertype)+"_walkleft")