event_inherited()

checkscare()

if !scared {
	if sprite_index != sprite_move sprite_index = sprite_move
	if place_meeting(x * image_xscale, y, obj_solid) or !place_meeting(x + 20 * image_xscale, y + 51, obj_solid) {
		image_xscale = -image_xscale
	}
	hsp = 1 * image_xscale
	instance_activate_object(hurtbox)
	with hurtbox {
		x = other.x + 32 * (other.image_xscale - 1)
		y = other.y - 16
	}
} else instance_deactivate_object(hurtbox)