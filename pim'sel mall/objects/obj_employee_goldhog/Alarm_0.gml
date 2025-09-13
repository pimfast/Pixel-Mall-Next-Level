/// @desc finished being served

//get them out the mall
if (attending.serving.class != "vip") {
	changemoney(attending.serving.billmoney);
	changerating(attending.serving.billrating);
} else {
	changemoney(attending.serving.billmoney*3);
	changerating(attending.serving.billrating*3);
}
global.todayshappycustomers += 1;
attending.serving.state = "goingto_exit";
attending.serving = noone;