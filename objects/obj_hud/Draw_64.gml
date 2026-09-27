if !visible exit;

// Keep the original LibreTower HUD face asset.
switch hudstate
{
	case hudstates.hurt:
		draw_sprite(spr_plrhud_hurt,0,64,64)
		break;
	case hudstates.yippee:
		draw_sprite(spr_plrhud_yippee,0,64,64)
		break;
	case hudstates.dash:
		draw_sprite(spr_plrhud_dash,0,64,64)
		break;
	case hudstates.normal:
		draw_sprite(global.panic ? spr_plrhud_panic : spr_plrhud,0,64,64)
		break;
}

draw_set_font(fnt_textregular)
draw_set_color(c_white)
draw_text(108, 30, "PING PONG TOWER")
draw_set_color(make_color_rgb(120, 225, 245))
draw_text(108, 52, global.pingpong_stage)

draw_set_color(c_white)
draw_text(720, 34, "SCORE")
draw_set_font(global.ltfont)
draw_text(812, 58, string(global.collect))
draw_set_font(fnt_textregular)

draw_set_color(make_color_rgb(255, 220, 80))
draw_text(720, 80, "RALLY " + string(global.pingpong_rally))
draw_set_color(c_white)

draw_set_halign(fa_center)

if global.panic {
	var col = 255 - panictime_color
	draw_set_color(make_color_rgb(255, col, col))
	var spacer = global.timer[1] < 10 ? ":0" : ":"
	draw_text(480,timerpos,"MATCH POINT  " + string(global.timer[0]) + spacer + string(global.timer[1]))
	draw_set_color(c_white)
}

if global.pingpong_boss_active {
	draw_set_color(make_color_rgb(10, 20, 30))
	draw_rectangle(278, 488, 682, 522, false)
	draw_set_color(c_white)
	draw_rectangle(278, 488, 682, 522, true)
	draw_set_color(make_color_rgb(205, 35, 70))
	var _bossratio = clamp(global.pingpong_boss_hp / max(1, global.pingpong_boss_maxhp), 0, 1)
	draw_rectangle(286, 497, 286 + 388 * _bossratio, 513, false)
	draw_set_color(make_color_rgb(255, 220, 90))
	draw_text(480, 460, "RAQUETAO")
	draw_set_color(c_white)
}

if displaymessage {
	draw_text(480, 248, msg_text)
}

draw_set_halign(fa_left)

if hudstate != hudstates.normal hudstate_timer -= 1
draw_set_font(fnt_textregular)
draw_set_color(c_white)