#macro debug false

global.music = audio_play_sound(d_title,-1,true)
global.ltfont = font_add_sprite_ext(spr_font,"1234567890",false,0)
global.dslist = ds_list_create()
global.collect = 0
global.panic = false