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
			if hudstate_timer <= 0 hudstate = hudstates.normal
			break;
	}
}

if instance_exists(obj_roomtitle) {
	if timerpos < 48 timerpos += 1
} else {
	if timerpos > 16 timerpos -= 1
}

if panictime_color > 0 {
	panictime_color = clamp(panictime_color - 15 + (panictime_color >> 6), 0, 255)
	// this gets an approximation of the value needed. APPROXIMATION. of the value needed
	// basically, 255 >> 6 is basically 255 / 100 rounded, that's what I based this off of
}