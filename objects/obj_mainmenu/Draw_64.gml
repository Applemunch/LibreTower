draw_sprite(spr_title, 0, 480, 144)

draw_set_halign(fa_center)
switch curmenu
{
	case menutype.options:
		var theStuff = [
			"Video",
			"Audio",
			"Effects",
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.options_video:
		var screenres
		switch global.resolution
		{
			case 1: default:
				screenres = "960x540"
				break;
			case 2:
				screenres = "1280x720"
				break;
			case 3:
				screenres = "1600x900"
				break;
			case 4:
				screenres = "1920x1080"
				break;
		}
		var theStuff = [
			"Fullscreen: " + string(global.fullscreen),
			"Screen Resolution: " + screenres,
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.options_audio:
		var theStuff = [
			"Sound Volume: " + string(global.sfxvol),
			"Music Volume: " + string(global.musvol),
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.options_fx:
		var theStuff = [
			"Particles: " + string(global.particles),
			"Panic Shake: " + string(global.panicshake),
			"Use Gamepads: " + string(global.gamepad),
			"Back"
		]
		for (var i = 0; i < array_length(theStuff); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, theStuff[i])
		}
		break;
	case menutype.cleardata:
		draw_set_color(c_white)
		draw_text(480, 192, "Are you sure?")
		for (var i = 0; i < array_length(curopt); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, curopt[i])
		}
		break;
	default:
		for (var i = 0; i < array_length(curopt); i++) {
			draw_set_color(select == i ? c_red : c_white)
			draw_text(480, 260 + 32 * i, curopt[i])
		}
		break;
}
draw_set_halign(fa_left)