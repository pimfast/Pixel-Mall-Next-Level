/// @desc

audio_play_sound(sfx_pixelmall_click,1,0);

if (room == rm_title) {
		switch (global.debugmode) {
		case true:
			global.debugmode = false
			audio_play_sound(sfx_pixelmall_dragCancel,1,0);
			break;
		case false:
			global.debugmode = true
			audio_play_sound(sfx_pixelmall_dragSuccess,1,0);
			break;
	}
} else {
	if (!upgradewindow.selectedmallpart.levelcurrency[upgradewindow.mallpartlevel+1]) {
		changemoney(1);
	} else {
		changepixelmoney(1);
	}
}