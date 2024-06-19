/// @desc

switch (global.mode) {
	case "game":
		audio_pause_all()
		show_message("paused, +$150")
		audio_resume_all()
		global.money += 150
		audio_play_sound(sfx_pixelmall_moneyUp,1,0)
		break;
	case "upgrade":
		audio_group_stop_all(ag_mus)
		room_goto(rm_title)
		break;
}