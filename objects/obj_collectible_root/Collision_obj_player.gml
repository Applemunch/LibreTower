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
instance_destroy(self)