/// @desc finished being served

//get the customer outta here (change when you allow the customer to visit multiple stores)
if (attending.serving.shopimat == obj_counter) {
	//get them out the mall
	changemoney(+10*attending.serving.shopped)
	changerating(+0.1*attending.serving.shopped)
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
	//get them to the counter
	attending.serving.shopped += 1
	if (array_contains(global.checkoutline,noone)) {
		attending.serving.state = "goingto_counter"
		addtofirstopenslot(attending.serving,global.checkoutline)
		attending.serving.shopimat = noone
		attending.serving = noone
	} else {
		attending.serving.state = "waitingfor_checkoutline"
	}
	//mark the store as not attended by self
	attending.attended = false
	
	//mark self as not busy
	attending = noone
}