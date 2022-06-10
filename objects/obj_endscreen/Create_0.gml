savedstats = [
	global.collect,
	global.detrixies,
	global.secrets
]

calcrank = "N/A"

if savedstats[0] >= global.rank_req {
	if scr_getallofvalue(savedstats[1], 1) >= global.detrixie_req
	and array_length(savedstats[2]) >= global.secret_req { //add hurt and secret checks
		calcrank = "S"
	} else {
		calcrank = "A"
	}
} else if savedstats[0] >= (global.rank_req >> 1) + (global.rank_req >> 2)
	calcrank = "B"
else if savedstats[0] >= global.rank_req >> 1 
	calcrank = "C"
else {
	if !array_find(savedstats[1], 1) { //add hurt and secret checks
		calcrank = "F"
	} else {
		calcrank = "D"
	}
}

if debug {
	show_debug_message(string(global.rank_req))
	show_debug_message(string((global.rank_req >> 1) + (global.rank_req >> 2)))
	show_debug_message(string(global.rank_req >> 1))
	show_debug_message(string(global.rank_req >> 2))
	show_debug_message(string(global.detrixie_req))
	show_debug_message(string(global.secret_req))
	show_debug_message(string(scr_getallofvalue(savedstats[1], 1)))
	show_debug_message(string(array_length(savedstats[2])))
}

audio_stop_all()

if calcrank != "N/A" {
	scr_playsound(asset_get_index("sfx_rank" + calcrank), false, false)
}