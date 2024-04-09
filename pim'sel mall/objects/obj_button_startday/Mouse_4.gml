/// @desc

obj_game.time_hours = 09
audio_group_stop_all(ag_mus)
if (global.day % 2 == 0) {
	audio_play_sound(mus_pixelmallgametheme2real,100,1)
} else {
	audio_play_sound(mus_pixelmallgametheme1real,100,1)
}
instance_destroy()

with (obj_shopparent) {
	if (level <= 0) {
		instance_destroy()
	}
}