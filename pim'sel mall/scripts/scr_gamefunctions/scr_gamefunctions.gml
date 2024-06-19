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

function levelup(playerlevel) {
	switch (playerlevel) {
		case 1:
			//default start with 4 owned and 4 available for purchase
			break;
		case 2:
			//nothing? maybe more pixelmoney?
			global.pixelmoney += 50
			break;
		case 3:
			obj_hnv01.level = 0
			break;
		case 4:
			obj_buy01.level = 0
			break;
		case 5:
			obj_hnv02.level = 0
			break;
		case 6:
			obj_buy02.level = 0
			break;
		case 7:
			obj_w01.level = 0
			break;
		case 8:
			obj_w02.level = 0
			break;
		case 9:
			obj_w03.level = 0
			break;
		case 10:
			obj_w04.level = 0
			break;
		default:
			// code here
			break;
	}
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