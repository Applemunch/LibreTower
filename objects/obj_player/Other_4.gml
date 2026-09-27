// door check goes first
for (var i = 0; i < instance_number(obj_plrtransition); i++) {
	var daTrans = instance_find(obj_plrtransition, i)
	if daTrans.doorindex == global.targetDest {
		x = daTrans.x
		y = daTrans.y
	}
}

if instance_exists(obj_roomtitle) instance_destroy(obj_roomtitle)

var titlethingy = instance_create_layer(0,0,"Instances",obj_roomtitle)

switch room
{
	case titlescreen: titlethingy.text = "Ping Pong Tower\nLibreTower Tournament Edition" break;
	case room_init: titlethingy.text = "Tournament setup" break;
	case testroom: titlethingy.text = "Practice Table" break;
	case hubroom: titlethingy.text = "Ping Pong Club - Choose a Table" break;
	#region tutorial
	case tutorial_1:
		titlethingy.text = "Training 1 - First Serve"
		global.rank_req = 200
		global.secret_req = 0
		global.detrixie_req = 3
		break;
	case tutorial_2:
		titlethingy.text = "Training 2 - High Bounce"
		break;
	case tutorial_3:
		titlethingy.text = "Training 3 - Smash and Dash"
		break;
	case tutorial_4:
		titlethingy.text = "Training 4 - Net Breaker"
		break;
	case tutorial_5:
		titlethingy.text = "Training 5 - Rocket Rally"
		break;
	case tutorial_6:
		titlethingy.text = "Training Final - Match Point"
		break;
	#endregion
	#region entrance
	case entrance_1:
		titlethingy.text = "Open Qualifier - First Round"
		break;
	case entrance_2:
		titlethingy.text = "Open Qualifier - Speed Rally"
		break;
	case entrance_3:
		titlethingy.text = "Open Qualifier - Ball Crates"
		break;
	case entrance_4:
		titlethingy.text = "Open Qualifier - Return Serve"
		break;
	case entrance_5:
		titlethingy.text = "Open Qualifier - High Table"
		break;
	#endregion
	#region chateau
	case chateau_1:
		titlethingy.text = "Champions Table"
		break;
	case chateau_2:
		titlethingy.text = "Champions Table - Second Set"
		break;
	#endregion
	#region agm facility
	case agm_1:
		titlethingy.text = "Neon Rally - Set One"
		global.rank_req = 1120
		global.secret_req = 2
		global.detrixie_req = 3
		break;
	case agm_2:
		titlethingy.text = "Neon Rally - Construction Table"
		break;
	case agm_3:
		titlethingy.text = "Neon Rally - Under and Over"
		break;
	case agm_4:
		titlethingy.text = "Neon Rally - Aggressive Blocks"
		break;
	case agm_5:
		titlethingy.text = "FINAL MATCH - RAQUETAO"
		break;
	case agm_secret1:
		titlethingy.text = "Secret Table - Spare Set"
		break;
	case agm_secret2:
		titlethingy.text = "Secret Table - Bunny Rally"
		break;
	#endregion
	#region armory
	case armory_1:
		titlethingy.text = "Robot League"
		break;
	case armory_left1:
		titlethingy.text = "Robot League - Lower Tables"
		break;
	case armory_left2:
		titlethingy.text = "Robot League - Hazard Rally"
		break;
	case armory_left3:
		titlethingy.text = "Robot League - Golden Key"
		break;
	#endregion
	case endscreen: instance_destroy(obj_roomtitle) break;
}

