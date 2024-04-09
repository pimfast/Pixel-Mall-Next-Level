/// @desc

audio_group_load(ag_mus)
audio_group_load(ag_sfx)
audio_play_sound(mus_pixelmalltitlethemereal,100,1)

//initiate

var file

if (file_exists("dontcheat.plz")) {
	file = file_text_open_read(working_directory + "dontcheat.plz")
	global.day = file_text_read_string(file)
	file_text_readln(file)
	file_text_close(file)
} else {
	global.level = 1 //max is 10
	global.rating = 0
	global.money = 400 //was 1000
	global.pixelmoney = 20 //was 30
	global.day = 1
	global.shoptions = [] //"zk","zk","medical","sports"//zk, medical, sports, hnv, buy, w
	
	global.zk01_lvl = 1
	global.zk02_lvl = 0
	global.zk03_lvl = 1
	global.zk04_lvl = 0
	
	global.medical01_lvl = 1
	global.medical02_lvl = 0
	
	global.sports01_lvl = 1
	global.sports02_lvl = 0
	
	global.hnv01_lvl = -1
	global.hnv02_lvl = -1
	
	global.buy01_lvl = -1
	global.buy02_lvl = -1
	
	global.w01_lvl = -1
	global.w02_lvl = -1
	global.w03_lvl = -1
	global.w04_lvl = -1
	
	global.elevator_lvl = 1
	
	global.counter_lvl = 1
	
	global.musicplayer_lvl = 0
}