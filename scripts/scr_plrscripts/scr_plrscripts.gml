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
			changeSprite(spr_player_idle)
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
	statetimer -= 1
	if statetimer <= 0 state = states.normal
}