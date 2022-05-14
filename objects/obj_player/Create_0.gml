hsp = 0
vsp = 0
onground = false
crouched = false
canmove = true
dogravity = true

walkspeed = 0.3
maxspeed = 6
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
	superjump,
	taunt,
	ouch
}
state = 0
prevstate = state
statetimer = 0 // used to switch between certain states

invuln = false
invulm_timer = 0

enum invstuff {
	none,
	gun,
	melee
}
inventory = invstuff.none

depth = -2
image_speed = 0.25

if !instance_exists(obj_hud) instance_create_layer(0,0,"Instances",obj_hud)

function changeSprite(input) {
	if sprite_index != input sprite_index = input
}

function changeState(input, resetvars = true) {
	state = input
	if resetvars statevars = array_create(32)
}