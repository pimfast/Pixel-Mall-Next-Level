/// @desc

var file

file = file_text_open_write(working_directory + "dontcheat.plz")
file_text_write_string(file, global.day)
file_text_writeln(file)
file_text_close(file)