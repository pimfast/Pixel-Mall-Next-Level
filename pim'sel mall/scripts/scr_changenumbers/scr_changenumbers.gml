// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function changemoney(moneystatement) {
	var moneybeforestatement = global.money
	global.money += moneystatement
	if (global.money < 0) {
		global.money = 0
	}
	
	//draw number text
	if (global.mode == "game") {
		var drawpoint = instance_create_layer(138,30,"UI_Instances",obj_drawpoint)
		drawpoint.drawnumber = (global.money - moneybeforestatement)
		if (moneystatement > 0) {drawpoint.txtcol = c_lime}
		if (moneystatement < 0) {drawpoint.txtcol = c_red}
		
	}
}

function changerating(ratingstatement) {
	var ratingbeforestatement = global.rating
	global.rating += ratingstatement
	if (global.rating < 0.0) {
		global.rating = 0.0
	}
	
	if (global.mode == "game") {
		var drawpoint = instance_create_layer(75,30,"UI_Instances",obj_drawpoint)
		drawpoint.drawnumber = (global.rating - ratingbeforestatement)
		if (ratingstatement > 0) {drawpoint.txtcol = c_lime}
		if (ratingstatement < 0) {drawpoint.txtcol = c_red}
		
	}
}

function changepixelmoney(pixelmoneystatement) {
	var pixelmoneybeforestatement = global.pixelmoney
	global.pixelmoney += pixelmoneystatement
	if (global.pixelmoney < 0) {
		global.pixelmoney = 0
	}
	
	//draw number text
	if (global.mode == "game") {
		var drawpoint = instance_create_layer(205,30,"UI_Instances",obj_drawpoint)
		drawpoint.drawnumber = (global.pixelmoney - pixelmoneybeforestatement)
		if (pixelmoneystatement > 0) {drawpoint.txtcol = c_lime}
		if (pixelmoneystatement < 0) {drawpoint.txtcol = c_red}
		
	}
}

function shoplevelup(selectedshop) {
	//maybe change this to be just a general upgradeable level up? idk
	selectedshop.level++;
	selectedshop.sprite_index = asset_get_index("spr_store_"+string(upgradewindow.selectedmallpart.shopname)+"_lvl"+string(upgradewindow.selectedmallpart.level));
	selectedshop.image_alpha = 1;
	
	selectedshop.servicecharge = selectedshop.levelcharge[selectedshop.level];
	selectedshop.servicerating = selectedshop.levelrating[selectedshop.level];
	selectedshop.servicetime = selectedshop.leveltime[selectedshop.level];
}

function considerlevelup() {
	if (global.level < 100) && (global.money >= global.levelmoneyreq[global.level+1]) && (global.rating >= global.levelratingreq[global.level+1]) {
		global.level++
		switch (global.level) {
			case 1:
				//default level, start with 4 owned and 4 available for purchase
				break;
			case 2:
				//nothing? i think you only get more customers
				changepixelmoney(+50)
				obj_lobby01.sprite_index = spr_lobby01_lvl2
				break;
			case 3:
				obj_hnv01.level = 0
				obj_hnv02.level = 0
				obj_lobby01.sprite_index = spr_lobby01_lvl3
				break;
			case 4:
				//nothing? i think you only get more customers
				changepixelmoney(+50)
				obj_lobby01.sprite_index = spr_lobby01_lvl4
				break;
			case 5:
				obj_buy01.level = 0
				obj_buy02.level = 0
				obj_lobby01.sprite_index = spr_lobby01_lvl5
				break;
			case 6:
				obj_w01.level = 0
				obj_w02.level = 0
				obj_lobby01.sprite_index = spr_lobby01_lvl6
				break;
			case 7:
				obj_w03.level = 0
				obj_lobby01.sprite_index = spr_lobby01_lvl7
				break;
			case 8:
				obj_w04.level = 0
				obj_lobby01.sprite_index = spr_lobby01_lvl8
				break;
			case 9:
				//pretty sure nothing
				obj_lobby01.sprite_index = spr_lobby01_lvl9
				break;
			case 10:
				//nothin
				obj_lobby01.sprite_index = spr_lobby01_lvl10
				break;
		}
	obj_reportbuilding.sprite_index = asset_get_index("spr_reportbuilding_lvl"+string(global.level))
	}
}