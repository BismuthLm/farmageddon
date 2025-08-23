extends Node2D



func _on_sleep_sleep():
	#If time of day is bigger or equal to 20 then sleeping is equal to true and time of day is set to 6
	if Globals.time_of_day >= 20:
		Globals.sleeping = true
		Globals.time_of_day = 6
		$HourTimer.start()
		print("Sleeping")
		print(Globals.time_of_day)
	else:
		print("You Cannot Sleep Yet")

func character_exiting_house():
	var tween = create_tween()
	tween.tween_property($Character,"speed",0,0.25)
	TransitionLayer.change_scene("res://Scenes/Main/main_scene.tscn")

func _on_door_area_area_entered(area):
	if area in get_tree().get_nodes_in_group('Character'):
		character_exiting_house()
		TransitionLayer.change_scene("res://Scenes/Main/main_scene.tscn")
