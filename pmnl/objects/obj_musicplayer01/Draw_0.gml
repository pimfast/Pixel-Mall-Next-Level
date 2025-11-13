/// @desc

draw_self();

if (level >= 1) && (global.mode == "game") {
	var _counterx = 45;
	var _countery = 0;
	draw_sprite(spr_musicplayer_counter,0,x+_counterx,y+_countery);
	draw_set_font(fnt_1);
	draw_text(x+_counterx,y+_countery,myusecount);
}