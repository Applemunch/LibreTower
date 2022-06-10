draw_set_halign(fa_center)
draw_text(480, 128, "Your totals:")

draw_text(480, 164, "Rank: " + calcrank)
draw_text(480, 196, string(savedstats[0]) + " points collected")

var thing = 196
if global.detrixie_req <= 5 {
	for (var i = 0; i < global.detrixie_req; i++) {
		var collected = savedstats[1][i] ? "Collected Detrixie #" : "Didn't find Detrixie #"
		thing = 196 + 32 * (i + 1)
		draw_text(480, thing, collected + string(i))
	}
} else { // just in case
	draw_text(480, thing, "Collected " + string(scr_getallofvalue(global.detrixies, true)) + " of " + string(global.detrixie_req) + " Detrixies")
}
draw_text(480, thing + 32, "Found " + string(array_length(savedstats[2])) + " of " + string(global.secret_req) + " secrets")

draw_text(480, 480, "Press JUMP or Enter to continue")
draw_set_halign(fa_left)