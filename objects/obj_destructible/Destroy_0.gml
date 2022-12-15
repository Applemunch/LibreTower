array_push(global.dslist, self.id)

switch object_index
{
	case obj_toughblock: case obj_secrettough:
		scr_playsound(sfx_breakmetal, false)
		break;
	default:
		scr_playsound(sfx_break, false)
		break;
}

if global.particles and debrisspr != 0 {
	repeat(2) {
		with instance_create_layer(x,y,"Instances",obj_particle) {
			depth = -1
			sprite_index = other.debrisspr
			image_index = irandom_range(0, 3)
			hspeed = irandom_range(-3, 3)
			vspeed = irandom_range(-6, -3)
	
			stepcode = function() {
				vspeed += 0.35
				duration = 2
				if y - sprite_yoffset > room_height instance_destroy(self)
			}
		}
	}
}