if instance_exists(obj_player) { // should this be optimized?
	if obj_player.crouched obj_player.idlemode = 3
	else if global.timer[0] + global.timer[1] <= 0 obj_player.idlemode = 1
	else if obj_player.inventory == invstuff.gun obj_player.idlemode = 2
	else obj_player.idlemode = 0
}

// panic shake
if global.panic {
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
