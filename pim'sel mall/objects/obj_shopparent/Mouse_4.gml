/// @desc

//get the closest employee, if they're available, order them here, if not, get the next one
for (var i = 0; i < instance_number(obj_employeeparent); i++) {
	myemployee = instance_nearest(x, y, obj_employeeparent)
	if (myemployee.attending == noone) {
		myemployee.target = self.id
		break
	} else {
		instance_deactivate_object(instance_nearest(x,y,obj_employeeparent))
	}
}
instance_activate_all()

//wait, is this not checking if there's already an employee at or going to this store?
//make sure it only does this code if there's not already an employee here or on the way