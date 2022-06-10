function scr_soundstuff() {
	// lasagna of the bitch variety
}

function scr_playmusic(input){
	if !audio_is_playing(input) {
		audio_stop_all()
		global.music = audio_play_sound(input,-1,true)
		audio_sound_gain(global.music, global.musvol / 100, 0)
	}
}

function scr_playsound(input, stopsound = false, returnself = false){
	if stopsound and audio_is_playing(input) audio_stop_sound(input)
	var sound = audio_play_sound(input, 0, false)
	audio_sound_gain(sound, global.sfxvol / 100, 0)
	if returnself return sound // just incase
}