switch object_index // doing it this way's more optimized than the "add amount var" method
{
	case obj_collectible: default:
		global.collect += 10
		break;
	case obj_bigcollect:
		global.collect += 100
		break;
}
audio_play_sound(sfx_collect,0,false)
ds_list_add(global.dslist, self.id)
instance_destroy(self)