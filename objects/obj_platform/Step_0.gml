// Ping Pong Tower marks selected original platforms as paddle trampolines.
// The actual bounce is resolved in obj_player so the original collision system remains untouched.
if pingpong_racket {
	image_speed = 0
}