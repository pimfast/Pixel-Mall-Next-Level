/// @desc

time_hours = 09
time_minutes = 00
time_seconds = 00
time = string(time_hours)+":"+string(time_minutes)

global.heldcustomer = noone
global.customerline = [noone,noone,noone,noone,noone] //first position is the most left
global.checkoutline = [noone,noone,noone,noone] //first position is the most right
alarm_set(0,1)

//current_day