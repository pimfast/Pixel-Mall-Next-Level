/// @desc

audio_play_sound(sfx_pixelmall_click,1,0)
image_index += 1

if (image_index >= 9) {
	audio_stop_all()
	audio_play_sound(mus_pixelmall_title,100,1)
	instance_destroy()
}