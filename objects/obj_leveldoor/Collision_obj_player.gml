if !instance_exists(obj_hud) exit;

with obj_hud {
	alarm[0] = 1
	displaymessage = true
	msg_text = other.msg_replace
}