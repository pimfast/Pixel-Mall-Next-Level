/// @desc

//purchase
if (!upgradewindow.selectedmallpart.levelcurrency[upgradewindow.selectedmallpart.level+1]) {
	if (global.money >= upgradewindow.selectedmallpart.levelprice[upgradewindow.selectedmallpart.level+1]) {
		audio_play_sound(sfx_pixelmall_moneyUp,1,0);
		global.money -= upgradewindow.selectedmallpart.levelprice[upgradewindow.selectedmallpart.level+1];
		shoplevelup(upgradewindow.selectedmallpart);
		upgradewindow.dir = "close";
	}
} else {
	if (global.pixelmoney >= upgradewindow.selectedmallpart.levelprice[upgradewindow.selectedmallpart.level+1]) {
		audio_play_sound(sfx_pixelmall_moneyUp,1,0);
		global.pixelmoney -= upgradewindow.selectedmallpart.levelprice[upgradewindow.selectedmallpart.level+1];
		shoplevelup(upgradewindow.selectedmallpart);
		upgradewindow.dir = "close";
	}
}
audio_play_sound(sfx_pixelmall_click,1,0);