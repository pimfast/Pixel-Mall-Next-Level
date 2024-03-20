/// @desc

state = "entering"
//states:
//entering
//waitingfor_shop
//waitingfor_employee
//halfleaving

walksp = 1

customertype = irandom(5)

sprite_index = asset_get_index("spr_customer"+string(customertype)+"_walkleft")