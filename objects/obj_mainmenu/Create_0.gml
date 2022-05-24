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

global.savedataname = "LibreTower"
function changeOpt(name, value) {
	ini_open(global.savedataname + ".ini")
	ini_write_real("Options",name,value)
	ini_close()
	return value
}

if !file_exists(global.savedataname + ".ini") {
	ini_open(global.savedataname + ".ini")
	global.sfxvol = ini_write_real("Options","SoundVol",100)
	global.musvol = ini_write_real("Options","MusicVol",100)
	
	global.particles = ini_write_real("Options","Particles",false)
	global.panicshake = ini_write_real("Options","PanicShake",false)
	
	global.resolution = ini_write_real("Options","Resolution",1) // 1 is 960 x 540
	global.fullscreen = ini_write_real("Options","Fullscreen",false)
	
	global.gamepad = ini_write_real("Options","UseGamepad",false)
	ini_close()
} else {
	ini_open(global.savedataname + ".ini")
	global.sfxvol = ini_read_real("Options","SoundVol",100)
	global.musvol = ini_read_real("Options","MusicVol",100)
	
	global.particles = ini_read_real("Options","Particles",false)
	global.panicshake = ini_read_real("Options","PanicShake",false)
	
	global.resolution = ini_read_real("Options","Resolution",1)
	global.fullscreen = ini_read_real("Options","Fullscreen",false)
	
	global.gamepad = ini_read_real("Options","UseGamepad",false)
	ini_close()
}
window_set_fullscreen(global.fullscreen)

function switchOpts() {
	switch curmenu
	{
		case menutype.main:
			curopt = options_main
			break;
		case menutype.options: case menutype.options_video: case menutype.options_audio: case menutype.options_fx:
			selectmax = array_length(curopt) - 1
			exit;
		case menutype.cleardata:
			curopt = options_yesno
			break;
	}
	selectmax = array_length(curopt) - 1
}

shiftdebounce = false