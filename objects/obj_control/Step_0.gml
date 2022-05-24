if instance_exists(obj_player) { // should this be optimized?
	if obj_player.crouched obj_player.idlemode = 3
	else if global.timer[0] + global.timer[1] <= 0 obj_player.idlemode = 1
	else if obj_player.inventory == invstuff.gun obj_player.idlemode = 2
	else if global.panic obj_player.idlemode = 4
	else obj_player.idlemode = 0
}

// panic shake
if global.panic and global.panicshake {
	panictimespent += 0.5
	view_yport[0] = random_range(-1 * (panictimespent / 2000), 1 * (panictimespent / 2000))	
}

if global.timer[0] + global.timer[1] <= 0 {
	global.collect = max(global.collect - 1, 0)
	exit;
}

// panic literally everything else
if global.panic
{
	scr_playmusic(d_escape)
	if !didpanicsound {
		var snd = scr_playsound(sfx_escapeon, false, true)
		audio_sound_gain(snd, 0.4, 0)
		didpanicsound = true
	}
	panictimer -= 1
	if panictimer <= 0 {
		global.timer[1] -= 1
		if global.timer[1] < 0 {
			/*
			if global.timer[0] <= 0 {
				game_restart()
			}
			*/
			global.timer[0] -= 1
			global.timer[1] = 59
		}
		panictimer = 60
	}
}

if debug and keyboard_check_pressed(vk_anykey)
{
	switch keyboard_lastkey
	{
		case vk_f1:
			var thing = get_integer("Set FPS:", 60)
			if !thing thing = 60
			game_set_speed(thing, gamespeed_fps)
			break;
		case vk_f2:
			obj_player.showcol = !obj_player.showcol
			var addstring = obj_player.showcol ? "ENABLED" : "DISABLED"
			if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)
			with instance_create_layer(0, 0, "Instances", obj_roomtitle) {
				text = "PLAYER COLLISION VIEW " + addstring
			}
			break;
		case vk_f3:
			instance_deactivate_object(obj_hud)
			if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)
			with instance_create_layer(0, 0, "Instances", obj_roomtitle) {
				text = "HUD DISABLED"
			}
			break;
		case vk_f4:
			instance_activate_object(obj_hud)
			if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)
			with instance_create_layer(0, 0, "Instances", obj_roomtitle) {
				text = "HUD ENABLED"
			}
			break;
		case vk_f5:
			obj_player.showdebug = !obj_player.showdebug
			var addstring = obj_player.showdebug ? "VISIBLE" : "HIDDEN"
			if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)
			with instance_create_layer(0, 0, "Instances", obj_roomtitle) {
				text = "MISC PLAYER DEBUG STUFF " + addstring
			}
			break;
	}
	lastkey = keyboard_lastkey
}
