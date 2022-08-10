thundertimer--

if thundertimer <= 0 {
	cval = 100
	scr_playsound(sfx_escapeon)
	thundertimer = choose(30, 45, 60) * 60
}

if cval > 0 {
	cval = clamp(cval - 10 + (cval >> 6), 0, 255)
}