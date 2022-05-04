// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_plrscripts(){
	// do nothing hAHAHAH
}

#region normal
function scr_plr_normal() {
	if !canmove exit;
	if keyboard_check(vk_up) and onground {
		hsp = 0
		changeSprite(spr_player_hjump_prep)
	} else {
		if keyboard_check(vk_left) or keyboard_check(vk_right) {
			if !keyboard_check(vk_right) - keyboard_check(vk_left) == 0 {
				hsp = clamp(hsp + walkspeed * ( keyboard_check(vk_right) - keyboard_check(vk_left) ), -maxspeed, maxspeed)
				changeSprite(spr_player_move)
				image_xscale = keyboard_check(vk_right) ? 1 : -1
			}
		} else {
			hsp = 0
			switch idlemode
			{
				case 0: default:
					changeSprite(spr_player_idle)
					break;
				case 1:
					changeSprite(spr_player_hurtidle)
					break;
				case 2:
					changeSprite(spr_player_gunidle)
					break;
			}
		}
	}
	if !onground {
		changeSprite(spr_player_fall)
	}
	crouched = keyboard_check(vk_down)	
}
#endregion

#region grab
function scr_plr_grab() {
	changeSprite(spr_player_dash)
	hsp = 8 * image_xscale
	var thing = instance_place(x + hsp, y, obj_solid)
	if thing != noone {
		switch thing.object_index
		{
			case obj_destructible: case obj_destroyable:
				var thing2 = ds_list_create()
				instance_place_list(x + hsp, y, obj_destructible, thing2, true)
				if ds_list_size(thing2) != 0 {
					for (var i = 0; i < ds_list_size(thing2); i++) {
						ds_list_find_value(thing2,i).hp -= 1
					}
				}
				ds_list_destroy(thing2)
				break;
			case obj_solid:
				statetimer = 0
				changeState(states.normal)
				exit;
		}
	}
	var thing = instance_place(x + hsp, y, obj_exitswitch)
	if thing != noone and thing.toggled == false {
		thing.toggleExitSwitch()
		statetimer = 0
		changeState(states.normal)
		hsp = 3 * -image_xscale
		vsp = 2
	}
	/* this code is for a grab cancel. It's commented because it probably doesn't fit with how I want Libre Tower's gameplay to be
	if keyboard_check_pressed(vk_left) and image_xscale == 1
	or keyboard_check_pressed(vk_right) and image_xscale == -1 { // grab cancel
		statetimer = 0
		state = states.normal
	} */
	statetimer -= 1
	if statetimer <= 0 changeState(states.normal)
}
#endregion

#region run
function scr_plr_run() {
	changeSprite(spr_player_run)
	statevars[0] += 0.25 * image_xscale // add minor acceleration as running continues
	statevars[0] = clamp(statevars[0], -12, 12)
	var thing = instance_place(x + statevars[0], y, obj_solid)
	if thing != noone {
		switch thing.object_index
		{
			case obj_destructible: case obj_destroyable:
				var thing2 = ds_list_create()
				instance_place_list(x + statevars[0], y, obj_destructible, thing2, true)
				if ds_list_size(thing2) != 0 {
					for (var i = 0; i < ds_list_size(thing2); i++) {
						ds_list_find_value(thing2,i).hp -= 1
					}
				}
				ds_list_destroy(thing2)
				break;
			case obj_solid:
				if abs(statevars[0]) >= 12 { // if running at full speed, stun
					stunplayer()
					statevars[0] = 0
				} else {
					hsp = 0
					changeState(states.normal)
				}
				exit;
		}
	}
	if keyboard_check_pressed(vk_left) and image_xscale == 1
	or keyboard_check_pressed(vk_right) and image_xscale == -1 {
		statevars[1] = 45
		changeState(states.runturn, false)
		exit;
	}
	if !keyboard_check(vk_shift) {
		hsp = 0
		changeState(states.normal)
	}
	hsp = statevars[0]
}
#endregion

#region runturn
function scr_plr_runturn() {
	changeSprite(spr_player_runturn)
	if statevars[1] > 0 statevars[1] -= 1
	if statevars[1] <= 0 {
		image_xscale = -image_xscale
		changeState(states.run, false)
		statevars[0] *= -1
		exit;
	}
	hsp = statevars[0]
}
#endregion

#region hurt
function scr_plr_hurt() {
	sprite_index = spr_player_hurt
	if onground vsp = -3
	statetimer -= 1
	if statetimer <= 0 {
		changeState(states.normal)
		canmove = true
	}
}
#endregion

#region stun
function scr_plr_stun() {
	sprite_index = spr_player_hurt
	statetimer -= 1
	if statetimer <= 0 {
		changeState(states.normal)
		canmove = true
	}
}
#endregion

function hurtplayer(sethsp = -6 * image_xscale, setvsp = -4, removepoints = false) {
	scr_playsound(sfx_hurt)
	vsp = setvsp
	hsp = sethsp
	canmove = false
	changeState(states.ouch)
	statetimer = 90
	if removepoints global.collect = max(0, global.collect - 100)
}

function stunplayer(sethsp = -2 * image_xscale, setvsp = -1, time = 30) {
	vsp = setvsp
	hsp = sethsp
	canmove = false
	changeState(states.stunned)
	statetimer = time
}