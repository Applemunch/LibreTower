if global.panic exit;
var music_choice = -1

switch room
{
	case hubroom:
		music_choice = d_hub
		break;
	case agm_1: case agm_2: case agm_3: case agm_4: case agm_5:
		music_choice = d_agm
		break;
}

if music_choice != -1 scr_playmusic(music_choice)