function scr_soundstuff() {
	// lasagna of the bitch variety
}

function scr_playmusic(input){
	if !audio_is_playing(input) {
		audio_stop_all()
		global.nusic = audio_play_sound(input,-1,true)
	}
	audio_set_master_gain(global.music,global.musvol / 100)
}

function scr_playsound(input, stopsound = false, returnself = false){
	if stopsound and audio_is_playing(input) audio_stop_sound(input)
	var sound = audio_play_sound(input, 0, false)
	audio_set_master_gain(sound, global.sfxvol / 100)
	if returnself return sound // just incase
}