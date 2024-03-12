/// @desc

//initiate

var file

if (file_exists("dontcheat.plz")) {
	file = file_text_open_read(working_directory + "dontcheat.plz")
	global.day = file_text_read_string(file)
	file_text_readln(file)
	file_text_close(file)
} else {
	global.day = 1
	global.money = 1000
	global.pixelmoney = 30
	global.level = 1 //max is 10
}