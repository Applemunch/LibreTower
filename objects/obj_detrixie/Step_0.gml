if place_meeting(x, y, obj_player) {
	if instance_exists(obj_message) instance_destroy(obj_message)
	with instance_create_layer(0, 0, "Instances", obj_message) {
		text = "You found Detrixie #" + string(other.index + 1) + "!"
	}
	global.detrixies[index] = 1
	scr_playsound(sfx_collect)
	scr_playsound(sfx_detrixie, true)
	with obj_hud {
		hudstate = hudstates.yippee
		hudstate_timer = 90
	}
	instance_destroy(self)
	array_push(global.dslist, self.id)
}