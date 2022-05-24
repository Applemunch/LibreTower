event_inherited()

if place_meeting(x * image_xscale, y, obj_solid) or !place_meeting(x + 20 * image_xscale, y + 51, obj_solid) {
	image_xscale = -image_xscale
}
x += 1 * image_xscale