// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function changemoney(moneystatement) {
	global.money += moneystatement
	if (global.money < 0) {
		global.money = 0
	}
}

function changerating(ratingstatement) {
	global.rating += ratingstatement
	if (global.rating < 0.0) {
		global.rating = 0.0
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