#macro debug false

global.music = audio_play_sound(d_title,-1,true)
global.ltfont = font_add_sprite_ext(spr_font,"1234567890",false,0)
global.dslist = [] // using a DS list was too buggy
global.collect = 0
global.panic = false
global.timer = [2, 30]

global.tileset = noone // used for secret destructibles

global.detrixies = [0, 0, 0, 0, 0]
global.secrets = [] // stores secret rooms the player visited

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
#region functions

function checkSecret(input) {
	if !array_find(global.secrets, input) {
		array_push(global.secrets, input)
		if instance_exists(obj_message) instance_destroy(obj_message)
		with instance_create_layer(0, 0, "Instances", obj_message) {
			var len = array_length(global.secrets)
			var suffix = len != 1 ? "s" : ""
			if array_length(global.secrets) == global.secret_req {
				text = "You found all of the secrets!"
			} else {
				text = "You found " + string(len) + " secret" + suffix + "!"
			}
		}
	}
}

#endregion
#region rank-related
/*
the ranks go in order from worst to best: F, D, C, B, A, and S

F rank requirements are that you collect NO detrixies or secrets and get enough points for D rank

D, C, B, and A ranks are judged by points (global.rank_req)
A is at or above rank_req, B is 3/4ths of rank_req, C is 1/2 of rank_req, and D is 1/4 of rank_req.
in bitshift terms, A is >>0, B is >>1 > >>2, C is >>1, and D is >>2.
don't worry, points aren't meant to be decimals anyway

S rank requirements are that you find every detrixie, find all the secrets, don't get hurt, and get enough points for an A rank.
*/

global.rank_req = 10000
global.secret_req = 6
global.detrixie_req = 5
#endregion