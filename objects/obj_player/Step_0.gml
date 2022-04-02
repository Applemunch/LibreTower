switch state
{
	case states.grab:
		scr_plr_grab()
		break;
}

if canmove {
	onground = place_meeting(x, y + 1, obj_solid)
	mask_index = crouched ? spr_player_crouchmask : spr_player_mask
	walkspeed = 0.3 / (crouched + 1)

	if !onground {
		vsp += 0.35
	}

	if state == states.normal {
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

	if keyboard_check_pressed(vk_up) {
		var possibleDoor = instance_place(x,y,obj_door)
		if possibleDoor {
			global.targetDest = possibleDoor.targetDest
			room_goto(possibleDoor.targetRoom)
		}
	}

	if keyboard_check_pressed(ord("Z")) {
		if onground {
			var holdingUp = crouched ? 0 : keyboard_check(vk_up)
			scr_playsound(holdingUp ? sfx_hjump : sfx_jump)
			vsp -= 9 + 1 * holdingUp
			onground = false
			changeSprite(spr_player_fall)
		}
	}
	
	if keyboard_check_pressed(ord("X")) {
		if state != states.stunned and state != states.grab {
			statetimer = 45
			state = states.grab
			scr_playsound(sfx_grab, true)
		}
	}

	scr_plr_collision()
}

if keyboard_check_pressed(ord("C")) {
	canmove = false
	prevstate = state
	state = states.taunt
	sprite_index = spr_player_taunt
	alarm[0] = 30
}