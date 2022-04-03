global.collect += amount
audio_play_sound(sfx_collect,0,false)
ds_list_add(global.dslist, self.id)
instance_destroy(self)