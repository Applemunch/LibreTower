if global.panic
{
	scr_playmusic(d_escape)
	panictimer -= 1
	if panictimer <= 0 {
		global.timer[1] -= 1
		if global.timer[1] < 0 {
			if global.timer[0] <= 0 {
				game_restart()
			}
			global.timer[0] -= 1
			global.timer[1] = 59
		}
		panictimer = 60
	}
}