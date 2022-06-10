hsp = 0
vsp = 0
onground = false
crouched = false
canmove = true
dogravity = true
jumpbuffer = 40

walkspeed = 0.4
maxspeed = 7
idlemode = 0 // 0 = normal, 1 = hurt, 2 = panic (UNUSED), 3 = crouched

statevars = array_create(32) // if you want to add or change a player state and it has a variable, chuck it here
global.targetDest = "A"

enum states {
	normal,
	stunned,
	crouch,
	grab,
	run,
	runturn,
	wallrun,
	superjump,
	taunt,
	ouch
}
state = 0
prevstate = state
statetimer = 0 // used to switch between certain states

invuln = false
invulm_timer = 0

/*
enum invstuff {
	none,
	gun,
	melee
}
inventory = invstuff.none
*/

depth = -2
image_speed = 0.25

if !instance_exists(obj_hud) instance_create_layer(0,0,"Instances",obj_hud)

function changeSprite(input) {
	if sprite_index != input sprite_index = input
}

function changeState(input, resetvars = true) {
	state = input
	image_index = 0 // just for good measure
	if resetvars statevars = array_create(32)
}

if debug {
	showcol = true
	showdebug = true
}