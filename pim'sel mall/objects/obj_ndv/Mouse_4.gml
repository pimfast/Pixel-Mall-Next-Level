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