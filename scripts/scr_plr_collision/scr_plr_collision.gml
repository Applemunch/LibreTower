function scr_plr_collision(){
	// to-do: make unactivated panic blocks NOT collide
	if place_meeting(x, y, obj_slope)
	{
		while place_meeting(x + sign(hsp), y, obj_slope)
			if instance_place(x + sign(hsp), y, obj_slope).image_xscale == self.image_xscale
			or instance_place(x + sign(hsp), y, obj_slope).image_xscale != self.image_xscale {
				y -= 1
			}
		
			vsp = 0
	}
	var solidthing = instance_place(x + hsp, y, obj_solid)
	if solidthing and solidthing.mask_index != spr_blank and solidthing.object_index != obj_slope
	{
		while !place_meeting(x + sign(hsp), y, obj_solid)
			x += sign(hsp)
		hsp = 0
	}
	x += hsp

	var solidthing = instance_place(x, y + vsp, obj_solid)
	if solidthing and solidthing.mask_index != spr_blank and solidthing.object_index != obj_slope
	{
		while !place_meeting(x, y + sign(vsp), obj_solid)
			y += sign(vsp)
		vsp = 0
	}
	y += vsp
}