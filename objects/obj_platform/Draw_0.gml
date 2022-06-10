if debug
	draw_rectangle(x, y, x + (32 * image_xscale), y + 16, active ? false : true) // hollow = no collision, full = collision
else
	draw_self()