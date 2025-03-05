/// @desc establish shoppness

shopname = string_delete(object_get_name(object_index),1,4) //remove "obj_". eg; obj_zk01 = zk01
shoptype = string_letters(shopname) //remove the numbers. eg; zk01 = zk

serving = noone //no customers here
attended = false //no employees here
tobeattended = false //no employees going here while a customer is here
myemployee = noone //no employees going here