if scr_buttoncheck_pressed(ord("X"), gp_face4) {
	instance_destroy(self)
	if instance_exists(obj_computer) obj_computer.active = false
}

if scr_buttoncheck_pressed(vk_up, gp_padu) or scr_buttoncheck_pressed(vk_down, gp_padd) {
	lvl_select += scr_buttoncheck_pressed(vk_down, gp_padd) - scr_buttoncheck_pressed(vk_up, gp_padu)
	lvl_select = clamp(lvl_select, 0, lvl_limit)
}

if scr_buttoncheck_pressed(ord("Z"), gp_face3) {
	if !instance_exists(obj_player) {
		if debug show_message("Can't enter level! Player doesn't exist")
		exit;
	}
	with obj_player {
		global.targetDest = "A"
		room_goto(other.levels[other.lvl_select][2])
		changeState(states.normal, true)
		scr_resetlevel()
	}
	instance_destroy(self)
	obj_player.canmove = true
	instance_activate_object(obj_hud)
}