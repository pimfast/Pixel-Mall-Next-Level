// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function startday() {
	global.todaysmoney = 0;
	global.todaysrating = 0;
	global.todayshappycustomers = 0;
	global.todaysupsetcustomers = 0;
	
	obj_game.startofdaymoney = global.money;
	obj_game.startofdayrating = global.rating;
	
	obj_game.time_hours = 09;
	audio_group_stop_all(ag_mus);
	if (global.day % 2 == 0) {
		audio_play_sound(mus_pixelmall_gameplay2,100,1);
	} else {
		audio_play_sound(mus_pixelmall_gameplay1,100,1);
	}
	
	//i think
	with (obj_shopparent) {
		if (level <= -2) {
			image_alpha = 1;
			sprite_index = noone;
		}
		if (level == -1) {
			image_alpha = 1;
			sprite_index = lvlminus1sprite;
		}
		if (level == 0) {
			image_alpha = 1;
			sprite_index = lvl0sprite;
		}
		if (level >= 1) {
			if (object_get_name(object_index) != "obj_counter01") {
				array_push(global.shoptions,string_letters(shopname));
			}
			////buying a shop doesn't update nothing, so i put this here to refresh the things every day,
			////but now i'm thinking it's better to put this in the buy code
			//servicecharge = levelcharge[level];
			//servicerating = levelrating[level];
			//servicetime = leveltime[level];
		}
		serving = noone;
		attended = false;
		tobeattended = false;
	}
	with (obj_employeeparent) {
		if (level < 0) {
			image_alpha = 1;
			sprite_index = noone;
		}
		if (level == 0) {
			image_alpha = 1;
			sprite_index = noone;
		}
	}
	instance_destroy(obj_button_startday);
	obj_game.background_day_alpha = 1;
	obj_button_pause.sprite_index = spr_button_pause;
	global.mode = "game";
}

function startnight() {
	
	audio_group_stop_all(ag_mus);
	audio_play_sound(mus_pixelmall_upgrade,100,1);
	
	//i still think
	with (obj_shopparent) {
		if (object_get_name(object_index) != "obj_counter01") {
			if (level <= -2) {
				image_alpha = 1;
				sprite_index = noone;
			}
			if (level == -1) {
				image_alpha = 1;
				sprite_index = lvlminus1sprite;
			}
			if (level == 0) {
				image_alpha = 0.5;
				sprite_index = asset_get_index("spr_store_"+string(shopname)+"_lvl1");
			}
			if (level >= 1) {
				image_alpha = 1;
				sprite_index = asset_get_index("spr_store_"+string(shopname)+"_lvl"+string(level));
			}
		}
		tobeattended = false;
		attended = false;
		myemployee = noone;
		serving = noone;
	}
	with (obj_employeeparent) {
		x = myxspot;
		y = myyspot;
		target = noone;
		
		if (level < 0) {
			image_alpha = 1;
			sprite_index = noone;
		}
		if (level == 0) {
			image_alpha = 0.5;
			sprite_index = asset_get_index("spr_employee_"+string(employeename)+"_idle");
		}
	}
	instance_create_layer(room_width/2,room_height-64,"Instances",obj_button_startday);
	obj_game.background_day_alpha = 0;
	obj_button_pause.sprite_index = spr_button_back;
	global.mode = "upgrade";
}

/// instance_nth_nearest(x,y,obj,n)
//
//  Returns the id of the nth nearest instance of an object
//  to a given point or noone if none is found.
//
//      x,y       point coordinates, real
//      obj       object index (or all), real
//      n         proximity, real
//
/// GMLscripts.com/license
//for store

function findclosestemployee(pointx,pointy,object,n) {
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}