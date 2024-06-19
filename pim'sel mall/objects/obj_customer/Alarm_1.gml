/// @desc I'M OUTTA HIYA!!!

audio_play_sound(sfx_pixelmall_angry,1,0)
state = "goingto_exit"
substate = "upset"
if (shopimat != noone) {
	shopimat.serving = noone
	shopimat = noone
}
changerating(-0.4)