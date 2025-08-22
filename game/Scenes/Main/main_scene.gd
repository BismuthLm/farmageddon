extends Node2D

func _on_hour_timer_timeout():
	#If time of day is smaller than 24 then it adds one to it
	if Globals.time_of_day < 24:
		Globals.time_of_day += 1
	else:
		#Otherwise it changes it to 1
		Globals.time_of_day = 1
	$HourTimer.start()
	print(Globals.time_of_day)

#When sleeping
func _process(_delta):
	#If time of day is bigger or equal to 20 then sleeping is equal to true and time of day is set to 6
	if Globals.sleeping == true:
		if Globals.time_of_day >= 20:
			Globals.sleeping = false
			Globals.time_of_day = 6
			$HourTimer.start()
			print("Sleeping")
			print(Globals.time_of_day)
		else:
			print("You Cannot Sleep Yet")




func character_entered_house():
	var tween = create_tween()
	tween.tween_property($Character,"speed",0,0.25)
	TransitionLayer.change_scene("res://Scenes/Main/Inside/inside.tscn")


func _on_door_area_area_entered(area):
	if area in get_tree().get_nodes_in_group('Character'):
		character_entered_house()
		TransitionLayer.change_scene("res://Scenes/Main/Inside/inside.tscn")
