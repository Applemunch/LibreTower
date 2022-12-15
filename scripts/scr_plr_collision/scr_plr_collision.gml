/*
function scr_plr_collision(){
	////
	here's how thix works:
	the game checks if there's a solid in the direction you're headed
	if there is, it continuously nudges you into your movement direction until you hit a solid
	if not, it simply moves your character accordingly
	
	I did a bit of a hack here for a theory I had:
	if the player or whatever object this code's attached to isn't moving, why bother
	colliding it with solids? it isn't going anywhere, so it doesn't seem necessary to
	check if it's colliding with anything in its SAME SPOT (it's X + 0 is stil X)
	
	hopefully my hack doesn't break anything
	////
	
	if hsp != 0 {
		var solidthing = instance_place(x + hsp, y, obj_solid)
		if solidthing and solidthing.object_index != obj_slope and !(solidthing.object_index == obj_platform and bbox_bottom - 1 > solidthing.y)
		{
			while !place_meeting(x + sign(hsp), y, obj_solid)
				x += sign(hsp)
			hsp = 0
		}
		x += hsp
	}
	
	if vsp != 0 {
		var solidthing = instance_place(x, y + vsp, obj_solid)
		
		if solidthing and solidthing.object_index != obj_slope and !(solidthing.object_index == obj_platform and bbox_bottom - 1 > solidthing.y)
		{
			while !place_meeting(x, y + sign(vsp), obj_solid)
				y += sign(vsp)
			vsp = 0
		}
		y += vsp
	}

	if place_meeting(x, y, obj_slope)
	{
		while place_meeting(x + sign(hsp), y, obj_slope)
			if instance_place(x + sign(hsp), y, obj_slope).image_xscale == self.image_xscale
			or instance_place(x + sign(hsp), y, obj_slope).image_xscale != self.image_xscale {
				y--
			}
		
			vsp = 0
	}

}
*/

function scr_plr_collision() {
	if place_meeting(x + hsp, y, obj_slope)
	{
		while place_meeting(x + hsp, y, obj_slope)
			y--
		
			vsp = 0
	}
	
	// let's try doing the platform separately
	// it might not be the best for performance, but
	// I honestly just want SOME people to stop fucking complaining
	if hsp != 0 {
		var findsolid = instance_place(x + hsp, y, obj_solid)
		
		if findsolid {
			while !place_meeting(x + sign(hsp), y, obj_solid)
				x += sign(hsp)
			hsp = 0
		}
	}
	x += hsp

	if vsp != 0 {
		var findplatform = instance_place(x, y + vsp, obj_platform)
		var findsolid = instance_place(x, y + vsp, obj_solid)

		if findsolid {
			while !place_meeting(x, y + sign(vsp), obj_solid)
				y += sign(vsp)
			vsp = 0
		}
		
		else if findplatform and bbox_bottom < findplatform.y + 1 {
			while !place_meeting(x, y + sign(vsp), obj_platform)
				y += sign(vsp)
			vsp = 0
		}
	}
	y += vsp
}