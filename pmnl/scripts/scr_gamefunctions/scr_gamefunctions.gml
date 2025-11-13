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
	with (obj_miscpartparent) {
		if (level == 0) {
			sprite_index = noone;
		} else {
			//refresh music player uses
			if (variable_instance_exists(self.id,"myusecount")) {
				myusecount = leveluses[level];
			}
		}
	}
	
	obj_counter01.mask_index = spr_store_counter01_lvl1;
	
	instance_destroy(obj_purchaseupgradelabel);
	instance_destroy(obj_levellabel);
	instance_destroy(obj_button_startday);
	obj_game.background_day_alpha = 1;
	obj_button_pause.sprite_index = spr_button_pause;
	global.mode = "game";
	
	//start with a customer
	obj_game.alarm[0] = 1;
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
	with (obj_miscpartparent) {
		if (level <= 0) {
			image_alpha = 0.5;
			sprite_index = asset_get_index("spr_"+string(miscpartname)+"_lvl1");
		}
	}
	with (obj_upgradeableparent) {
		if (level >= 0) {
			mypurchaseupgradelabel = instance_create_depth(x+labelX,y+labelY,0,obj_purchaseupgradelabel);
			mylevellabel = instance_create_depth(x+labelX,y+labelY+20,0,obj_levellabel);
			mylevellabel.dir = "";
			if (level == 0) {
				mypurchaseupgradelabel.sprite_index = spr_hko_ip_icon_purchase;
				mylevellabel.sprite_index = noone;
			}
			if (level >= 1) {
				if (level < (array_length(leveldesc) - 1)) {
					mypurchaseupgradelabel.sprite_index = spr_hko_ip_icon_upgrade;
				} else {
					mypurchaseupgradelabel.sprite_index = noone;
				}
				mylevellabel.sprite_index = asset_get_index("spr_label_lvl"+string(level));
				if (object_get_parent(object_index) == obj_employeeparent) {
					mypurchaseupgradelabel.starty = y+labelY-22;
					mylevellabel.y = y+labelY-2;
				}
			}
		}
	}
	
	obj_counter01.mask_index = spr_store_counter_upgrademask;
	
	instance_create_layer(room_width/2,room_height-64,"Instances",obj_button_startday);
	obj_game.background_day_alpha = 0;
	obj_button_pause.sprite_index = spr_button_back;
	global.mode = "upgrade";
}

function findclosestemployee(pointx,pointy,object,n) {
    n = min(max(1,n),instance_number(object));
    list = ds_priority_create();
    nearest = noone;
    with (object) ds_priority_add(list,id,distance_to_point(pointx,pointy));
    repeat (n) nearest = ds_priority_delete_min(list);
    ds_priority_destroy(list);
    return nearest;
}

function animatebutton() {
	
}

function savegame() {
	var _savefile = file_text_open_write(working_directory + "dontcheat.plz");
	with (obj_upgradeableparent) {
		file_text_write_string(_savefile, level);
		file_text_writeln(_savefile)
	}
	file_text_close(_savefile);
}

function savesettings() {
	var _options = file_text_open_write(working_directory + "settings.txt");
	file_text_write_string(_options, audio_group_get_gain(ag_mus));
	file_text_close(_options);
}