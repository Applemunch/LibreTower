if !global.tileset instance_destroy(self) exit; // no tileset? don't bother existing
if array_find(global.dslist, self.id) removeTiles()