index = 0 // changes dynamically based on detrixies collected

for (var i = 0; i < 4; i++) {
	if global.detrixies[i] == 1 {
		index += 1
	} else break;
}

if global.detrixies[index] == 1 or ds_list_find_index(global.dslist, self.id) instance_destroy(self)