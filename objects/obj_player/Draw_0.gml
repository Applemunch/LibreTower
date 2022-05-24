if state == states.taunt draw_sprite(spr_flash, 0, x, y)
var usingShader = false
if invuln {
	usingShader = true
	shader_set(shd_invuln)
	shader_set_uniform_f(shader_get_uniform(shd_invuln, "time"), invulm_timer)
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, 1)
if usingShader shader_reset()
if !debug exit
draw_point(x + 25 * sign(hsp), y)
if showcol draw_sprite(mask_index,0,x,y)
if showdebug {
	draw_set_font(fnt_textregular)
	var _i = 1
	for (i = 0; i < array_length(statevars); i++) {
		if statevars[i] != 0 {
			draw_text(x - 64, (y - 128) + 16 * _i, string(statevars[i]))
			_i++
		}
	}
}