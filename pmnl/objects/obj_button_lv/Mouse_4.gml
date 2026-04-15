/// @desc

audio_play_sound(sfx_pixelmall_click,1,0)
if (global.level < 100) {
	var _oldmoney = global.money;
	var _oldrating = global.rating;
	global.money = global.levelmoneyreq[global.level+1];
	global.rating = global.levelratingreq[global.level+1];
	considerlevelup();
	global.money = _oldmoney;
	global.rating = _oldrating;
	
	//save game for consistency, otherwise only levels where you gain pixelmoney will be saved
	savegame(global.gameUser);
}