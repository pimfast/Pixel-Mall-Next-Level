/// @desc

audio_play_sound(sfx_pixelmall_click,1,0);

if (room == rm_title) {
	//this object is reused as the "enable debug" button
		switch (global.debugmode) {
		case true:
			global.debugmode = false;
			audio_play_sound(sfx_pixelmall_dragCancel,1,0);
			break;
		case false:
			global.debugmode = true;
			audio_play_sound(sfx_pixelmall_dragSuccess,1,0);
			break;
	}
} else {

	var currencytype = upgradewindow.selectedmallpart.levelcurrency[upgradewindow.mallpartlevel+1];
	var selectioncost = upgradewindow.selectedmallpart.levelprice[upgradewindow.mallpartlevel+1];
	
	//free money.
	if (upgradewindow.image_xscale == upgradewindow.animpositions[upgradewindow.targetpos]) {
		if (!currencytype) {
			changemoney(selectioncost);
		} else {
			changepixelmoney(selectioncost);
		}
	}
}