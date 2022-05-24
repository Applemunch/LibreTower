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
				case agm_1: case agm_2: case agm_3: case agm_4:
					room_goto(agm_1)
					isValid = true
					break;
				case entrance_1: case entrance_2: case entrance_3:
					room_goto(entrance_1)
					isValid = true
					break;
			}
			if !isValid exit;
			global.collect = 0
			global.targetDest = "A"
			scr_cleardslists()
			if instance_exists(obj_player) {
				obj_player.state = states.normal
				obj_player.hsp = 0
				obj_player.vsp = 0
				with obj_player
					{
					for (var i = 0; i < instance_number(obj_plrtransition); i++) {
						var daTrans = instance_find(obj_plrtransition, i)
						if daTrans.doorindex == "A" {
							self.x = daTrans.x
							self.y = daTrans.y
						}
					}
				}
			}
			instance_destroy(self)
			break;
		case 2:
			if room == hubroom {
				game_restart()
			} else {
				room_goto(hubroom)
				global.collect = 0
				global.targetDest = "A"
				scr_cleardslists()
				if instance_exists(obj_player) {
					obj_player.hsp = 0
					obj_player.vsp = 0
					with obj_player
					{
						changeState(states.normal)
						for (var i = 0; i < instance_number(obj_plrtransition); i++) {
							var daTrans = instance_find(obj_plrtransition, i)
							if daTrans.doorindex == "A" {
								self.x = daTrans.x
								self.y = daTrans.y
							}
						}
					}
				}
				instance_destroy(self)
			}
			break;
	}
}

if scr_buttoncheck_pressed(vk_up, gp_padu) select -= 1
if scr_buttoncheck_pressed(vk_down, gp_padd)  select += 1

if select < 0 select = selmax
if select > selmax select = 0