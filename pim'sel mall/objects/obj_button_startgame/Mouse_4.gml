/// @desc

global.level = 1 //max is 10 (for now muahahaha)
global.rating = 0
global.money = 400
global.pixelmoney = 20
global.day = 1

global.mode = "game"

var file;

file = file_text_open_write(working_directory+"dontcheat.plz");

if (!file_exists("dontcheat.plz")) {
	//default stuff
	file_text_write_real(file,1); //level
	file_text_writeln(file);
	file_text_write_real(file,0); //rating
	file_text_writeln(file);
	file_text_write_real(file,400); //money
	file_text_writeln(file);
	file_text_write_real(file,20); //pixelmoney wait this needs to be established earlier
	file_text_writeln(file);
	file_text_write_real(file,1); //day
	file_text_writeln(file);
	file_text_close(file);
}

file = file_text_open_write(working_directory+"cheatplz.dont");

if (!file_exists("cheatplz.dont")) {
	//default things
	file_text_write_real(file,1); //elevator lvl
	file_text_writeln(file);
	
	file_text_write_real(file,1); //counter lvl
	file_text_writeln(file);
	
	file_text_write_real(file,0); //musicplayer lvl
	file_text_writeln(file);
	
	file_text_write_real(file,1); //zk01 lvl
	file_text_writeln(file);
	file_text_write_real(file,0); //zk02 lvl
	file_text_writeln(file);
	file_text_write_real(file,1); //zk03 lvl
	file_text_writeln(file);
	file_text_write_real(file,0); //zk04 lvl
	file_text_writeln(file);
	
	file_text_write_real(file,1); //medical01 lvl
	file_text_writeln(file);
	file_text_write_real(file,0); //medical02 lvl
	file_text_writeln(file);
	
	file_text_write_real(file,1); //sports01 lvl
	file_text_writeln(file);
	file_text_write_real(file,0); //sports02 lvl
	file_text_writeln(file);
	
	file_text_write_real(file,-1); //hnv01 lvl
	file_text_writeln(file);
	file_text_write_real(file,-1); //hnv02 lvl
	file_text_writeln(file);
	
	file_text_write_real(file,-1); //buy01 lvl
	file_text_writeln(file);
	file_text_write_real(file,-1); //buy02 lvl
	file_text_writeln(file);
	
	file_text_write_real(file,-1); //w01 lvl
	file_text_writeln(file);
	file_text_write_real(file,-1); //w02 lvl
	file_text_writeln(file);
	file_text_write_real(file,-1); //w03 lvl
	file_text_writeln(file);
	file_text_write_real(file,-1); //w04 lvl
	file_text_writeln(file);
	
	file_text_close(file);
}

////initiate
//var file
//if (file_exists("dontcheat.plz")) {
//	file = file_text_open_read(working_directory + "dontcheat.plz")
//	global.day = file_text_read_string(file)
//	file_text_readln(file)
//	file_text_close(file)
//} else {
//	global.level = 1 //max is 10
//	global.rating = 0
//	global.money = 400 //was 1000
//	global.pixelmoney = 20 //was 30
//	global.day = 1
//}

audio_group_stop_all(ag_mus)
if (global.day % 2 == 0) {
	audio_play_sound(mus_pixelmall_gameplay2,100,1)
} else {
	audio_play_sound(mus_pixelmall_gameplay1,100,1)
}
room_goto(rm_game)
alarm_set(obj_game.alarm[0],1)