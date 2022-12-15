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
	case states.superjump:
		scr_plr_superjump()
		break;
}

mask_index = crouched ? spr_player_crouchmask : spr_player_mask
walkspeed = 0.4 / (crouched + 1)
maxspeed = 7 / (crouched + 1)
if dogravity {
	onground = false
	var findplatform = instance_place(x, y + 1, obj_platform)
	var findsolid = place_meeting(x, y + 1, obj_solid)
		
	if findsolid or findplatform and bbox_bottom < findplatform.y + 1 onground = true

	if !onground {
		vsp += 0.4
	}
	scr_plr_collision()
}

if canmove { // disable moving, jumping, grabbing, and entering doors
	if onground and scr_buttoncheck_pressed(vk_up, gp_padu) {
		var possibleDoor = instance_place(x,y,obj_door)
		var checkExit = true
		if possibleDoor {
			global.targetDest = possibleDoor.targetDest
			room_goto(possibleDoor.targetRoom)
			changeState(states.normal, true) // reset the player state
			if possibleDoor.object_index == obj_leveldoor and possibleDoor.resetlvl scr_resetlevel()
			checkExit = false
		}
		if checkExit and place_meeting(x, y, obj_exitdoor) and global.panic {
			global.panic = false
			global.timer = [2, 30]
			global.targetDest = "A"
			changeState(states.normal, true)
			obj_hud.visible = false
			obj_player.canmove = false
			room_goto(endscreen)		
		}
	}

	if scr_buttoncheck_pressed(ord("Z"), gp_face3) and state != states.superjump {
		if onground {
			var holdingUp = crouched ? 0 : scr_buttoncheck(vk_up, gp_padu)
			scr_playsound(holdingUp ? sfx_hjump : sfx_jump)
			vsp -= 10 + 1.5 * holdingUp
			onground = false
			if state == states.normal changeSprite(spr_player_fall)
		}
	}
	
	if onground and scr_buttoncheck(vk_shift, gp_shoulderrb) and !place_meeting(x + image_xscale, y, obj_solid) {
		if !crouched and state != states.stunned and state != states.run and state != states.runturn and state != states.superjump and state != states.grab {
			changeState(states.run)
		}
	}
	
	if scr_buttoncheck_pressed(ord("X"), gp_face4) {
		if !crouched and state != states.stunned and state != states.grab and state != states.run and state != states.runturn and state != states.superjump {
			statetimer = 45
			changeState(states.grab)
			scr_playsound(sfx_grab, true)
		}
	}

}

if canmove and scr_buttoncheck_pressed(ord("C"), gp_face1) and state != states.taunt {
	canmove = false
	dogravity = false
	prevstate = state
	changeState(states.taunt)
	sprite_index = spr_player_taunt
	image_index = random_range(0, sprite_get_number(sprite_index))
	image_speed = 0
	scr_playsound(sfx_taunt, true)
	alarm[0] = 25
}

if state != states.ouch and place_meeting(x,y, obj_hurtblock) and !invuln {
	hurtplayer(-6 * image_xscale, -4, true)
}

if scr_buttoncheck_pressed(vk_escape, gp_start) {
	instance_create_layer(0,0,"Instances",obj_pause)
}

if state != states.ouch and invulm_timer > 0 {
	invulm_timer -= 1
	if invulm_timer <= 0 invuln = false
}