switch state
{
	case states.normal:
		collision_circle_list(x, y, 960, all, true, true, objsight, true)
		sprite_index = spr_player_idle
		
		#region chase player
		var plr = collision_circle(x, y, 960, obj_player, true, true)
		if followplayer and plr {
			if debug drawtext = "Chasing player!"
			var movecalc = sign(obj_player.x - x)
			if movecalc != 0 {
				hsp = clamp(hsp + walkspeed * movecalc, -maxspeed, maxspeed)
				if image_xscale <= -1 and hsp > 0 hsp = 0
				if image_xscale >= 1 and hsp < 0 hsp = 0
				sprite_index = spr_player_move
				image_xscale = movecalc
			}
			if place_meeting(x, y + 1, obj_solid) {
				if collision_line(x, y, x - (hsp * 16) * image_xscale, y, obj_solid, true, true) or distance_to_point(y, obj_player.y) > 100 and obj_player.y < y {
					vsp -= 9 + place_meeting(x + hsp, y - 96, obj_solid)
					onground = false
				}
			}
			attacktimer -= 1
			if attacktimer <= 0 {
				if abs(obj_player.x - x) > 250 {
					hsp = 0
					state = states.run
					statetimer = 240
				} else {
					state = choose(states.grab)
					statetimer = 45
				}
			}
		}
		#endregion
		ds_list_clear(objsight)
		break;
	case states.grab:
		sprite_index = spr_player_dash
		hsp = 8 * image_xscale
		statetimer -= 1
		if statetimer <= 0 {
			state = states.normal
			attacktimer = 160 - floor( (100 - hp) * 2)
		}
		break;
	case states.run:
		/*
		statevar 0 is for speed
		statevar 1 is for the run turn
		statevar 2 is for the step sounds
		statevar 3 is for the max speed sound and effects
		*/
		sprite_index = spr_player_run
		statevars[0] += 0.25 * image_xscale
		statevars[0] = clamp(statevars[0], -12, 12)
		statevars[2] -= 1 * (abs(hsp) / 1.75)
		if distance_to_point(x, obj_player.x) >= 50 and image_xscale != sign(obj_player.x - x) {
			statevars[1] = 35
			state = states.runturn
			scr_playsound(sfx_runturn)
			statevars[2] = 0
			statevars[3] = 0
			exit;
		}
		if statetimer <= 0 {
			hsp = 0
			statevars[3] = 0
			state = states.normal
			attacktimer = 100 - floor( (100 - hp) * 2)
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
		statetimer -= 1
		break;
	case states.runturn:
		sprite_index = spr_player_runturn
		if statevars[1] > 0 statevars[1] -= 1
		if image_index >= 3 image_index = 1
		if statevars[1] <= 0 {
			image_xscale = -image_xscale
			state = states.run
			statevars[0] *= -1
			exit;
		}
		hsp = statevars[0]
		break;
	case states.ouch:
		if invuln exit;
		sprite_index = spr_player_hurt
		statevars = array_create(8)
		if onground vsp = -3
		statetimer -= 1
		if statetimer <= 0 {
			state = states.normal
			invuln = true
			invulm_timer = 90
		}
		break;
}

onground = place_meeting(x, y + 1, obj_solid)

if place_meeting(x, y, obj_player) {
	switch obj_player.state
	{
		case states.run:
			if abs(obj_player.hsp) >= 12 {
				state = states.ouch
				scr_playsound(sfx_hurt)
				statetimer = 30
				hp -= 5
			} else hurtplayer()
			break;
		case states.grab:
			if state != states.run and state != states.grab {
				state = states.ouch
				scr_playsound(sfx_hurt)
				statetimer = 30
				hp -= 1
			}  else hurtplayer()
	}
	switch state
	{
		case states.grab: hurtplayer()
		case states.run: if abs(hsp) >= 10 hurtplayer()
	}
}

if !onground {
	vsp += 0.35
	if state == states.normal sprite_index = spr_player_fall
}

if state != states.ouch and invulm_timer > 0 {
	invulm_timer -= 1
	if invulm_timer <= 0 invuln = false
}

scr_plr_collision()