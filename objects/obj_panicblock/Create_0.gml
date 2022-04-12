active = !global.panic
mask_index = active == false ? spr_blank : spr_solid

function swapActive() {
	active = !active
	mask_index = active == false ? spr_blank : spr_solid
}