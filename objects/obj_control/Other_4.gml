if layer_get_id("Tiles_1") != -1 {
	global.tileset = layer_get_id("Tiles_1")
}

// Keep all original gameplay geometry and destructible assets.
// Thin vertical generic solids become visible ping-pong nets.
with obj_solid {
	pingpong_net = false
	switch object_index
	{
		case obj_destroyable:
		case obj_toughblock:
		case obj_bigdestroyable:
		case obj_destructible:
		case obj_panicblock:
		case obj_panicblock_alt:
			visible = true
			break;
		default:
			pingpong_net = (abs(image_xscale) <= 1.5 and abs(image_yscale) >= 2)
			visible = pingpong_net
			break;
	}
}

// A selection of the original one-way platforms becomes paddle trampolines.
with obj_platform {
	pingpong_racket = ((floor(x / 32) + floor(y / 32)) mod 4 == 0)
}

// Every existing enemy keeps its original gameplay object, but uses ping-pong behavior/visuals.
with obj_enemyroot {
	pingpong_enemy = true
}

didpanicsound = global.panic
global.pingpong_boss_active = false
global.pingpong_boss_hp = 0

switch room
{
	case agm_secret1: case agm_secret2:
		checkSecret(room)
		break;
}

// League/stage labels.
switch room
{
	case hubroom:
		global.pingpong_stage = "PING PONG CLUB"
		break;
	case tutorial_1: case tutorial_2: case tutorial_3: case tutorial_4: case tutorial_5: case tutorial_6:
		global.pingpong_stage = "TRAINING LEAGUE"
		break;
	case entrance_1: case entrance_2: case entrance_3: case entrance_4: case entrance_5:
		global.pingpong_stage = "OPEN QUALIFIERS"
		break;
	case chateau_1: case chateau_2:
		global.pingpong_stage = "CHAMPIONS TABLE"
		break;
	case agm_1: case agm_2: case agm_3: case agm_4:
		global.pingpong_stage = "NEON RALLY"
		break;
	case agm_5:
		global.pingpong_stage = "RAQUETAO FINAL"
		global.pingpong_boss_active = true
		global.pingpong_boss_hp = 8
		global.pingpong_boss_maxhp = 8
		var _boss = instance_create_layer(max(160, room_width - 256), 64, "Instances", obj_slime)
		_boss.pingpong_boss = true
		_boss.pingpong_enemy = true
		_boss.hp = 8
		_boss.pingpong_maxhp = 8
		_boss.pingpong_shot_timer = 45
		_boss.image_xscale = -1
		break;
	case agm_secret1: case agm_secret2:
		global.pingpong_stage = "SECRET RALLY"
		break;
	case armory_1: case armory_left1: case armory_left2: case armory_left3: case armory_right1: case armory_right2: case armory_right3: case armory_right4:
		global.pingpong_stage = "ROBOT LEAGUE"
		break;
	default:
		global.pingpong_stage = "TABLE ARENA"
		break;
}

if global.panic or room == endscreen exit;
var music_choice = -1

switch room
{
	case hubroom:
		music_choice = d_hub
		break;
	case tutorial_1: case tutorial_2: case tutorial_3: case tutorial_4: case tutorial_5: case tutorial_6:
		music_choice = d_tutorial
		break;
	case entrance_1: case entrance_2: case entrance_3:
		music_choice = d_entrance
		break;
	case chateau_1:
		music_choice = d_chateau
		break;
	case agm_1: case agm_2: case agm_3: case agm_4: case agm_5:
		music_choice = d_agm
		break;
	case agm_secret1: case agm_secret2:
		music_choice = d_agmsecret
		break;
	case armory_1: case armory_left1: case armory_left2: case armory_left3: case armory_right1: case armory_right2: case armory_right3: case armory_right4:
		music_choice = d_military
		break;
}

if music_choice != -1 scr_playmusic(music_choice)