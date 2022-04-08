switch state
{
	case states.normal:
		scr_plr_normal()
		break;
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
	image_index = random_range(0, sprite_get_number(sprite_index) - 1)
	image_speed = 0
	alarm[0] = 30
}