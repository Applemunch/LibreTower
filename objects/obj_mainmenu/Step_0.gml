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