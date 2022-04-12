hsp = 0
vsp = 0
onground = false
crouched = false
canmove = true
dogravity = true

walkspeed = 0.3
maxspeed = 6
global.targetDest = "A"

enum states {
	normal,
	stunned,
	crouch,
	grab,
	taunt,
	ouch
}
state = 0
prevstate = state
statetimer = 0 // used to switch between certain states

depth = -2
image_speed = 0.25

if !instance_exists(obj_hud) instance_create_layer(0,0,"Instances",obj_hud)

function changeSprite(input) {
	if sprite_index != input sprite_index = input
}