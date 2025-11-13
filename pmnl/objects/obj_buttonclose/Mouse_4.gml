/// @desc

if (upgradewindow.image_xscale == upgradewindow.animpositions[upgradewindow.targetpos]) {
	audio_play_sound(sfx_pixelmall_dragCancel,1,0);
	upgradewindow.dir = -1;
}