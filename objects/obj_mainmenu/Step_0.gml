if keyboard_check_pressed(ord("Z")) {
	switch curmenu
	{
		case menutype.main:
			switch select
			{
				case 0:
					room_goto(testroom)
					break;
				case 1:
					curmenu = menutype.options
					select = 0
					break;
				case 2:
					curmenu = menutype.cleardata
					select = 0
					break;
				case 3:
					game_end()
					break;
			}
			break;
		case menutype.options:
			switch select
			{
				case 2:
					global.fullscreen = changeOpt("Fullscreen",!global.fullscreen)
					window_set_fullscreen(global.fullscreen)
					break;
				case 3:
					curmenu = menutype.main
					select = 0
					break;
			}
			break;
		case menutype.cleardata:
			switch select
			{
				case 0: // yes
					file_delete(global.savedataname + ".ini")
					game_restart()
					break;
				case 1: // no
					curmenu = menutype.main
					select = 0
					break;
			}
			break;
	}

	switchOpts()
}

if keyboard_check_pressed(vk_up) select -= 1
if keyboard_check_pressed(vk_down) select += 1

if keyboard_check(vk_left) or keyboard_check(vk_right)
{
	if curmenu == menutype.options {
		switch select
		{
			case 0: // sfx volume
				global.sfxvol = changeOpt("SoundVol", clamp(global.sfxvol + keyboard_check(vk_right) - keyboard_check(vk_left), 0, 100) )
				break;
			case 1: // music volume
				global.musvol = changeOpt("MusicVol", clamp(global.musvol + keyboard_check(vk_right) - keyboard_check(vk_left), 0, 100) )
				break;
		}
	}
}

if select < 0 select = selectmax
if select > selectmax select = 0