if !global.pingpong_mode {
	draw_self()
	exit;
}

var _boss = pingpong_boss
var _sx = _boss ? 1.75 : 1
var _headw = 20 * _sx
var _headh = 27 * _sx

if _boss and pingpong_hit_timer > 0 and (floor(pingpong_hit_timer / 3) mod 2 == 0) {
	draw_set_alpha(0.35)
}

// Keep a faint trace of the original enemy art behind the paddle form.
draw_set_alpha(0.12)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
draw_set_alpha(1)

// Handle.
draw_set_color(make_color_rgb(92, 48, 25))
draw_line_width(x + 8 * image_xscale * _sx, y + 10 * _sx, x + 28 * image_xscale * _sx, y + 36 * _sx, 8 * _sx)

// Paddle head.
draw_set_color(_boss ? make_color_rgb(145, 25, 55) : make_color_rgb(205, 45, 60))
draw_ellipse(x - _headw, y - _headh, x + _headw, y + _headh * 0.45, false)
draw_set_color(_boss ? make_color_rgb(255, 220, 90) : c_white)
draw_ellipse(x - _headw, y - _headh, x + _headw, y + _headh * 0.45, true)

// Face.
draw_set_color(c_black)
draw_circle(x - 6 * _sx, y - 8 * _sx, 2.5 * _sx, false)
draw_circle(x + 6 * _sx, y - 8 * _sx, 2.5 * _sx, false)

if _boss {
	draw_line_width(x - 9 * _sx, y + 5 * _sx, x + 9 * _sx, y + 5 * _sx, 3)
}

draw_set_alpha(1)
draw_set_color(c_white)