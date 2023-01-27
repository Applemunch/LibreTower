enum menutype {
	main,
	options,
	options_audio,
	options_video,
	options_fx,
	cleardata
}
curmenu = menutype.main

options_main = [
	"New Game",
	"Options",
	"Clear Data",
	"Exit"
]
// the settings menu is handled without a variable
options_yesno = [
	"Yes",
	"No"
]
curopt = options_main
select = 0
selectmax = array_length(curopt) - 1
draw_set_font(fnt_textregular)

#region preview vars
//these variables are used for the previews you get when changing options

preview_music = d_agmsecret
preview_sound = -1

preview_soundtimer = 0
function preview_sfx() {
	preview_sound = choose(
		sfx_jump,
		sfx_hjump,
		sfx_bump,
		sfx_collect,
		sfx_detrixie,
		sfx_grab,
		sfx_hurt,
	)
	scr_playsound(preview_sound)
	preview_soundtimer = irandom_range(30, 50)
}

#endregion

global.savedataname = "LibreTower"
function changeOpt(name, value) {
	ini_open(global.savedataname + ".ini")
	ini_write_real("Options",name,value)
	ini_close()
	return value
}

function switchOpts() {
	switch curmenu
	{
		case menutype.main:
			curopt = options_main
			break;
		case menutype.options: case menutype.options_video: case menutype.options_audio: case menutype.options_fx:
			break;
		case menutype.cleardata:
			curopt = options_yesno
			break;
	}
	selectmax = array_length(curopt) - 1
}

function getToggled(input, isCustom = false, custom_on = "On", custom_off = "Off") {
	if isCustom {
		return input ? custom_on : custom_off
	} else {
		return input ? "On" : "Off"
	}
}

if !file_exists(global.savedataname + ".ini") {
	ini_open(global.savedataname + ".ini")
	global.sfxvol = ini_write_real("Options","SoundVol",100)
	global.musvol = ini_write_real("Options","MusicVol",100)
	
	global.particles = ini_write_real("Options","Particles",true)
	global.panicshake = ini_write_real("Options","PanicShake",true)
	
	global.resolution = ini_write_real("Options","Resolution",1) // 1 is 960 x 540
	global.fullscreen = ini_write_real("Options","Fullscreen",false)
	
	global.gamepad = ini_write_real("Options","UseGamepad",false)
	ini_close()
} else {
	ini_open(global.savedataname + ".ini")
	global.sfxvol = ini_read_real("Options","SoundVol",100)
	global.musvol = ini_read_real("Options","MusicVol",100)
	
	global.particles = ini_read_real("Options","Particles",true)
	global.panicshake = ini_read_real("Options","PanicShake",true)
	
	global.resolution = ini_read_real("Options","Resolution",1)
	global.fullscreen = ini_read_real("Options","Fullscreen",false)
	
	global.gamepad = ini_read_real("Options","UseGamepad",false)
	ini_close()
}
window_set_fullscreen(global.fullscreen)

image_speed = 0.25