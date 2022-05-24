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
		if scr_buttoncheck(vk_left, gp_padl) or scr_buttoncheck(vk_right, gp_padr) {
			var movecalc = scr_buttoncheck(vk_right, gp_padr) - scr_buttoncheck(vk_left, gp_padl)
			if movecalc != 0 {
				hsp = clamp(hsp + walkspeed * movecalc, -maxspeed, maxspeed)
				if image_xscale <= -1 and hsp > 0 hsp = 0
				if image_xscale >= 1 and hsp < 0 hsp = 0
				changeSprite(spr_player_move)
				image_xscale = scr_buttoncheck(vk_right, gp_padr) ? 1 : -1
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
				case 3:
					changeSprite(spr_player_crouchidle)
					break;
				case 4:
					changeSprite(spr_player_panicidle)
					break;
			}
		}
	}
	if !onground {
		changeSprite(spr_player_fall)
	}
	if !scr_buttoncheck(vk_down, gp_padd) and instance_position(x, y - 36, obj_solid) exit; // don't crouch
	crouched = scr_buttoncheck(vk_down, gp_padd)
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
			case obj_destructible: case obj_destroyable: case obj_bigdestroyable: case obj_secretdestroyable:
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
	/*
	statevar 0 is for speed
	statevar 1 is for the run turn
	statevar 2 is for the step sounds
	statevar 3 is for the max speed sound and effects
	*/
	changeSprite(spr_player_run)
	statevars[0] += 0.25 * image_xscale
	statevars[0] = clamp(statevars[0], -12, 12)
	statevars[2] -= 1 * (abs(hsp) / 1.75)
	var thing = instance_place(x + statevars[0], y, obj_solid)
	if thing != noone {
		switch thing.object_index
		{
			case obj_destructible: case obj_destroyable: case obj_bigdestroyable: case obj_secretdestroyable:
				if abs(hsp) < 12 {
					instance_place(x + statevars[0], y, obj_destructible).hp -= 1
					stunplayer()
					statevars[0] = 0
					break;
				}
				var thing2 = ds_list_create()
				instance_place_list(x + statevars[0], y, obj_destructible, thing2, true)
				if ds_list_size(thing2) != 0 {
					for (var i = 0; i < ds_list_size(thing2); i++) {
						ds_list_find_value(thing2,i).hp -= 1
					}
				}
				ds_list_destroy(thing2)
				break;
			case obj_toughblock: case obj_secrettough:
				if abs(hsp) < 12 {
					if abs(statevars[0]) >= 12 { // if running at full speed, stun
						stunplayer()
						statevars[0] = 0
					} else {
						hsp = 0
						changeState(states.normal)
					}
					break;
				}
				var thing2 = ds_list_create()
				instance_place_list(x + statevars[0], y, obj_toughblock, thing2, true)
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
	if scr_buttoncheck(vk_left, gp_padl) and image_xscale == 1
	or scr_buttoncheck(vk_right, gp_padr) and image_xscale == -1 {
		statevars[1] = 35
		changeState(states.runturn, false)
		scr_playsound(sfx_runturn)
		statevars[2] = 0
		statevars[3] = 0
		exit;
	}
	if scr_buttoncheck(vk_up, gp_padu) and onground and abs(statevars[0]) >= 12 {
		statevars[0] = 11 // has to be 11 to prevent instant superjump nullification
		statevars[1] = false
		changeState(states.superjump, false)
		scr_playsound(sfx_sjump_prep)
		statevars[2] = 0
		hsp = 0
		scr_afterimages(afterimages.perpendicular, 5, 0)
		exit;
	}
	if !scr_buttoncheck(vk_shift, gp_shoulderrb) {
		hsp = 0
		statevars[3] = 0
		changeState(states.normal)
	}
	if statevars[2] <= 0 {
		if onground scr_playsound(sfx_footstep)
		/* if abs(statevars[0]) >= 12 and statevars[3] == 0 {
			scr_afterimages(afterimages.perpendicular, 0, 5)
			statevars[3] = true
		} */
		statevars[2] = 35
	}
	hsp = statevars[0]
}
#endregion

#region runturn
function scr_plr_runturn() {
	changeSprite(spr_player_runturn)
	if statevars[1] > 0 statevars[1] -= 1
	if image_index >= 3 image_index = 1
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
	if invuln exit;
	sprite_index = spr_player_hurt
	if onground vsp = -3
	statetimer -= 1
	if statetimer <= 0 {
		changeState(states.normal)
		canmove = true
		invuln = true
		invulm_timer = 30
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

#region superjump
function scr_plr_superjump() {
	/*
	statevar 0 is for the initial timer
	statevar 1 is a debounce for the superjump start
	*/
	sprite_index = statevars[1] ? spr_player_superjump : spr_player_sjump_prep
	var thing = instance_place(x, y - 1, obj_solid)
	if thing != noone {
		switch thing.object_index
		{
			case obj_destructible: case obj_destroyable: case obj_bigdestroyable: case obj_secretdestroyable:
				thing.hp -= 1
				break;
			case obj_solid: case obj_toughblock:
				hsp = 0
				changeState(states.normal)
				exit;
		}
	}
	
	if statevars[1] and statevars[2] <= 0 {
		changeState(states.normal)
		exit;
	}
	
	if statevars[0] <= 1 and statevars[1] == false {
		vsp = -12
		scr_playsound(sfx_superjump)
		canmove = true
		statevars[1] = true
		statevars[2] = 16
	} else { statevars[0] -= 1 }
	
	if statevars[1] == true and statevars[2] > 0 {
		vsp = -statevars[2]
		statevars[2] -= 0.5
	}
}
#endregion

function hurtplayer(sethsp = -6 * image_xscale, setvsp = -4, removepoints = false) {
	if obj_player.invuln or obj_player.state == states.ouch {
		exit;
	}
	with obj_player {
		scr_playsound(sfx_hurt)
		vsp = setvsp
		hsp = sethsp
		canmove = false
		changeState(states.ouch)
		statetimer = 90
		if removepoints {
			global.collect = max(0, global.collect - 100)
			/*repeat(10) {
			
			}*/
		}
	}
}

function stunplayer(sethsp = -2 * image_xscale, setvsp = -1, time = 30) {
	vsp = setvsp
	hsp = sethsp
	canmove = false
	changeState(states.stunned)
	statetimer = time
}