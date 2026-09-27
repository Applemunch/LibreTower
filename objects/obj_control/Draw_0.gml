if !global.pingpong_mode exit;

// Arena/court base rendered BEHIND LibreTower's original room artwork.
var _bg1 = make_color_rgb(5, 28, 45);
var _bg2 = make_color_rgb(8, 62, 78);
var _line = make_color_rgb(210, 245, 250);

draw_set_alpha(1);
draw_set_color(_bg1);
draw_rectangle(0, 0, room_width, room_height, false);

draw_set_alpha(0.45);
draw_set_color(_bg2);
draw_rectangle(0, room_height * 0.34, room_width, room_height, false);

// Court markings. Original tiles/sprites are still drawn over this.
draw_set_alpha(0.18);
draw_set_color(_line);
for (var _x = 0; _x < room_width; _x += 320) {
	draw_rectangle(_x, 0, _x + 2, room_height, false);
}
for (var _y = 96; _y < room_height; _y += 160) {
	draw_rectangle(0, _y, room_width, _y + 2, false);
}

draw_set_alpha(0.28);
draw_rectangle(room_width * 0.5 - 2, 0, room_width * 0.5 + 2, room_height, false);
draw_set_alpha(1);
draw_set_color(c_white);