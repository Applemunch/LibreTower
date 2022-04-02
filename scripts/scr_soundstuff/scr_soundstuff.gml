function scr_soundstuff() {
	// lasagna of the bitch variety
}

function scr_playmusic(input){
	if !audio_is_playing(input) {
		audio_stop_all()
		global.nusic = audio_play_sound(input,-1,true)
	}
	// set volume and stuff here in the future
}

function scr_playsound(input, stopsound = false){
	if stopsound and audio_is_playing(input) audio_stop_sound(input)
	audio_play_sound(input, 0, false)
	// set volume and stuff here in the future
}