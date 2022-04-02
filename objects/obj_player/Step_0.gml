switch state
{
	case states.grab:
		scr_plr_grab()
		break;
}

if canmove {
	onground = place_meeting(x, y + 1, obj_solid)

	if !onground {
		vsp += 0.35
	}

	if state == states.normal {
		if !onground {
			changeSprite(spr_player_fall)
		}
		if keyboard_check(vk_left) or keyboard_check(vk_right) {
			if !keyboard_check(vk_right) - keyboard_check(vk_left) == 0 {
				hsp = clamp(hsp + 0.3 * ( keyboard_check(vk_right) - keyboard_check(vk_left) ), -maxspeed, maxspeed)
				changeSprite(spr_player_move)
				image_xscale = keyboard_check(vk_right) ? 1 : -1
			}
		} else {
			hsp = 0
			changeSprite(spr_player_idle)
		}
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
			vsp -= 9
			onground = false
			changeSprite(spr_player_fall)
		}
	}
	
	if keyboard_check_pressed(ord("X")) {
		if state != states.stunned {
			statetimer = 45
			state = states.grab
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