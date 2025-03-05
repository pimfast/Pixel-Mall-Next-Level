/// @desc

//purchase
if (global.money >= upgradeprice) {
	audio_play_sound(sfx_pixelmall_moneyUp,1,0)
	global.money -= upgradeprice
	upgradewindow.selectedmallpart.level++
	upgradewindow.selectedmallpart.sprite_index = asset_get_index("spr_store_"+string(upgradewindow.selectedmallpart.shopname)+"_lvl"+string(upgradewindow.selectedmallpart.level))
	upgradewindow.selectedmallpart.image_alpha = 1
	upgradewindow.dir = "close"
}
audio_play_sound(sfx_pixelmall_click,1,0)