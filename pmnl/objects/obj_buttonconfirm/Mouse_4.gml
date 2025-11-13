/// @desc

var currencytype = upgradewindow.selectedmallpart.levelcurrency[upgradewindow.mallpartlevel+1];
var selectioncost = upgradewindow.selectedmallpart.levelprice[upgradewindow.mallpartlevel+1];

//purchase
if (upgradewindow.image_xscale == upgradewindow.animpositions[upgradewindow.targetpos]) {
	if (!currencytype) {
		if (global.money >= selectioncost) {
			audio_play_sound(sfx_pixelmall_moneyUp,1,0);
			changemoney(selectioncost * -1);
			mallpartlevelup(upgradewindow.selectedmallpart);
			upgradewindow.dir = -1;
		}
	} else {
		if (global.pixelmoney >= selectioncost) {
			audio_play_sound(sfx_pixelmall_moneyUp,1,0);
			changepixelmoney(selectioncost * -1);
			mallpartlevelup(upgradewindow.selectedmallpart);
			upgradewindow.dir = -1;
		}
	}
}
audio_play_sound(sfx_pixelmall_click,1,0);