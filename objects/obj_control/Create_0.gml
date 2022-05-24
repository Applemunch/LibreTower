#macro debug true

global.music = audio_play_sound(d_title,-1,true)
global.ltfont = font_add_sprite_ext(spr_font,"1234567890",false,0)
global.dslist = ds_list_create()
global.collect = 0
global.panic = false
global.timer = [2, 30]

global.tileset = noone // used for secret destructibles

global.detrixies = [0, 0, 0, 0, 0] // take note of the detrixies you collected, they'll count towards ranks

panictimer = 60
panictimespent = 0 // used for wobble shader
didpanicsound = false

//global.particle_falling = part_system_create()

if debug lastkey = noone

#region enums

enum afterimages {
	perpendicular,
	stationary
}

#endregion