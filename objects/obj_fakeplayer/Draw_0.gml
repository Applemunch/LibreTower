var usingShader = false
if invuln {
	usingShader = true
	shader_set(shd_invuln)
	shader_set_uniform_f(shader_get_uniform(shd_invuln, "time"), invulm_timer)
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, 1)
if usingShader shader_reset()
if !debug exit;
draw_text(x, y - 32, drawtext)
switch state
{
	case states.normal:
		draw_circle(x, y, 960, true)
		draw_line(x, y, x - (hsp * 16) * image_xscale, y)
		break;
}