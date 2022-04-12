toggled = false
image_speed = 0
image_index = toggled ? 1 : 0
things = []

function toggleExitSwitch() {
	toggled = true
	global.panic = true
	image_index = toggled ? 1 : 0
	obj_panicblock.swapActive()
	ds_list_add(global.dslist, self.id)
}