options = [
	"New Game",
	"Options",
	"Clear Data",
	"Exit"
]
select = 0
selectmax = array_length(options)
draw_set_font(fnt_textregular)

if !file_exists("LibreTower.ini") {
	ini_open("LibreTower.ini")
	// write options and stuff
	ini_close()
} else {
	ini_open("LibreTower.ini")
	// read options and stuff
	ini_close()
}