function scr_plr_collision(){
	if place_meeting(x + hsp, y, obj_solid) {
		while !place_meeting(x + sign(hsp), y, obj_solid) {
			x += sign(hsp)
		}
		hsp = 0
	}
	x += hsp
	
	if place_meeting(x, y + vsp, obj_solid) {
		while !place_meeting(x, y + sign(vsp), obj_solid) {
			y += sign(vsp)
		}
		vsp = 0
	}
	y += vsp
}