if array_find(global.dslist, self.id) {
	instance_destroy(self, false)
	if global.tileset {
		var tilemap = layer_tilemap_get_id(global.tileset)
		tilemap_set_at_pixel(tilemap, tile_set_empty(tilemap), x, y)
	}
}
