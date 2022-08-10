if !global.particles {
	instance_destroy(self)
	exit;
}

thundertimer = choose(30, 45, 60) * 60 // 30, 45, or 60 seconds inbetween strikes

cval = 0

depth = 1 // intended to be in the background-