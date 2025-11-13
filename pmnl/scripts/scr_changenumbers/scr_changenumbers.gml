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
	}
}

function mallpartlevelup(tbluMallpart) {
	//tblu = to be leveled up
	tbluMallpart.level++;
	if (tbluMallpart.level == (array_length(tbluMallpart.leveldesc) - 1)) {
		tbluMallpart.mypurchaseupgradelabel.sprite_index = noone;
	} else {
		tbluMallpart.mypurchaseupgradelabel.sprite_index = spr_hko_ip_icon_upgrade;
	}
	
	tbluMallpart.mylevellabel.sprite_index = asset_get_index("spr_label_lvl"+string(tbluMallpart.level));
	
	if (object_get_parent(tbluMallpart.object_index) == obj_employeeparent) {
		tbluMallpart.image_alpha = 1;
		if (tbluMallpart.level == 1) {
			tbluMallpart.mypurchaseupgradelabel.starty -= 22;
			tbluMallpart.mylevellabel.y -= 22
		}
		
		tbluMallpart.servicesp = tbluMallpart.levelservicesp[tbluMallpart.level];
		tbluMallpart.walksp = tbluMallpart.levelwalksp[tbluMallpart.level];
	} 
	if (object_get_parent(tbluMallpart.object_index) == obj_shopparent) {
		tbluMallpart.sprite_index = asset_get_index("spr_store_"+string(upgradewindow.selectedmallpart.shopname)+"_lvl"+string(upgradewindow.selectedmallpart.level));
		tbluMallpart.image_alpha = 1;
	
		tbluMallpart.servicecharge = tbluMallpart.levelcharge[tbluMallpart.level];
		tbluMallpart.servicerating = tbluMallpart.levelrating[tbluMallpart.level];
		tbluMallpart.servicetime = tbluMallpart.leveltime[tbluMallpart.level];
	}
	if (object_get_parent(tbluMallpart.object_index) == obj_miscpartparent) {
		tbluMallpart.sprite_index = asset_get_index("spr_"+string(upgradewindow.selectedmallpart.miscpartname)+"_lvl"+string(upgradewindow.selectedmallpart.level));
		tbluMallpart.image_alpha = 1;
		if (variable_instance_exists(tbluMallpart.id,"myfg")) {
			tbluMallpart.myfg.sprite_index = asset_get_index("spr_"+string(upgradewindow.selectedmallpart.miscpartname)+"_lvl"+string(upgradewindow.selectedmallpart.level)+"b");
			tbluMallpart.myfg.image_alpha = 1;
		}
		
		tbluMallpart.servicecharge = tbluMallpart.levelcharge[tbluMallpart.level];
		tbluMallpart.servicerating = tbluMallpart.levelrating[tbluMallpart.level];
		tbluMallpart.servicetime = tbluMallpart.leveltime[tbluMallpart.level];
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
		}
	obj_reportbuilding.sprite_index = asset_get_index("spr_reportbuilding_lvl"+string(global.level));
	}
}