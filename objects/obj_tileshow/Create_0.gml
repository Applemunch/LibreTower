// @description Shows hidden tiles when the player touches this trigger

function removeTiles() {
	array_push(global.dslist, self.id)
	instance_destroy(self)
	if !global.tileset exit; // no tileset? then stop the function here
	var tilemap = layer_tilemap_get_id(global.tileset)
	var ix = 0
	var iy = 0
	while iy < image_yscale {
		ix = 0
		while ix < image_xscale {
			tilemap_set_at_pixel(tilemap, tile_set_empty(tilemap), x + (ix * 32), y + (iy * 32))
			ix++
		}
		iy++
	}
}