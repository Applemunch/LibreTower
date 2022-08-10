if instance_exists(obj_player) { // should this be optimized?
	if obj_player.crouched obj_player.idlemode = 3
	else if global.timer[0] + global.timer[1] <= 0 obj_player.idlemode = 1
	//else if obj_player.inventory == invstuff.gun obj_player.idlemode = 2
	else if global.panic obj_player.idlemode = 4
	else obj_player.idlemode = 0
}

if global.collect > 0 and global.timer[0] + global.timer[1] <= 0 {
	global.collect = max(global.collect - 1, 0)
}

// panic
if global.panic
{
	if global.panicshake {
		panictimespent += 0.5
		var thing = panictimespent / 2000
		view_yport[0] = random_range(-thing, thing)		
	}
	scr_playmusic(d_escape)
	if !didpanicsound {
		var snd = scr_playsound(sfx_escapeon, false, true)
		audio_sound_gain(snd, 0.4, 0)
		didpanicsound = true
	}
	panictimer--
	if panictimer <= 0 {
		panictimer = 60
		if global.timer[0] < 1 and instance_exists(obj_hud) {
			obj_hud.panictime_color = 255
			audio_sound_gain(scr_playsound(sfx_clock, false, true), 2.25 * (global.sfxvol * 0.01), 0)
		}
		if global.timer[0] + global.timer[1] <= 0 exit;
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
	}
}

if keyboard_check_pressed(vk_anykey)
{
	if !debug exit;
	switch keyboard_lastkey
	{
		case vk_f1:
			var tthing = get_integer("LIBRE TOWER - Debug Multi-Tool\n Enter a number to perform an option\n1: Set FPS, 2: Set Player State, 3: Change Room, 4: Change Player Int/Bool", 0)
			switch tthing
			{
				case 0: break;
				case 1:
					thing = get_integer("Set FPS:", 60)
					if !thing thing = 60
					game_set_speed(thing, gamespeed_fps)
					break;
				case 2:
					if !instance_exists(obj_player) {
						show_message("ERROR: There is no player!")
						break;
					}
					thing = get_integer("Set Player State:", 0)
					obj_player.state = thing
					break;
				case 3:
					var _room = get_string("Enter the name of the room", "hubroom")
					var door = get_string("Enter the door's index (A, B, C, D, etc)", "A")
					var room_asset = asset_get_index(_room)
					if !room_asset {
						show_message("ERROR: Room doesn't exist!")
						break;
					}
					global.targetDest = door
					room_goto(room_asset)
					break;
				case 4:
					if !instance_exists(obj_player) {
						show_message("ERROR: There is no player!")
						break;
					}
					thing = get_string("Enter the name of the INTEGER/BOOLEAN variable you'd like to change:", 0)
					var thing2 = get_integer("Enter the new value:", 0)
					if variable_instance_get(obj_player, thing) {
						variable_instance_set(obj_player, thing, thing2)
					}
			}
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
			obj_hud.visible = !obj_hud.visible
			if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)
			with instance_create_layer(0, 0, "Instances", obj_roomtitle) {
				text = "HUD VISIBILITY TOGGLED"
			}
			break;
		case vk_f4:
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
