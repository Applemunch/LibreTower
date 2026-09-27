if pingpong_racket {
	// Paddle trampoline, drawn without requiring any new binary asset.
	var _w = max(32, 32 * abs(image_xscale))
	var _cx = x + (_w * 0.5)
	var _cy = y + 4
	draw_set_color(make_color_rgb(205, 45, 60))
	draw_ellipse(_cx - _w * 0.38, _cy - 13, _cx + _w * 0.38, _cy + 13, false)
	draw_set_color(c_white)
	draw_ellipse(_cx - _w * 0.38, _cy - 13, _cx + _w * 0.38, _cy + 13, true)
	draw_set_color(make_color_rgb(90, 48, 26))
	draw_line_width(_cx + _w * 0.24, _cy + 8, _cx + _w * 0.42, _cy + 25, 7)
	draw_set_color(c_white)
} else if debug {
	draw_rectangle(x, y, x + (32 * image_xscale), y + 16, active ? false : true)
} else {
	draw_self()
}