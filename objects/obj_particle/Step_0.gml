if stepcode != noone {
	stepcode()
}

duration -= 1
if duration <= 0 or killonanimend and image_index >= sprite_get_number(sprite_index) instance_destroy(self)