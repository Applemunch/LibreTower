if !global.pingpong_mode {
	draw_self()
	exit;
}

var _rad = max(7, 16 * abs(image_xscale))
draw_set_alpha(0.22)
draw_set_color(c_black)
draw_circle(x + 3, y + 4, _rad, false)
draw_set_alpha(1)
draw_set_color(make_color_rgb(250, 247, 232))
draw_circle(x, y, _rad, false)
draw_set_color(make_color_rgb(165, 168, 170))
draw_circle(x, y, _rad, true)
draw_set_color(make_color_rgb(230, 92, 42))
draw_circle(x + _rad * 0.25, y + _rad * 0.20, max(1.5, _rad * 0.12), false)
draw_set_color(c_white)