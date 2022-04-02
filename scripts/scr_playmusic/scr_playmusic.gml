function scr_playmusic(input){
	if !audio_is_playing(input) {
		audio_stop_all()
		global.nusic = audio_play_sound(input,-1,true)
	}
	// set volume and stuff here in the future
}