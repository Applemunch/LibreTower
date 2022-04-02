if global.panic exit;
var music_choice = -1

switch room
{
	case hubroom:
		music_choice = d_hub
		break;
	case agm_1: case agm_2:
		music_choice = d_agm
		break;
}

if music_choice != -1 scr_playmusic(music_choice)