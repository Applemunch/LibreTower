// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_globalthings(){
	// nothing at all
}

function scr_buttoncheck() {
	var i = 0
	var retval = false
	while i < argument_count {
		if keyboard_check(argument[i]) or global.gamepad and gamepad_button_check(0, argument[i]) retval = true
		i++
	}
	return retval
}

function scr_buttoncheck_pressed() {
	var i = 0
	var retval = false
	while i < argument_count {
		if keyboard_check_pressed(argument[i]) or global.gamepad and gamepad_button_check_pressed(0, argument[i]) retval = true
		i++
	}
	return retval
}

function scr_cleardslists() {
	ds_list_clear(global.dslist)
}

function scr_afterimages(type, _hsp, _vsp) {
	switch type
	{
		case afterimages.perpendicular: default:
			with instance_create_layer(x, y, "Instances", obj_particle) {
				sprite_index = other.sprite_index
				image_index = other.image_index
				image_xscale = other.image_xscale
				image_yscale = other.image_yscale
				hspeed = _hsp
				vspeed = _vsp
				alpha = 0.6
				color = c_silver
			}
			with instance_create_layer(x, y, "Instances", obj_particle) {
				sprite_index = other.sprite_index
				iamge_index = other.image_index
				image_xscale = other.image_xscale
				image_yscale = other.image_yscale
				hspeed = -_hsp
				vspeed = -_vsp
				alpha = 0.6
				color = c_purple
			}
			break;
		case afterimages.stationary:
			with instance_create_layer(x, y, "Instances", obj_particle) {
				sprite_index = other.sprite_index
				iamge_index = other.image_index
				hspeed = _hsp
				vspeed = _vsp
				alpha = 0.6
				color = c_silver
			}
			break;
	}

}