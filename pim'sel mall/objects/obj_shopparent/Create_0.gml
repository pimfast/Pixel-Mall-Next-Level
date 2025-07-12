/// @desc establish shoppness

shopname = string_delete(object_get_name(object_index),1,4) //remove "obj_". eg; obj_zk01 = zk01
shoptype = string_letters(shopname) //remove the numbers. eg; zk01 = zk

serving = noone //no customers here
attended = false //no employees here
tobeattended = false //no employees going here while a customer is here
myemployee = noone //no employees going here

////bs to make the game stop whining
//servicecharge = 0;
//levelcharge = [0];
//servicerating = 0;
//levelrating = [0];
//servicetime = 0;
//leveltime = [0];
////doesn't work. i wanted to have it set these variables so that the individual shops could get on with what
////they were doing. but it doesn't work, since room start (and thus gamefunctions) is called before this(?)