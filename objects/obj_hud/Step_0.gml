if instance_exists(obj_player)
{
	switch obj_player.state
	{
		case states.grab:
			hudstate = hudstates.dash
			break;
		case states.ouch:
			hudstate = hudstates.hurt
			break;
		default:
			hudstate = hudstates.normal
			break;
	}
}

if instance_exists(obj_roomtitle) {
	if timerpos < 48 timerpos += 1
} else {
	if timerpos > 16 timerpos -= 1
}