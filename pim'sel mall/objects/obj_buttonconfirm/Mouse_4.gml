/// @desc

//purchase
if (global.money >= upgradeprice) {
	audio_play_sound(sfx_pixelmall_moneyUp,1,0);
	global.money -= upgradeprice;
	shoplevelup(upgradewindow.selectedmallpart);
	upgradewindow.dir = "close";
}
audio_play_sound(sfx_pixelmall_click,1,0);