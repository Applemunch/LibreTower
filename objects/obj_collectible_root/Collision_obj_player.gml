switch object_index // doing it this way's less costly than the "add amount var" method
{
	case obj_collectible: default:
		global.collect += 10
		break;
	case obj_bigcollect:
		global.collect += 100
		break;
}
audio_play_sound(sfx_collect,0,false)
array_push(global.dslist, self.id)
if global.particles {
	with instance_create_layer(x, y, "Instances", obj_particle) {
		sprite_index = spr_dust
		duration = 8
		image_speed = 0.60
	}
}
instance_destroy(self)