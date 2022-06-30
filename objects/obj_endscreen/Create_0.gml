savedstats = [
	global.collect,
	global.detrixies,
	global.secrets
]

calcrank = "N/A"

if savedstats[0] >= global.rank_req {
	if global.timeshurt <= 0
	and array_length(savedstats[2]) >= global.secret_req
	and scr_getallofvalue(savedstats[1], 1) >= global.detrixie_req {
		calcrank = "S"
	} else {
		calcrank = "A"
	}
} else if savedstats[0] >= (global.rank_req >> 1) + (global.rank_req >> 2)
	calcrank = "B"
else if savedstats[0] >= global.rank_req >> 1 
	calcrank = "C"
else {
	if !array_find(savedstats[1], 1)
	and array_length(savedstats[2]) == 0 {
		calcrank = "F"
	} else {
		calcrank = "D"
	}
}

#region rank explanation
/*
If score is over or at the A rank requirement:
- If the player was never hurt, all secrets were found, and all Detrixies were collected, give an S Rank
- Else, give an A Rank

If score is in the B Rank threshold, give a B Rank

If score is in the C Rank threshold, give a C Rank

If score is below the C Rank threshold:
- If the player didn't bother to find a secret or get a Detrixie, give an F Rank.
- Else, give a D Rank
*/
#endregion

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