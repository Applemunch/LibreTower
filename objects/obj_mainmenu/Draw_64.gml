for (var i = 0; i < array_length(options); i++) {
	draw_set_color(select == i ? c_red : c_white)
	draw_text(32, 64 + 64 * i, options[i])
}