displaymessage = false
msg_text = "LEVEL NAME HERE"

enum hudstates {
	normal,
	hurt,
	yippee,
	dash
}
hudstate = hudstates.normal
hudstate_timer = 0

timerpos = 16

panictime_color = 0 // how red the text should be
panictime_lerp = false // used to interpolate the color