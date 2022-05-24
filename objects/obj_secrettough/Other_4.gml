if ds_list_find_index(global.dslist, self.id) {
	instance_destroy(self, false)
	if global.tileset != noone {
		var tilemap = layer_tilemap_get_id(global.tileset)
		tilemap_set_at_pixel(tilemap, tile_set_empty(tilemap), x, y)
		tilemap_set_at_pixel(tilemap, tile_set_empty(tilemap), x + 32, y)
		tilemap_set_at_pixel(tilemap, tile_set_empty(tilemap), x, y + 32)
		tilemap_set_at_pixel(tilemap, tile_set_empty(tilemap), x + 32, y + 32)
	}
}
