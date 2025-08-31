extends CanvasLayer

var selected: Color = Color("ffffff")
var not_selected: Color = Color("434343")
var alive_heart: Color = Color("ffffffff")
var dead_heart: Color = Color("ffffff00")

func _process(_delta):
	if Input.is_action_just_released("scroll down"):
		if Globals.plant_selected == 0:
			Globals.plant_selected = 1
			print("Plant selected is Carrot")
			$Control/Beetroot.modulate = not_selected
			$Control/Carrot.modulate = selected

	if Input.is_action_just_released("scroll up"):
		if Globals.plant_selected == 1:
			Globals.plant_selected = 0
			print("Plant selected is Beetroot")
			$Control/Beetroot.modulate = selected
			$Control/Carrot.modulate = not_selected
		
	if Globals.player_health == 5:
		$Control4/Sprite2D.modulate = alive_heart
		$Control4/Sprite2D2.modulate = alive_heart
		$Control4/Sprite2D3.modulate = alive_heart
		$Control4/Sprite2D4.modulate = alive_heart
		$Control4/Sprite2D5.modulate = alive_heart
	
	if Globals.player_health == 4:
		$Control4/Sprite2D.modulate = dead_heart
		$Control4/Sprite2D2.modulate = alive_heart
		$Control4/Sprite2D3.modulate = alive_heart
		$Control4/Sprite2D4.modulate = alive_heart
		$Control4/Sprite2D5.modulate = alive_heart
	
	if Globals.player_health == 3:
		$Control4/Sprite2D.modulate = dead_heart
		$Control4/Sprite2D2.modulate = dead_heart
		$Control4/Sprite2D3.modulate = alive_heart
		$Control4/Sprite2D4.modulate = alive_heart
		$Control4/Sprite2D5.modulate = alive_heart
		
	if Globals.player_health == 2:
		$Control4/Sprite2D.modulate = dead_heart
		$Control4/Sprite2D2.modulate = dead_heart
		$Control4/Sprite2D3.modulate = dead_heart
		$Control4/Sprite2D4.modulate = alive_heart
		$Control4/Sprite2D5.modulate = alive_heart
	
	if Globals.player_health == 1:
		$Control4/Sprite2D.modulate = dead_heart
		$Control4/Sprite2D2.modulate = dead_heart
		$Control4/Sprite2D3.modulate = dead_heart
		$Control4/Sprite2D4.modulate = dead_heart
		$Control4/Sprite2D5.modulate = alive_heart
		
	if Globals.player_health <= 0:
		$Control5/Sprite2D.visible = true
		
	
	$"Control/BeetrootAmount".text = str(Globals.beetroot_amount)
	$"Control/CarrotAmount".text = str(Globals.carrot_amount)
	$"Control2/MoneyAmount".text = str(Globals.gold_amount)
	
	if Globals.time_of_day == 1:
		$Control3/Time.text = str("1:00 AM")
		
	if Globals.time_of_day == 2:
		$Control3/Time.text = str("2:00 AM")
		
	if Globals.time_of_day == 3:
		$Control3/Time.text = str("3:00 AM")
		
	if Globals.time_of_day == 4:
		$Control3/Time.text = str("4:00 AM")
		
	if Globals.time_of_day == 5:
		$Control3/Time.text = str("5:00 AM")
		
	if Globals.time_of_day == 6:
		$Control3/Time.text = str("6:00 AM")
		
	if Globals.time_of_day == 7:
		$Control3/Time.text = str("7:00 AM")
		
	if Globals.time_of_day == 8:
		$Control3/Time.text = str("8:00 AM")
		
	if Globals.time_of_day == 9:
		$Control3/Time.text = str("9:00 AM")
		
	if Globals.time_of_day == 10:
		$Control3/Time.text = str("10:00 AM")
		
	if Globals.time_of_day == 11:
		$Control3/Time.text = str("11:00 AM")
		
	if Globals.time_of_day == 12:
		$Control3/Time.text = str("12:00 PM")
		
	if Globals.time_of_day == 13:
		$Control3/Time.text = str("1:00 PM")
		
	if Globals.time_of_day == 14:
		$Control3/Time.text = str("2:00 PM")
		
	if Globals.time_of_day == 15:
		$Control3/Time.text = str("3:00 PM")
		
	if Globals.time_of_day == 16:
		$Control3/Time.text = str("4:00 PM")
		
	if Globals.time_of_day == 17:
		$Control3/Time.text = str("5:00 PM")
		
	if Globals.time_of_day == 18:
		$Control3/Time.text = str("6:00 PM")
		
	if Globals.time_of_day == 19:
		$Control3/Time.text = str("7:00 PM")
		
	if Globals.time_of_day == 20:
		$Control3/Time.text = str("8:00 PM")
		
	if Globals.time_of_day == 21:
		$Control3/Time.text = str("9:00 PM")
		
	if Globals.time_of_day == 22:
		$Control3/Time.text = str("10:00 PM")
		
	if Globals.time_of_day == 23:
		$Control3/Time.text = str("11:00 PM")
		
	if Globals.time_of_day == 24:
		$Control3/Time.text = str("12:00 AM")
