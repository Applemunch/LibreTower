onground = place_meeting(x, y + 1, obj_solid)

if !onground {
	vsp += 0.35
}
scr_plr_collision()

if pingpong_hit_timer > 0 pingpong_hit_timer--

// Final boss: still an original LibreTower enemy object, with tournament behavior layered on top.
if pingpong_boss {
	scared = false
	sprite_index = sprite_idle
	image_speed = 0.25
	
	if instance_exists(obj_player) {
		image_xscale = sign(obj_player.x - x)
		if image_xscale == 0 image_xscale = 1
		
		pingpong_shot_timer--
		if pingpong_shot_timer <= 0 {
			pingpong_shot_timer = irandom_range(55, 85)
			var _ball = instance_create_layer(x, y - 8, "Instances", obj_hurtprojectile)
			_ball.owner = id
			_ball.direction = point_direction(x, y, obj_player.x, obj_player.y)
			_ball.speed = 6
			_ball.image_xscale = 0.45
			_ball.image_yscale = 0.45
			scr_playsound(sfx_bump, true)
		}
		
		if place_meeting(x, y, obj_player) {
			var _attacking = obj_player.state == states.grab or (obj_player.state == states.run and abs(obj_player.hsp) >= 10)
			if _attacking and pingpong_hit_timer <= 0 {
				hp--
				pingpong_hit_timer = 24
				global.pingpong_boss_hp = hp
				global.camshake[0] += 8
				scr_playsound(sfx_enemyhit, true)
				obj_player.hsp = -obj_player.image_xscale * 7
				obj_player.vsp = -5
				
				if hp <= 0 {
					global.pingpong_boss_active = false
					global.collect += 2500
					if !global.panic {
						global.panic = true
						global.timer = [1, 45]
					}
					kill()
					exit;
				}
			} else if !_attacking and !obj_player.invuln {
				with obj_player {
					hurtplayer(-6 * sign(x - other.x), -5, true)
				}
			}
		}
	}
	exit;
}

checkscare()

if place_meeting(x,y,obj_player) {
	var _attack = obj_player.state == states.grab or (obj_player.state == states.run and abs(obj_player.hsp) >= 12)
	if _attack {
		global.pingpong_rally += 1
		global.collect += 75
		kill()
		exit;
	} else if !obj_player.invuln {
		with obj_player {
			hurtplayer(-5 * sign(x - other.x), -4, true)
		}
	}
}

if !scared sprite_index = sprite_idle