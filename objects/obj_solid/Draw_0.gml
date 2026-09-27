var _is_net = variable_instance_exists(id, "pingpong_net") ? pingpong_net : false

if !_is_net {
	draw_self()
	exit;
}

var _l = bbox_left
var _r = bbox_right
var _t = bbox_top
var _b = bbox_bottom

draw_set_alpha(0.82)
draw_set_color(make_color_rgb(238, 246, 248))
draw_rectangle(_l, _t, _r, _b, true)

draw_set_alpha(0.42)
for (var _y = _t + 8; _y < _b; _y += 8) {
	draw_line(_l, _y, _r, _y)
}
for (var _x = _l + 8; _x < _r; _x += 8) {
	draw_line(_x, _t, _x, _b)
}

draw_set_alpha(1)
draw_set_color(c_white)
draw_rectangle(_l - 2, _t - 3, _r + 2, _t + 2, false)