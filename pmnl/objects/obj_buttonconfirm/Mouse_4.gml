/// @desc

var currencytype = upgradewindow.selectedmallpart.levelcurrency[upgradewindow.mallpartlevel+1];
var selectioncost = upgradewindow.selectedmallpart.levelprice[upgradewindow.mallpartlevel+1];

//purchase
if (upgradewindow.image_xscale == upgradewindow.animpositions[upgradewindow.targetpos]) {
	if (!currencytype) {
		if (global.money >= selectioncost) {
			audio_play_sound(sfx_pixelmall_moneyUp,1,0);
			changemoney(selectioncost * -1);
			
			//level up and then load new sprites and stats to the mall part
			upgradewindow.selectedmallpart.level++;
			loadmallpart(upgradewindow.selectedmallpart);
			
			//close the window
			upgradewindow.dir = -1;
			
			//save
			savegame(global.gameUser);
		}
	} else {
		if (global.pixelmoney >= selectioncost) {
			audio_play_sound(sfx_pixelmall_moneyUp,1,0);
			changepixelmoney(selectioncost * -1);
			
			//level up and then load new sprites and stats to the mall part
			upgradewindow.selectedmallpart.level++;
			loadmallpart(upgradewindow.selectedmallpart);
			
			//close the window
			upgradewindow.dir = -1;
			
			//save
			savegame(global.gameUser);
		}
	}
}
audio_play_sound(sfx_pixelmall_click,1,0);