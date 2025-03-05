/// @desc finished being served

if (attending.serving.shopimat == obj_counter) {
	//get them out the mall
	if (attending.serving.class != "vip") {
		changemoney(attending.serving.billmoney)
		changerating(attending.serving.billrating)
	} else {
		changemoney(attending.serving.billrating*3)
		changerating(attending.serving.billrating*3)
	}
	global.todayshappycustomers += 1
	attending.serving.state = "goingto_exit"
	attending.serving = noone
	//if (!array_contains(global.checkoutline,obj_customer.id)) /*(array_contains(global.checkoutline,obj_customer.id))*/ {
	//	//if the array does not have a customer, then,
	//	//mark the checkout as not attended by self
	//	attending.attended = false
		
	//	//mark self as not busy
	//	attending = noone
	//}
} else {
	//get them to the counter/ready for the next store
	attending.serving.billmoney += (attending.level*10)//attending.servicecharge
	attending.serving.billrating += (0.1)//attending.servicecharge
	attending.serving.shopstops -= 1

	if (attending.serving.shopstops <= 0) {
		attending.serving.substate = "shopped"
		if (array_contains(global.checkoutline,noone)) {
			attending.serving.state = "goingto_counter"
			addtofirstopenslot(attending.serving,global.checkoutline)
			attending.serving.shopimat = noone
			attending.serving = noone
		} else {
			attending.serving.state = "waitingfor_checkoutline"
		}
	} else {
		//global.money = string(attending.serving.shopstops)
		attending.serving.state = "waitingfor_shop"
		attending.serving.sprite_index = asset_get_index("spr_"+attending.serving.class+"_"+attending.serving.customertype+"_idle_"+attending.serving.substate)
		
		//create a list of store types excluding the one the customer is at
		var _shoptionsminusthesame = []
		var _storetypewedontwant = attending.serving.desiredstore
		array_copy(_shoptionsminusthesame,0,global.shoptions,0,array_length(global.shoptions))
		
		var _f = function(_element, _index) {
		    return (_element == attending.serving.desiredstore);
		}
		while (array_contains(_shoptionsminusthesame,_storetypewedontwant)) {
			array_delete(_shoptionsminusthesame,array_find_index(_shoptionsminusthesame,_f),1)
		}		
		
		attending.serving.desiredstore = array_get(_shoptionsminusthesame,irandom(array_length(_shoptionsminusthesame)-1))
		attending.serving.customerbubble.sprite_index = asset_get_index("spr_customerbubble_"+string(attending.serving.desiredstore))
		attending.serving.alarm[0] = 360
		if (attending.serving.class == "vip") {
			attending.serving.alarm[0] = 360/2
		}
		attending.serving.alarm[1] = -1
	}
	//mark the store as not attended by self
	attending.attended = false
	attending.myemployee = noone
	
	//mark self as not busy
	attending = noone
	
	//test
	//target = noone
}