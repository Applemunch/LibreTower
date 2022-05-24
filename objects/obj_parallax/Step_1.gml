/// @desc I put this in begin step to avoid the "bg doesn't change for one frame" issue
var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])

for (var i = 0; i < array_length(bgs); i++) {
	show_debug_message(cam_x)
	show_debug_message(cam_y)
	layer_x(bgs[i], cam_x * bgmults[i])
	layer_y(bgs[i], cam_y * bgmults[i])
}