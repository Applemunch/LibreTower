switch state
{
	case states.normal:
		scr_plr_normal()
		break;
	case states.ouch:
		scr_plr_hurt()
		break;
	case states.stunned:
		scr_plr_stun()
		break;
	case states.grab:
		scr_plr_grab()
		break;
	case states.run:
		scr_plr_run()
		break;
	case states.runturn:
		scr_plr_runturn()
		break;
}


mask_index = crouched ? spr_player_crouchmask : spr_player_mask
walkspeed = 0.3 / (crouched + 1)
if dogravity {
	onground = place_meeting(x, y + 1, obj_solid)

	if !onground {
		vsp += 0.35
	}
	scr_plr_collision()
}

if canmove { // disable moving, jumping, grabbing, and entering doors
	if keyboard_check_pressed(vk_up) {
		var possibleDoor = instance_place(x,y,obj_door)
		if possibleDoor {
			switch possibleDoor.object_index
			{
				case obj_exitdoor:
					if !global.panic exit;
					game_restart()
					break;
				default:
					global.targetDest = possibleDoor.targetDest
					room_goto(possibleDoor.targetRoom)
					changeState(states.normal, true) // reset the player state
					break;
			}
		}
	}

	if keyboard_check_pressed(ord("Z")) {
		if onground {
			var holdingUp = crouched ? 0 : keyboard_check(vk_up)
			scr_playsound(holdingUp ? sfx_hjump : sfx_jump)
			vsp -= 9 + 1 * holdingUp
			onground = false
			if state == states.normal changeSprite(spr_player_fall)
		}
	}
	
	if keyboard_check(vk_shift) and !place_meeting(x + image_xscale, y, obj_solid) {
		if !crouched and state != states.stunned and state != states.run and state != states.runturn {
			changeState(states.run)
		}
	}
	
	if keyboard_check_pressed(ord("X")) {
		if !crouched and state != states.stunned and state != states.grab and state != states.run and state != states.runturn {
			statetimer = 45
			changeState(states.grab)
			scr_playsound(sfx_grab, true)
		}
	}

}

if canmove and keyboard_check_pressed(ord("C")) and state != states.taunt {
	canmove = false
	dogravity = false
	prevstate = state
	changeState(states.taunt)
	sprite_index = spr_player_taunt
	image_index = random_range(0, sprite_get_number(sprite_index))
	image_speed = 0
	alarm[0] = 30
}

if state != states.ouch and place_meeting(x,y, obj_hurtblock) and !invuln {
	hurtplayer(-6 * image_xscale, -4, true)
}

if keyboard_check_pressed(vk_escape) {
	instance_create_layer(0,0,"Instances",obj_pause)
}

if state != states.ouch and invulm_timer > 0 {
	invulm_timer -= 1
	if invulm_timer <= 0 invuln = false
}