/// @desc I'M OUTTA HIYA!!!

state = "goingto_exit"
mood = "mad"
if (shopimat != noone) {
	shopimat.serving = noone
	shopimat = noone
}
changemoney(-10)
changerating(-0.1)