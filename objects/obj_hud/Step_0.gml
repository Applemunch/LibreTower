if instance_exists(obj_player)
{
	if obj_player.state == states.grab hudstate = hudstates.dash
	else hudstate = hudstates.normal
}