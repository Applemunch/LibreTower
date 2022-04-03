draw_set_font(global.ltfont)
draw_text(812, 64, string(global.collect))

if displaymessage {
	draw_set_halign(fa_center)
	draw_text(480, 248, msg_text)
	draw_set_halign(fa_left)
}

switch hudstate
{
	case 0:
		draw_sprite(spr_plrhud,0,64,64)
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