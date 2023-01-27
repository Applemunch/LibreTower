if room == endscreen exit;
for (var i = 0; i < instance_number(obj_plrtransition); i++) {
	var daTrans = instance_find(obj_plrtransition, i)
	if daTrans.doorindex == global.targetDest {
		x = daTrans.x
		y = daTrans.y
	}
}
hurtplayer(0, -4, false)