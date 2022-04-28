if global.timer[0] + global.timer[1] <= 0 {
	global.collect = max(global.collect - 1, 0)
	if obj_player.idlemode != 1 obj_player.idlemode = 1
	
	exit;
}
if global.panic
{
	scr_playmusic(d_escape)
	panictimespent += 1
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
} else {
	panictimespent = 0
}
