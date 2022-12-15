event_inherited()

switch state
{
	case 0:
		if scared exit;
		sprite_index = sprite_idle
		if place_meeting(x * image_xscale, y, obj_solid) or !place_meeting(x + 20 * image_xscale, y + 51, obj_solid) {
			image_xscale = -image_xscale
		}
		hsp = 1 * image_xscale
		
		var sight = collision_line(x - 250, y, x + 250, y, obj_player, false, true)
		if sight {
			state = 1
			statetimer = 40
			image_index = sign(sight.x - x)
		}
		break;
	case 1:
		hsp = 0
		if statetimer <= 20 and !fired {
			with instance_create_layer(x, y, "Instances", obj_hurtprojectile) {
				hspeed = 10 * other.image_xscale
				owner = other
			}
			fired = true
		}
		
		if statetimer > 0 statetimer--
		if statetimer <= 0 {
			state = 0
			fired = false
		}
		var plrsight = collision_line(x - 250, y, x + 250, y, obj_player, false, true)
		if plrsight {
			if plrsight.state == states.run and abs(plrsight.hsp) >= 12 {
				sprite_index = sprite_scared
				scared = true
				hsp = 0
				state = 0
				statetimer = 0
			} else scared = false
		}
}