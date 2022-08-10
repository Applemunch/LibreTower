draw_sprite_tiled(spr_computerBG, 0, bg_x, bg_y)
draw_set_halign(fa_left)
draw_text(235,147,levels[lvl_select][0])
draw_text_ext(235, 265, levels[lvl_select][1], 24, 377)

bg_x--
bg_y++

if -bg_x >= 200 bg_x = 0
if bg_y >= 200 bg_y = 0