/// @desc

//set the level
level = 0 //0 = not purchased, disable on day start. -1 = not something you can buy (yet)

//set the shop type
var shopname = string_delete(object_get_name(object_index),1,4)
shoptype = string_letters(shopname)

//add this store in the list of stores a customer can request
array_push(global.shoptions,string_letters(shopname))

serving = noone

attended = false
tobeattended = false