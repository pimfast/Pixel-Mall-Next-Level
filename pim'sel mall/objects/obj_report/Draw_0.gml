/// @desc

draw_self();

//if (global.todaysmoney > global.startofdaymoney) {
	
//}

draw_set_font(fnt_2);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text(x+160,y+223,string(global.todaysmoney));
draw_text(x+160,y+256,string(global.todaysrating));
draw_text(x+96,y+288,string(global.todayshappycustomers));
draw_text(x+256,y+288,string(global.todaysupsetcustomers));

var _reqstrX = 108;
var _moneyreqstrY = 363;
var _ratingreqstrY = 395;
if (global.level < 100) {
	draw_text(x+_reqstrX,y+_moneyreqstrY,string(global.levelmoneyreq[global.level+1]));
	
	var levelratingreqstring = string(global.levelratingreq[global.level+1]);
	if (string_count(".",levelratingreqstring) == 0) {
		levelratingreqstring = levelratingreqstring+".00";
	} else {
		levelratingreqstring = string_delete(levelratingreqstring,string_pos(".",levelratingreqstring)+2,1);
	}
	draw_text(x+_reqstrX,y+_ratingreqstrY,levelratingreqstring);
} else {
	draw_text(x+_reqstrX,y+_moneyreqstrY,"MAX LEVEL!");
	draw_text(x+_reqstrX,y+_ratingreqstrY,"MAX LEVEL!");
}

draw_set_font(fnt_1);
draw_set_color(c_dkgray);
draw_text_transformed(x+80,y+196,"Today's Report",1.2,1.2,0);
draw_text_transformed(x+98,y+335,"Next Level Requirements",1.2,1.2,0);