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