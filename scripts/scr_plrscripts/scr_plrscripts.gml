// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_plrscripts(){
	// do nothing hAHAHAH
}

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
			}
		}
	}
	if !onground {
		changeSprite(spr_player_fall)
	}
	crouched = keyboard_check(vk_down)	
}

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
				state = states.normal
				exit;
		}
	}
	var thing = instance_place(x + hsp, y, obj_exitswitch)
	if thing != noone and thing.toggled == false {
		thing.toggleExitSwitch()
		statetimer = 0
		state = states.normal
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
	if statetimer <= 0 state = states.normal
}

function scr_plr_hurt() {
	sprite_index = spr_player_hurt
	if onground vsp = -3
	statetimer -= 1
	if statetimer <= 0 {
		state = states.normal
		canmove = true
	}
}

function hurtplayer(sethsp = -6 * image_xscale, setvsp = -4, removepoints = false) {
	scr_playsound(sfx_hurt)
	vsp = setvsp
	hsp = sethsp
	canmove = false
	state = states.ouch
	statetimer = 90
	if removepoints global.collect = max(0, global.collect - 100)
}