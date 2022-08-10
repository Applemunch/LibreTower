if cval > 0 {
	draw_set_color(c_white)
	draw_set_alpha(cval / 255)
	draw_rectangle(0, 0, 960, 540, false)
	draw_set_alpha(1)
}