draw_sprite(spr_title, 0, 480, 144)

draw_set_halign(fa_center)
switch curmenu
{
	case menutype.options:
		var theStuff = [
			"Sound Volume: " + string(global.sfxvol),
			"Music Volume: " + string(global.musvol),
			"Fullscreen: " + string(global.fullscreen),
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