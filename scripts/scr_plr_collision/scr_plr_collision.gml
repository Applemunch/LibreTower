function scr_plr_collision(){
	/*
	here's how thix works:
	the game checks if there's a solid in the direction you're headed
	if there is, it continuously nudges you into your movement direction until you hit a solid
	if not, it simply moves your character accordingly
	
	I did a bit of a hack here for a theory I had:
	if the player or whatever object this code's attached to isn't moving, why bother
	colliding it with solids? it isn't going anywhere, so it doesn't seem necessary to
	check if it's colliding with anything in its SAME SPOT (it's X + 0 is stil X)
	
	hopefully my hack doesn't break anything
	*/
	
	if hsp != 0 {
		var solidthing = instance_place(x + hsp, y, obj_solid)
		if solidthing and solidthing.object_index != obj_slope and solidthing.object_index != obj_platform
		{
			while !place_meeting(x + sign(hsp), y, obj_solid)
				x += sign(hsp)
			hsp = 0
		}
		x += hsp
	}
	
	if vsp != 0 {
		var solidthing = instance_place(x, y + vsp, obj_solid)
		
		if solidthing and solidthing.object_index != obj_slope
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