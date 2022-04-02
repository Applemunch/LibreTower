// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_plrscripts(){
	// do nothing hAHAHAH
}

function scr_plr_grab() {
	hsp = 8 * image_xscale
	if instance_position(x + 30 * sign(hsp), y, obj_solid) != noone {
		statetimer = 0
		state = states.normal
		exit
	}
	statetimer -= 1
	if statetimer <= 0 state = states.normal
}