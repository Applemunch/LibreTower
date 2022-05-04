if state == states.taunt draw_sprite(spr_flash, 0, x, y)
draw_sprite_ext(sprite_index, image_index, x, y + 25 * crouched, image_xscale, 1 - 0.5 * crouched, 0, c_white, 1)
if !debug exit
draw_point(x + 25 * sign(hsp), y)
draw_sprite(mask_index,0,x,y)
draw_set_font(fnt_textregular)
var _i = 1
for (i = 0; i < array_length(statevars); i++) {
	if statevars[i] != 0 {
		draw_text(x - 64, (y - 128) + 16 * _i, string(statevars[i]))
		_i++
	}
}