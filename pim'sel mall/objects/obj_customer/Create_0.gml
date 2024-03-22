/// @desc

state = "goingto_enter"
//states:
//goingto_enter
//waitingfor_shop
//waitingfor_employee
//goingto_counter
//goingto_exit

walksp = 1

customertype = (irandom(5)+1) //number between 1 and 6

sprite_index = asset_get_index("spr_customer"+string(customertype)+"_walkleft")