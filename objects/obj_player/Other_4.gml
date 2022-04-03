if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)

var titlethingy = instance_create_layer(0,0,"Instances",obj_roomtitle)

switch room
{
	case titlescreen: titlethingy.text = "Libre Tower: the free, open-source\nPizza Tower-like game" break;
	case room_init: titlethingy.text = "HOW ARE YOU HERE????" break;
	case testroom: titlethingy.text = "Testing, testing!" break;
	case hubroom: titlethingy.text = "Scaling the Tower, Door by Door" break;
	case agm_1:
		titlethingy.text = "AGM's Deepest Pit of Hell"
		break;
	case agm_2:
		titlethingy.text = "Strangely Under Construction"
		break;
	case agm_3:
		titlethingy.text = "Under and Over"
		break;
}

for (var i = 0; i < instance_number(obj_plrtransition); i++) {
	var daTrans = instance_find(obj_plrtransition, i)
	if daTrans.doorindex == global.targetDest {
		self.x = daTrans.x
		self.y = daTrans.y
	}
}