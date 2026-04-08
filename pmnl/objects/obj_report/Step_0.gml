/// @desc

if (dir == "left") {
	if (x > -320) {
		x -= 10;
	
		obj_button_startupgrade.x = x+255;
		obj_button_startupgrade.y = y+386;
		obj_reportbuilding.x = x;
		obj_reportbuilding.y = y;
		obj_reportrating.x = x;
		obj_reportrating.y = y;
		obj_reportarrow_income.x = x+288;
		obj_reportarrow_income.y = y+224;
		obj_reportarrow_satisfaction.x = x+288;
		obj_reportarrow_satisfaction.y = y+256;
	} else {
		showreport = false;
	}
}

if (dir == "right") {
	showreport = true;
	if (x < 0) {
		x += 10;
	
		obj_button_startupgrade.x = x+255;
		obj_button_startupgrade.y = y+386;
		obj_reportbuilding.x = x;
		obj_reportbuilding.y = y;
		obj_reportrating.x = x;
		obj_reportrating.y = y;
		obj_reportarrow_income.x = x+288;
		obj_reportarrow_income.y = y+224;
		obj_reportarrow_satisfaction.x = x+288;
		obj_reportarrow_satisfaction.y = y+256;
	}
}