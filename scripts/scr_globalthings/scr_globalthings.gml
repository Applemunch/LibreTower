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
	global.dslist = []
}

function scr_afterimages(type, _hsp, _vsp) {
	switch type
	{
		case afterimages.perpendicular: default:
			with instance_create_layer(x, y, "Instances", obj_particle) {
				sprite_index = other.sprite_index
				image_index = other.image_index
				image_speed = 0
				image_xscale = other.image_xscale
				image_yscale = other.image_yscale
				hspeed = _hsp
				vspeed = _vsp
				alpha = 0.6
				color = c_silver
			}
			with instance_create_layer(x, y, "Instances", obj_particle) {
				sprite_index = other.sprite_index
				image_index = other.image_index
				image_speed = 0
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
				image_index = other.image_index
				image_speed = 0
				hspeed = _hsp
				vspeed = _vsp
				alpha = 0.6
				color = c_silver
			}
			break;
	}
}

function scr_resetlevel() {
	global.collect = 0
	global.targetDest = "A"
	global.panic = false
	global.timer = [2, 30]
	global.detrixies = [0, 0, 0, 0, 0]
	global.secrets = []
	if instance_exists(obj_player) {
		obj_player.hsp = 0
		obj_player.vsp = 0
		with obj_player
		{
			changeState(states.normal, true)
			for (var i = 0; i < instance_number(obj_plrtransition); i++)
			{
				var daTrans = instance_find(obj_plrtransition, i)
				if daTrans.doorindex == "A"
				{
					self.x = daTrans.x
					self.y = daTrans.y
				}
			}
		}
	}
	audio_sound_set_track_position(global.music, 0) // pseudo-restart music
	scr_cleardslists()
}

function scr_getallofvalue(array, value) {
	if typeof(array) != "array" exit;
	var instances = 0
	for (var i = 0; i < array_length(array); i++) {
		if array[i] == value {
			instances += 1
		}
	}
	return instances
}

function array_find(array, value) {
	if typeof(array) != "array" exit;
	for (var i = 0; i < array_length(array); i++) {
		if array[i] == value return true
	}
	return false
}