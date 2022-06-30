onground = place_meeting(x, y + 1, obj_solid)

if !onground {
	vsp += 0.35
}
scr_plr_collision() // I know this is meant for PLAYERS, but I assume it works for enemies too

var plrsight = collision_line(x - 250, y, x + 250, y, obj_player, false, true)
if plrsight {
	if plrsight.state == states.run and abs(plrsight.hsp) >= 12 {
		sprite_index = sprite_scared
		image_index = sign(obj_player.x - x)
		scared = true
		hsp = 0
	} else scared = false
}

if place_meeting(x,y,obj_player) {
	if obj_player.state == states.grab
	or obj_player.state == states.run and abs(obj_player.hsp) >= 12 {
		kill()
	}
}

if !scared sprite_index = sprite_idle