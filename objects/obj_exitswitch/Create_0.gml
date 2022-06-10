toggled = false
image_speed = 0
image_index = toggled ? 1 : 0

settime = [2, 30]

function toggleExitSwitch() {
	toggled = true
	array_push(global.dslist, self.id)
	if global.panic exit;
	global.panic = true
	global.timer = settime
	image_index = toggled ? 1 : 0
	//obj_panicblock.swapActive() //FIX THE DAMN ESCAPE BLOCKS
}