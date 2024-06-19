/// @desc

//title
audio_group_load(ag_mus)
audio_group_load(ag_sfx)
audio_play_sound(mus_pixelmall_title,100,1)

//game
time_hours = 09
time_minutes = 00
time_seconds = 00
time = string(time_hours)+":"+string(time_minutes)

global.shoptions = [] //zk, medical, sports, hnv, buy, w
global.heldcustomer = noone
global.customerline = [noone,noone,noone,noone,noone] //first position is the most left
global.checkoutline = [noone,noone,noone,noone] //first position is the most right

//buhhh...
background_day_alpha = 1

//current_day

moneychange = noone