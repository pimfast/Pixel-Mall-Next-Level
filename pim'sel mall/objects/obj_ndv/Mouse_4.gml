/// @desc

//get the closest employee, if they're available, order them here, if not, get the next one
if (attended == false) && (tobeattended == false) {
	for (var i = 0; i < instance_number(obj_employeeparent); i++) {
		myemployee = instance_nearest(x, y, obj_employeeparent)
		if (myemployee.attending == noone) || (myemployee.attending == self.id) {
			myemployee.target = self.id
			break
		} else {
			myemployee = noone
			//remove them as an option and try again (this isn't working :(!)
			instance_deactivate_object(instance_nearest(x,y,obj_employeeparent))
		}
		instance_activate_all()
	}
}

if (serving != noone) {
	if (myemployee != noone) {
		audio_play_sound(sfx_pixelmall_bubble,1,0)
	} else {
		audio_play_sound(sfx_pixelmall_dragStart,1,0)
	}
}

	//change this code (later muahaha) to make it first check for the closest employees on the same floor
	//BEFORE checking for the general nearest employees
	//actually maybe instead make a pathfinding system? because
	//if you just check for whats closest it might pick the employee directly above
	//the store even if there's an employee closer to the elevator that would be a better choice
	//so yeah, pathfinding system... if only i knew how to make one of those...