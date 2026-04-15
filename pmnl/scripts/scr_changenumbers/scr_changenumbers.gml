// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function changemoney(moneystatement) {
	var moneybeforestatement = global.money;
	global.money += moneystatement;
	if (global.money < 0) {
		global.money = 0;
	}
	
	//draw number text
	if (global.mode == "game") {
		var drawpoint = instance_create_layer(138,30,"UI_Instances",obj_drawpoint);
		drawpoint.drawnumber = (global.money - moneybeforestatement);
		if (moneystatement > 0) {drawpoint.txtcol = c_lime;}
		if (moneystatement < 0) {drawpoint.txtcol = c_red;}
	} else {
		//changed money during upgrade time, save game
		savegame(global.gameUser);
	}
}

function changerating(ratingstatement) {
	var ratingbeforestatement = global.rating;
	global.rating += ratingstatement
	if (global.rating < 0.0) {
		global.rating = 0.0;
	}
	
	if (global.mode == "game") {
		var drawpoint = instance_create_layer(75,30,"UI_Instances",obj_drawpoint);
		drawpoint.drawnumber = (global.rating - ratingbeforestatement);
		if (ratingstatement > 0) {drawpoint.txtcol = c_lime;}
		if (ratingstatement < 0) {drawpoint.txtcol = c_red;}
	} else {
		//changed rating (somehow) during upgrade time, save game
		savegame(global.gameUser);
	}
}

function changepixelmoney(pixelmoneystatement) {
	var pixelmoneybeforestatement = global.pixelmoney;
	global.pixelmoney += pixelmoneystatement;
	if (global.pixelmoney < 0) {
		global.pixelmoney = 0;
	}
	
	//draw number text
	if (global.mode == "game") {
		var drawpoint = instance_create_layer(205,30,"UI_Instances",obj_drawpoint);
		drawpoint.drawnumber = (global.pixelmoney - pixelmoneybeforestatement);
		if (pixelmoneystatement > 0) {drawpoint.txtcol = c_lime;}
		if (pixelmoneystatement < 0) {drawpoint.txtcol = c_red;}
	} else {
		//changed pixel money during upgrade time, save game
		savegame(global.gameUser);
	}
}

function loadmallpart(mallPart) {
	//load or reload all relevant stats
	
	//deal with label stuff
	setlabels(mallPart);
	
	if (mallPart.level >= 1) {
		if (object_get_parent(mallPart.object_index) == obj_employeeparent) {
			mallPart.image_alpha = 1;
			
			mallPart.servicesp = mallPart.levelservicesp[mallPart.level];
			mallPart.walksp = mallPart.levelwalksp[mallPart.level];
		} 
		if (object_get_parent(mallPart.object_index) == obj_shopparent) {
			mallPart.sprite_index = asset_get_index("spr_store_"+string(mallPart.shopname)+"_lvl"+string(mallPart.level));
			mallPart.image_alpha = 1;
	
			mallPart.servicecharge = mallPart.levelcharge[mallPart.level];
			mallPart.servicerating = mallPart.levelrating[mallPart.level];
			mallPart.servicetime = mallPart.leveltime[mallPart.level];
		}
		if (object_get_parent(mallPart.object_index) == obj_miscpartparent) {
			mallPart.sprite_index = asset_get_index("spr_"+string(mallPart.miscpartname)+"_lvl"+string(mallPart.level));
			mallPart.image_alpha = 1;
			if (variable_instance_exists(mallPart.id,"myfg")) {
				mallPart.myfg.sprite_index = asset_get_index("spr_"+string(mallPart.miscpartname)+"_lvl"+string(mallPart.level)+"b");
				mallPart.myfg.image_alpha = 1;
			}
		
			mallPart.servicecharge = mallPart.levelcharge[mallPart.level];
			mallPart.servicerating = mallPart.levelrating[mallPart.level];
			mallPart.servicetime = mallPart.leveltime[mallPart.level];
		}
	}
}

function considerlevelup() {
	if (global.level < 100) && (global.money >= global.levelmoneyreq[global.level+1]) && (global.rating >= global.levelratingreq[global.level+1]) {
		global.level++;
		switch (global.level) {
			case 1:
				//default level, start with 4 owned and 4 available for purchase
				break;
			case 2:
				//nothing
				changepixelmoney(+50);
				obj_lobby01.sprite_index = spr_lobby01_lvl2;
				break;
			case 3:
				//nothing
				changepixelmoney(+50);
				obj_lobby01.sprite_index = spr_lobby01_lvl3;
				break;
			case 4:
				obj_hnv01.level = 0;
				obj_hnv02.level = 0;
				obj_lobby01.sprite_index = spr_lobby01_lvl4;
				break;
			case 5:
				obj_buy01.level = 0;
				obj_buy02.level = 0;
				obj_lobby01.sprite_index = spr_lobby01_lvl5;
				break;
			case 6:
				obj_w01.level = 0;
				obj_w02.level = 0;
				obj_w03.level = 0;
				obj_w04.level = 0;
				obj_lobby01.sprite_index = spr_lobby01_lvl6;
				break;
			case 7:
				//nothing
				obj_lobby01.sprite_index = spr_lobby01_lvl7;
				break;
			case 8:
				//nothin
				obj_lobby01.sprite_index = spr_lobby01_lvl8;
				break;
			case 9:
				//nothing
				obj_lobby01.sprite_index = spr_lobby01_lvl9;
				break;
			case 10:
				//nothin
				obj_lobby01.sprite_index = spr_lobby01_lvl10;
				break;
			default:
				//idk. free pixelmoney
				changepixelmoney(+100)
				break;
		}
		var _maxlevel = 10
		if (global.level <= _maxlevel) {
			obj_reportbuilding.sprite_index = asset_get_index("spr_reportbuilding_lvl"+string(global.level));
		} else {
			obj_reportbuilding.sprite_index = asset_get_index("spr_reportbuilding_lvl"+string(_maxlevel));
		}
	}
}