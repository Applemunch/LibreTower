if layer_get_id("Tiles_1") != -1 {
	global.tileset = layer_get_id("Tiles_1")
	with obj_solid {
		switch object_index
		{
			case obj_destroyable: case obj_destructible: break;
			default: visible = false break;
		}
	}
}
didpanicsound = global.panic

if global.panic exit;
var music_choice = -1

switch room
{
	case hubroom:
		music_choice = d_hub
		break;
	case entrance_1: case entrance_2: case entrance_3:
		music_choice = d_entrance
		break;
	case agm_1: case agm_2: case agm_3: case agm_4: case agm_5:
		music_choice = d_agm
		break;
	case agm_secret1:
		music_choice = d_agmsecret
		break;
}

if music_choice != -1 scr_playmusic(music_choice)