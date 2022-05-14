event_inherited()
/*
var isRoomHere = false
for (var i = 0; i < array_length(global.tiledestroy_rooms); i++) {
	if global.tiledestroy_rooms == room {
		isRoomHere = true
	}
}

var layerid = layer_get_id("Tiles_1")
if layerid != -1 and !isRoomHere {
	var tiledata = tilemap_get(
		layer_tilemap_get_id(layerid),
		tilemap_get_cell_x_at_pixel(layer_tilemap_get_id(layerid), x, y),
		tilemap_get_cell_y_at_pixel(layer_tilemap_get_id(layerid), x, y)
	)
	tile_set_empty(tiledata)
	array_push(global.tiledestroy_locations, tiledata)
	array_push(global.tiledestroy_rooms, room)
}
*/