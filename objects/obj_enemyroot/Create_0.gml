hp = 1
isHurt = false
onGround = false

hsp = 0
vsp = 0

sprite_idle = spr_plrtransition
sprite_move = spr_plrtransition
sprite_scared = spr_genemy_scared
sprite_ded = spr_genemy_dead

mask_index = spr_player_mask

scared = false
scaretimer = 0

function kill() {
	scr_playsound(sfx_enemyhit)
	if global.particles {
		repeat (3) {
			with instance_create_layer(x,y,"Instances",obj_particle) {
				depth = -1
				sprite_index = spr_gibs
				image_index = irandom_range(0, image_number)
				hspeed = irandom_range(-6, 6)
				vspeed = irandom_range(-3, -6)
	
				stepcode = function() {
					vspeed += 0.35
					duration = 2
					if y - sprite_yoffset > room_height instance_destroy(self)
				}
			}
		}
	}
	instance_destroy(self)
}