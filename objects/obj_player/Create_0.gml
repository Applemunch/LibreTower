hsp = 0
vsp = 0
onground = false
crouched = false
canmove = true
dogravity = true

walkspeed = 0.8
maxspeed = 7
idlemode = 0

// Ping Pong Tower movement additions.
pingpong_bounce_cd = 0
pingpong_spin = 0

statevars = array_create(32)
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
statetimer = 0

invuln = false
invulm_timer = 0

depth = -2
image_speed = 0.25

if !instance_exists(obj_hud) instance_create_layer(0,0,"Instances",obj_hud)

function changeSprite(input) {
	if sprite_index != input sprite_index = input
}

function changeState(input, resetvars = true) {
	state = input
	image_index = 0
	if resetvars statevars = array_create(32)
}

if debug {
	showcol = true
	showdebug = true
}