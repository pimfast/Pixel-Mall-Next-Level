/// @desc

audio_group_stop_all(ag_mus)
if (global.day % 2 == 0) {
	audio_play_sound(mus_pixelmallgametheme2real,100,1)
} else {
	audio_play_sound(mus_pixelmallgametheme1real,100,1)
}
room_goto(rm_game)