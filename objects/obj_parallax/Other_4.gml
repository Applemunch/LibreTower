var noParallax = false
var i = 1
while noParallax == false {
	var layerstring = "BGParallax_" + string(i)
	var _layer = layer_get_id(layerstring)
	if _layer != -1 {
		array_push(bgs, _layer)
		array_push(bgmults, 0.7 / i)
		show_debug_message(_layer)
	} else {
		noParallax = true
		exit;
	}
	i += 1
}