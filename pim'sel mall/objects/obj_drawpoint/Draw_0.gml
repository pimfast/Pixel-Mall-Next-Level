/// @desc

y -= 0.1;
alpha -= 0.01;

if (alpha <= 0) {
	instance_destroy(self);
}

var thething = string(abs(drawnumber));
if (string_count(".",thething) != 0) {
	thething = string_delete(thething,string_pos(".",thething)+2,1);
}

draw_set_font(fnt_1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_color(x,y,thething,txtcol,txtcol,txtcol,txtcol,alpha);