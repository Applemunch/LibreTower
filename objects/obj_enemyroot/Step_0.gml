onground = place_meeting(x, y + 1, obj_solid)

if !onground {
	vsp += 0.35
}
scr_plr_collision() // I know this is meant for PLAYERS, but I assume it works for enemies too

if place_meeting(x,y,obj_player) {
	if obj_player.state == states.grab
	or obj_player.state == states.run and abs(hsp) >= 12 {
		instance_destroy(self)
	}
}