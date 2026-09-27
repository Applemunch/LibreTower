#macro debug false

global.music = audio_play_sound(d_hub,-1,true)
global.ltfont = font_add_sprite_ext(spr_font,"1234567890",false,0)
global.dslist = []
global.collect = 0
global.panic = false
global.timer = [2, 30]
global.keys = 0

global.tileset = noone

global.detrixies = [0, 0, 0, 0, 0]
global.secrets = []

global.camshake = [0, 0]
global.camshake_xdir = 1

// Ping Pong Tower state. The original LibreTower assets and rooms remain intact.
global.pingpong_mode = true
global.pingpong_stage = "TABLE TRAINING"
global.pingpong_rally = 0
global.pingpong_boss_active = false
global.pingpong_boss_hp = 0
global.pingpong_boss_maxhp = 8

panictimer = 60
panictimespent = 0
didpanicsound = false

camxoffset = 0

// Draw the court background behind the original room art.
depth = 1000000

if debug {
	lastkey = noone
	show_debug_overlay(true)
}

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
				text = "You found all of the secret tables!"
			} else {
				text = "You found " + string(len) + " secret table" + suffix + "!"
			}
		}
	}
}

#endregion
#region rank-related

global.rank_req = 10000
global.secret_req = 6
global.detrixie_req = 5
global.timeshurt = 0
#endregion