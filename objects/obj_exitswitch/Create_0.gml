toggled = false
image_speed = 0
image_index = toggled ? 1 : 0

function toggleExitSwitch() {
	toggled = true
	global.panic = true
	image_index = toggled ? 1 : 0
	//obj_panicblock.swapActive() //FIX THE DAMN ESCAPE BLOCKS
	ds_list_add(global.dslist, self.id)
}