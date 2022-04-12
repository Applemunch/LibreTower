if keyboard_check_pressed(ord("Z")) {
	switch select
	{
		case 0:
			instance_activate_all()
			instance_destroy(self)
			break;
		case 1:
			var isValid = false
			switch room
			{
				case agm_1: case agm_2: case agm_3: case agm_4:
					room_goto(agm_1)
					isValid = true
					break;
			}
			if !isValid exit;
			global.collect = 0
			global.targetDest = "A"
			ds_list_clear(global.dslist)
			if instance_exists(obj_player) {
				obj_player.state = states.normal
				obj_player.hsp = 0
				obj_player.vsp = 0
				event_perform_object(obj_player,ev_outside,0)
			}
			instance_destroy(self)
			break;
		case 2:
			if room == hubroom {
				game_restart()
			} else {
				room_goto(hubroom)
				instance_destroy(self)
			}
			break;
	}
}

if keyboard_check_pressed(vk_up) select -= 1
if keyboard_check_pressed(vk_down) select += 1

if select < 0 select = selmax
if select > selmax select = 0