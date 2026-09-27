if !visible exit;

if state == states.taunt draw_sprite(spr_flash, 0, x, y)

var _rx = 18
var _ry = 18
var _spd = point_distance(0, 0, hsp, vsp)

if state == states.grab or state == states.run {
	_rx += min(8, abs(hsp) * 0.45)
	_ry -= min(5, abs(hsp) * 0.20)
}
if state == states.superjump {
	_rx = 14
	_ry = 25
}
if crouched {
	_rx = 21
	_ry = 13
}

// Speed trail.
if _spd > 6 or state == states.grab or state == states.run {
	for (var _t = 3; _t >= 1; _t--) {
		draw_set_alpha(0.05 * (4 - _t))
		draw_set_color(make_color_rgb(238, 247, 250))
		draw_ellipse(
			x - hsp * _t * 1.35 - _rx,
			y - vsp * _t * 0.45 - _ry,
			x - hsp * _t * 1.35 + _rx,
			y - vsp * _t * 0.45 + _ry,
			false
		)
	}
}

// Shadow.
draw_set_alpha(0.20)
draw_set_color(c_black)
draw_ellipse(x - _rx + 3, y + _ry - 2, x + _rx + 7, y + _ry + 7, false)

draw_set_alpha(invuln and (floor(invulm_timer / 4) mod 2 == 0) ? 0.35 : 1)
draw_set_color(make_color_rgb(246, 244, 233))
draw_ellipse(x - _rx, y - _ry, x + _rx, y + _ry, false)
draw_set_color(make_color_rgb(158, 164, 168))
draw_ellipse(x - _rx, y - _ry, x + _rx, y + _ry, true)

// Highlight and tiny orange maker mark.
draw_set_color(c_white)
draw_ellipse(x - _rx * 0.55, y - _ry * 0.60, x - _rx * 0.15, y - _ry * 0.20, false)
draw_set_color(make_color_rgb(225, 92, 45))
draw_circle(x + _rx * 0.27, y + _ry * 0.18, 2.5, false)

draw_set_alpha(1)
draw_set_color(c_white)

if !debug exit

draw_point(x + 25 * sign(hsp), y)
if showcol draw_sprite(mask_index,0,x,y)
if showdebug {
	draw_set_font(fnt_textregular)
	var _i = 1
	for (var i = 0; i < array_length(statevars); i++) {
		if statevars[i] != 0 {
			draw_text(x - 64, (y - 128) + 16 * _i, string(statevars[i]))
			_i++
		}
	}
}