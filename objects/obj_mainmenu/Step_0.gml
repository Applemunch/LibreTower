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
					// nothing yet
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
	}

	switchOpts()
}

if keyboard_check_pressed(vk_up) select -= 1
if keyboard_check_pressed(vk_down) select += 1

if select < 0 select = selectmax
if select > selectmax select = 0