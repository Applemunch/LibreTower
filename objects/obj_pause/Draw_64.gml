draw_set_color(c_black)
draw_rectangle(0,0,960,540,false)

draw_set_halign(fa_center)
for (var i = 0; i < array_length(menu); i++) {
	draw_set_color(select == i ? c_red : c_white)
	draw_text(480, 260 + 32 * i, menu[i])
}
draw_set_halign(fa_left)
draw_set_color(c_white)