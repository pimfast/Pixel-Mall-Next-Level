/// @desc

audio_play_sound(sfx_pixelmall_click,1,0)
if (!instance_exists(obj_upgradewindow)) && (obj_report.dir == "left") {
	switch (global.mode) {
		case "game":
			audio_pause_all()
			show_message("PAUSED")
			//show_message("paused, +$150 +❤0.5")
			audio_resume_all()
			//changemoney(+150)
			//changerating(+0.5)
			//audio_play_sound(sfx_pixelmall_moneyUp,1,0)
			break;
		case "upgrade":
			audio_group_stop_all(ag_mus)
			room_goto(rm_title)
			break;
	}
}