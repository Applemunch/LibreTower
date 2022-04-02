draw_set_font(global.ltfont)
draw_text(812, 64, string(global.collect))

if displaymessage {
	draw_set_halign(fa_center)
	draw_text(480, 248, msg_text)
	draw_set_halign(fa_left)
}
draw_set_font(fnt_textregular)