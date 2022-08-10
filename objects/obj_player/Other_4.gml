// door check goes first
for (var i = 0; i < instance_number(obj_plrtransition); i++) {
	var daTrans = instance_find(obj_plrtransition, i)
	if daTrans.doorindex == global.targetDest {
		self.x = daTrans.x
		self.y = daTrans.y
	}
}

if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)

var titlethingy = instance_create_layer(0,0,"Instances",obj_roomtitle)

switch room
{
	case titlescreen: titlethingy.text = "Libre Tower: the free, open-source\nPizza Tower-like game" break;
	case room_init: titlethingy.text = "HOW ARE YOU HERE????" break;
	case testroom: titlethingy.text = "Testing, testing!" break;
	case hubroom: titlethingy.text = "Scaling the Tower, Door by Door" break;
	#region tutorial
	case tutorial_1:
		titlethingy.text = "Learn to Libre Tower"
		break;
	case tutorial_2:
		titlethingy.text = "Higher!"
		break;
	case tutorial_3:
		titlethingy.text = "Dash and Destroy"
		break;
	case tutorial_4:
		titlethingy.text = "One Way to Break Out"
		break;
	case tutorial_5:
		titlethingy.text = "Rocket Thrusters, Engage!"
		break;
	case tutorial_6:
		titlethingy.text = "This one's really simple, you could probably figure this one out easily."
		break;
	#endregion
	#region entrance
	case entrance_1:
		titlethingy.text = "So begins the journey..."
		break;
	case entrance_2:
		titlethingy.text = "Get some speed!"
		break;
	case entrance_3:
		titlethingy.text = "Crate Nesting Area"
		break;
	case entrance_4:
		titlethingy.text = "This place'll look familiar in a moment."
		break;
	case entrance_5:
		titlethingy.text = "How High Can You Get?"
		break;
	#endregion
	#region chateau
	case chateau_1:
		titlethingy.text = "Tower of Doom"
		break;
	#endregion
	#region agm facility
	case agm_1:
		titlethingy.text = "AGM's Hellspawn Facility"
		global.rank_req = 1120
		global.secret_req = 2
		global.detrixie_req = 3
		break;
	case agm_2:
		titlethingy.text = "Strangely Under Construction"
		break;
	case agm_3:
		titlethingy.text = "Under and Over"
		break;
	case agm_4:
		titlethingy.text = "The Blocks are Aggressive"
		break;
	case agm_5:
		titlethingy.text = "Switch of DOOM"
		break;
	case agm_secret1:
		titlethingy.text = "Factorial 3 and 4 Spare"
		break;
	case agm_secret2:
		titlethingy.text = "Bunny Hop"
		break;
	#endregion
	#region armory
	case armory_1:
		titlethingy.text = "Uh-Oh, It's The Military!"
		break;
	case armory_left1:
		titlethingy.text = "Into the Army Depths"
		break;
	case armory_left2:
		titlethingy.text = "Not So OSHA Compliant Now"
		break;
	#endregion
	case endscreen: instance_destroy(obj_roomtitle) break; // No more obj_roomtitle. It's gone. Go home, it's over.
}

// scr_playerspr()