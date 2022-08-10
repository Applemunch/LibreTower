if scr_buttoncheck_pressed(vk_up, gp_padu) {
	instance_create_layer(0, 0, "Instances", obj_computermenu)
	instance_deactivate_object(obj_hud)
	active = true
	obj_player.canmove = false
	obj_player.visible = false
}

if !active {
	obj_player.canmove = true
	obj_player.visible = true
	instance_activate_object(obj_hud)	
}