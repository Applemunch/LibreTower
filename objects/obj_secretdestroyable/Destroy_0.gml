event_inherited()
if global.tileset != noone {
	var tilemap = layer_tilemap_get_id(global.tileset)
	tilemap_set_at_pixel(tilemap, tile_set_empty(tilemap), x, y)
}