if obj_player.y + 47 < y {
	active = true
} else active = false

mask_index = active ? sprite_index : spr_blank

// to-do: if an object that can collide with this is above it, make it so that ONLY that object and others above it can collide with it