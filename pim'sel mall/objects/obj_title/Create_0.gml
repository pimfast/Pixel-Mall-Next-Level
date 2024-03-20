/// @desc

//initiate

var file

if (file_exists("dontcheat.plz")) {
	file = file_text_open_read(working_directory + "dontcheat.plz")
	global.day = file_text_read_string(file)
	file_text_readln(file)
	file_text_close(file)
} else {
	global.level = 1 //max is 10
	global.rating = 0.0
	global.money = 1000
	global.pixelmoney = 30
	global.day = 1
	global.shoptions = ["zk","medical","sports"] //zk, medical, sports, hnv, buy, w
}