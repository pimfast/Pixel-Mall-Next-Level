/// @desc

obj_game.time_hours = 09
audio_group_stop_all(ag_mus)
if (global.day % 2 == 0) {
	audio_play_sound(mus_pixelmall_gameplay2,100,1)
} else {
	audio_play_sound(mus_pixelmall_gameplay1,100,1)
}
instance_destroy()

//i think
with (obj_shopparent) {
	if (level < 0) {
		instance_destroy() //ok this doesn't seem right
	}
	if (level == 0) {
		image_alpha = 1
		sprite_index = lvl0sprite
	}
	serving = noone
	attended = false
	tobeattended = false
}

obj_game.background_day_alpha = 1
obj_button_pause.sprite_index = spr_button_pause
global.mode = "game"