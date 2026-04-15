/// @desc

if (!instance_exists(obj_button_tutorial)) {
	//layer_create(0,"Temp");
	//layer_sprite_create("Temp",0,0,spr_login_temp);
	
	if (buttoncount <= 0) {
		audio_play_sound(sfx_pixelmall_click,1,0);
		buttoncount += 1;
	} else {
		audio_play_sound(sfx_pixelmall_Consumables_SFX,1,0);
		buttoncount = 0;
		messalph = 1;
		file_delete(global.gameUser+".sav");
		game_restart();
	}
}