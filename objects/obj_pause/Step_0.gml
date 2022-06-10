if scr_buttoncheck_pressed(ord("Z"), gp_face3) {
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
				case agm_1: case agm_2: case agm_3: case agm_4: case agm_5: case agm_secret1: case agm_secret2:
					room_goto(agm_1)
					isValid = true
					break;
				case entrance_1: case entrance_2: case entrance_3:
					room_goto(entrance_1)
					isValid = true
					break;
			}
			if !isValid exit;
			scr_resetlevel()
			instance_destroy(self)
			break;
		case 2:
			if room == hubroom {
				game_restart()
			} else {
				room_goto(hubroom)
				scr_resetlevel()
				instance_destroy(self)
			}
			break;
	}
}

if scr_buttoncheck_pressed(vk_up, gp_padu) select--
if scr_buttoncheck_pressed(vk_down, gp_padd) select++

if select < 0 select = selmax
if select > selmax select = 0