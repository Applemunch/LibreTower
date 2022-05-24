draw_set_font(global.ltfont)
draw_text(812, 64, string(global.collect))


draw_set_halign(fa_center)
draw_set_font(fnt_textregular)

if global.panic {
	var col = 255 - panictime_color
	draw_set_color(make_color_rgb(255, col, col))
	var spacer = global.timer[1] < 10 ? ":0" : ":"
	draw_text(480,timerpos,string(global.timer[0]) + spacer + string(global.timer[1]))
	draw_set_color(c_white)
}

if displaymessage {
	draw_text(480, 248, msg_text)
	draw_set_font(global.ltfont)
}
draw_set_halign(fa_left)

switch hudstate
{
	case 0:
		draw_sprite(global.panic ? spr_plrhud_panic : spr_plrhud,0,64,64)
		break;
	case 1:
		draw_sprite(spr_plrhud_hurt,0,64,64)
		break;
	case 2:
		draw_sprite(spr_plrhud_yippee,0,64,64)
		break;
	case 3:
		draw_sprite(spr_plrhud_dash,0,64,64)
		break;
}
if hudstate != hudstates.normal hudstate_timer -= 1
draw_set_font(fnt_textregular)