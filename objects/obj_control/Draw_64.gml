if debug and instance_exists(obj_player) and obj_player.showdebug {
	for (var i = 0; i < array_length(global.detrixies); i++) {
		draw_text(0, 0 + (16 * i), string(global.detrixies[i]))
	}
	draw_text(0, 128, string(obj_player.state))
}