draw_sprite_ext(sprite_index, image_index, x, y + 25 * crouched, image_xscale, 1 - 0.5 * crouched, 0, c_white, 1)
if !debug exit
draw_point(x + 25 * sign(hsp), y)
draw_sprite(mask_index,0,x,y)