/// @desc

audio_play_sound(sfx_pixelmall_click,1,0)
instance_create_layer(0,0,"Game",obj_button_tutorial)

audio_group_stop_all(ag_mus)
audio_play_sound(mus_pixelmallmaybe_musicbox,100,1)