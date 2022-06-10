if obj_player.y + 47 < y {
	active = true
} else active = false

mask_index = active ? sprite_index : spr_blank