if keyboard_check_pressed(ord("Z")) {
	switch select
	{
		case 0:
			room_goto(testroom)
			break;
		case 1:
			// nothing yet
			break;
		case 2:
			// nothing yet
			break;
		case 3:
			game_end()
			break;
	}
}

if keyboard_check_pressed(vk_up) select -= 1
if keyboard_check_pressed(vk_down) select += 1

if select < 0 select = selectmax
if select > selectmax select = 0